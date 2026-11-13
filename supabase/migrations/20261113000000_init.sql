-- =====================================================================
-- Parichit · 0001_init.sql
-- Offline-first, single-owner schema with graph-based kinship.
-- =====================================================================

create extension if not exists pgcrypto;
create extension if not exists pg_trgm;   -- fuzzy name search on the server

-- Monotonic cursor used by devices to pull changes.
create sequence if not exists public.sync_seq;
grant usage on sequence public.sync_seq to authenticated;

-- ---------------------------------------------------------------------
-- Shared trigger: last-write-wins guard + sync stamping.
-- Named "a_..." so it fires BEFORE the "b_validate" triggers
-- (Postgres fires same-event triggers in alphabetical order).
-- ---------------------------------------------------------------------
create or replace function public.tg_sync_row()
returns trigger
language plpgsql
as $$
begin
  if tg_op = 'UPDATE' then
    -- Ignore stale writes coming from an older edit on another device.
    if new.updated_at < old.updated_at then
      return null;
    end if;
    new.owner_id   := old.owner_id;     -- ownership can never change
    new.created_at := old.created_at;
  end if;
  new.server_seq        := nextval('public.sync_seq');
  new.server_updated_at := now();
  return new;
end
$$;

-- =====================================================================
-- TABLES (domain columns; sync columns are added in one loop below)
-- =====================================================================

create table public.places (
  id               uuid primary key default gen_random_uuid(),
  owner_id         uuid not null default auth.uid() references auth.users (id) on delete cascade,
  name             text not null check (length(btrim(name)) > 0),
  name_alt         text,                                  -- other script: सीकर / Sikar
  place_type       text not null default 'village'
                   check (place_type in ('village','town','city','tehsil','district','state','country','other')),
  parent_place_id  uuid,
  pincode          text,
  latitude         double precision,
  longitude        double precision,
  unique (owner_id, id),
  check (parent_place_id is null or parent_place_id <> id)
);
alter table public.places
  add foreign key (owner_id, parent_place_id) references public.places (owner_id, id);

create table public.people (
  id                 uuid primary key default gen_random_uuid(),
  owner_id           uuid not null default auth.uid() references auth.users (id) on delete cascade,
  full_name          text not null check (length(btrim(full_name)) > 0),
  full_name_alt      text,                                -- same name in the other script
  nickname           text,
  surname            text,
  gender             text not null default 'unknown'
                     check (gender in ('male','female','other','unknown')),
  is_living          boolean,                             -- null = not known
  birth_year         smallint check (birth_year between 1000 and 2200),
  birth_month        smallint check (birth_month between 1 and 12),
  birth_day          smallint check (birth_day between 1 and 31),
  birth_date_approx  boolean not null default false,
  birth_order        smallint check (birth_order between 1 and 30),  -- among siblings, when DOB unknown
  death_year         smallint check (death_year between 1000 and 2200),
  death_month        smallint check (death_month between 1 and 12),
  death_day          smallint check (death_day between 1 and 31),
  birth_place_id     uuid,
  native_place_id    uuid,                                -- पैतृक गाँव
  gotra              text,
  occupation         text,
  organization       text,
  designation        text,
  education          text,
  notes              text,
  is_self            boolean not null default false,      -- the app owner ("Me")
  is_placeholder     boolean not null default false,      -- unknown person kept for structure
  is_favorite        boolean not null default false,
  notify_birthday    boolean not null default true,
  merged_into_id     uuid,
  unique (owner_id, id),
  foreign key (owner_id, birth_place_id)  references public.places (owner_id, id),
  foreign key (owner_id, native_place_id) references public.places (owner_id, id),
  check (birth_day   is null or birth_month is not null),
  check (death_day   is null or death_month is not null),
  check (death_year  is null or birth_year is null or death_year >= birth_year),
  check (merged_into_id is null or merged_into_id <> id)
);
alter table public.people
  add foreign key (owner_id, merged_into_id) references public.people (owner_id, id);

create table public.person_names (
  id         uuid primary key default gen_random_uuid(),
  owner_id   uuid not null default auth.uid() references auth.users (id) on delete cascade,
  person_id  uuid not null,
  name       text not null check (length(btrim(name)) > 0),
  name_type  text not null default 'alias'
             check (name_type in ('alias','nickname','maiden','other_script','title','spelling')),
  unique (owner_id, id),
  foreign key (owner_id, person_id) references public.people (owner_id, id)
);

create table public.person_contacts (
  id                uuid primary key default gen_random_uuid(),
  owner_id          uuid not null default auth.uid() references auth.users (id) on delete cascade,
  person_id         uuid not null,
  kind              text not null check (kind in ('phone','email','website','social','other')),
  value             text not null,
  normalized_value  text,                                 -- E.164 for phones, lowercase for email
  label             text,                                 -- personal / work / home …
  is_whatsapp       boolean not null default false,
  is_primary        boolean not null default false,
  unique (owner_id, id),
  foreign key (owner_id, person_id) references public.people (owner_id, id)
);

create table public.person_addresses (
  id            uuid primary key default gen_random_uuid(),
  owner_id      uuid not null default auth.uid() references auth.users (id) on delete cascade,
  person_id     uuid not null,
  label         text not null default 'home' check (label in ('home','native','work','other')),
  address_line  text,
  place_id      uuid,
  pincode       text,
  latitude      double precision,
  longitude     double precision,
  is_primary    boolean not null default false,
  unique (owner_id, id),
  foreign key (owner_id, person_id) references public.people (owner_id, id),
  foreign key (owner_id, place_id)  references public.places (owner_id, id)
);

create table public.person_attributes (
  id         uuid primary key default gen_random_uuid(),
  owner_id   uuid not null default auth.uid() references auth.users (id) on delete cascade,
  person_id  uuid not null,
  key        text not null check (length(btrim(key)) > 0),
  value      text,
  unique (owner_id, id),
  foreign key (owner_id, person_id) references public.people (owner_id, id)
);

-- ----------------------------- FAMILY GRAPH --------------------------

create table public.parent_child (
  id         uuid primary key default gen_random_uuid(),
  owner_id   uuid not null default auth.uid() references auth.users (id) on delete cascade,
  parent_id  uuid not null,
  child_id   uuid not null,
  kind       text not null default 'biological'
             check (kind in ('biological','adoptive','step','foster','guardian')),
  certainty  text not null default 'confirmed'
             check (certainty in ('confirmed','probable','unverified')),
  notes      text,
  unique (owner_id, id),
  foreign key (owner_id, parent_id) references public.people (owner_id, id),
  foreign key (owner_id, child_id)  references public.people (owner_id, id),
  check (parent_id <> child_id)
);

create table public.partnerships (
  id                 uuid primary key default gen_random_uuid(),
  owner_id           uuid not null default auth.uid() references auth.users (id) on delete cascade,
  person_a_id        uuid not null,                       -- always the smaller UUID
  person_b_id        uuid not null,
  kind               text not null default 'marriage'
                     check (kind in ('marriage','engagement','live_in','other')),
  status             text not null default 'active'
                     check (status in ('active','divorced','separated','widowed','annulled')),
  start_year         smallint check (start_year between 1000 and 2200),
  start_month        smallint check (start_month between 1 and 12),
  start_day          smallint check (start_day between 1 and 31),
  start_date_approx  boolean not null default false,
  end_year           smallint check (end_year between 1000 and 2200),
  place_id           uuid,
  notes              text,
  unique (owner_id, id),
  foreign key (owner_id, person_a_id) references public.people (owner_id, id),
  foreign key (owner_id, person_b_id) references public.people (owner_id, id),
  foreign key (owner_id, place_id)    references public.places (owner_id, id),
  check (person_a_id < person_b_id),                      -- canonical order ⇒ no duplicates, no self
  check (start_day is null or start_month is not null)
);

create table public.social_connections (
  id               uuid primary key default gen_random_uuid(),
  owner_id         uuid not null default auth.uid() references auth.users (id) on delete cascade,
  person_id        uuid not null,                         -- for 'introduced': person introduced other
  other_person_id  uuid not null,
  connection_type  text not null
                   check (connection_type in ('friend','colleague','business','neighbour','classmate',
                                              'teacher','mentor','introduced','political','community','other')),
  description      text,
  since_year       smallint check (since_year between 1900 and 2200),
  unique (owner_id, id),
  foreign key (owner_id, person_id)       references public.people (owner_id, id),
  foreign key (owner_id, other_person_id) references public.people (owner_id, id),
  check (person_id <> other_person_id)
);

-- ----------------------------- GROUPING ------------------------------

create table public.family_groups (
  id               uuid primary key default gen_random_uuid(),
  owner_id         uuid not null default auth.uid() references auth.users (id) on delete cascade,
  name             text not null check (length(btrim(name)) > 0),   -- "Sharma Parivar, Sikar"
  name_alt         text,
  gotra            text,
  kuldevta         text,
  native_place_id  uuid,
  head_person_id   uuid,
  notes            text,
  unique (owner_id, id),
  foreign key (owner_id, native_place_id) references public.places (owner_id, id),
  foreign key (owner_id, head_person_id)  references public.people (owner_id, id)
);

create table public.family_group_members (
  id               uuid primary key default gen_random_uuid(),
  owner_id         uuid not null default auth.uid() references auth.users (id) on delete cascade,
  family_group_id  uuid not null,
  person_id        uuid not null,
  role             text,
  unique (owner_id, id),
  foreign key (owner_id, family_group_id) references public.family_groups (owner_id, id),
  foreign key (owner_id, person_id)       references public.people (owner_id, id)
);

create table public.tags (
  id        uuid primary key default gen_random_uuid(),
  owner_id  uuid not null default auth.uid() references auth.users (id) on delete cascade,
  name      text not null check (length(btrim(name)) > 0),
  name_alt  text,
  color     text check (color ~ '^#[0-9A-Fa-f]{6}$'),
  icon      text,
  unique (owner_id, id)
);

create table public.person_tags (
  id         uuid primary key default gen_random_uuid(),
  owner_id   uuid not null default auth.uid() references auth.users (id) on delete cascade,
  person_id  uuid not null,
  tag_id     uuid not null,
  unique (owner_id, id),
  foreign key (owner_id, person_id) references public.people (owner_id, id),
  foreign key (owner_id, tag_id)    references public.tags (owner_id, id)
);

-- ----------------------------- NETWORK ------------------------------

create table public.interactions (
  id                uuid primary key default gen_random_uuid(),
  owner_id          uuid not null default auth.uid() references auth.users (id) on delete cascade,
  title             text,
  interaction_type  text not null default 'in_person'
                    check (interaction_type in ('in_person','visit','phone_call','video_call',
                                                'message','event','other')),
  occurred_at       timestamptz not null,
  duration_minutes  integer check (duration_minutes >= 0),
  place_id          uuid,
  location_text     text,
  latitude          double precision,
  longitude         double precision,
  notes             text,
  follow_up_on      date,
  unique (owner_id, id),
  foreign key (owner_id, place_id) references public.places (owner_id, id)
);

create table public.interaction_participants (
  id              uuid primary key default gen_random_uuid(),
  owner_id        uuid not null default auth.uid() references auth.users (id) on delete cascade,
  interaction_id  uuid not null,
  person_id       uuid not null,
  role            text not null default 'participant'
                  check (role in ('participant','host','introducer')),
  unique (owner_id, id),
  foreign key (owner_id, interaction_id) references public.interactions (owner_id, id),
  foreign key (owner_id, person_id)      references public.people (owner_id, id)
);

create table public.reminders (
  id              uuid primary key default gen_random_uuid(),
  owner_id        uuid not null default auth.uid() references auth.users (id) on delete cascade,
  person_id       uuid,
  interaction_id  uuid,
  reminder_type   text not null default 'follow_up'
                  check (reminder_type in ('follow_up','call','visit','custom')),
  title           text not null check (length(btrim(title)) > 0),
  due_at          timestamptz not null,
  recurrence      text not null default 'none'
                  check (recurrence in ('none','weekly','monthly','yearly')),
  notes           text,
  completed_at    timestamptz,
  unique (owner_id, id),
  foreign key (owner_id, person_id)      references public.people (owner_id, id),
  foreign key (owner_id, interaction_id) references public.interactions (owner_id, id)
);

create table public.media (
  id              uuid primary key default gen_random_uuid(),
  owner_id        uuid not null default auth.uid() references auth.users (id) on delete cascade,
  person_id       uuid,
  interaction_id  uuid,
  kind            text not null check (kind in ('profile_photo','photo','document','voice_note')),
  file_name       text not null,          -- object key in storage = '<owner_id>/<file_name>'
  mime_type       text not null,
  size_bytes      bigint check (size_bytes >= 0),
  width           integer,
  height          integer,
  duration_ms     integer,
  sha256          text,
  caption         text,
  taken_at        timestamptz,
  unique (owner_id, id),
  foreign key (owner_id, person_id)      references public.people (owner_id, id),
  foreign key (owner_id, interaction_id) references public.interactions (owner_id, id),
  check (person_id is not null or interaction_id is not null)
);

create table public.person_merges (
  id           uuid primary key default gen_random_uuid(),
  owner_id     uuid not null default auth.uid() references auth.users (id) on delete cascade,
  survivor_id  uuid not null,
  merged_id    uuid not null,
  snapshot     jsonb not null,             -- full copy of the merged person + moved edge ids (for undo)
  unique (owner_id, id),
  foreign key (owner_id, survivor_id) references public.people (owner_id, id),
  foreign key (owner_id, merged_id)   references public.people (owner_id, id),
  check (survivor_id <> merged_id)
);

-- =====================================================================
-- SYNC COLUMNS + SYNC TRIGGER + RLS, applied uniformly to every table
-- =====================================================================
do $$
declare
  t text;
  synced_tables text[] := array[
    'places','people','person_names','person_contacts','person_addresses','person_attributes',
    'parent_child','partnerships','social_connections',
    'family_groups','family_group_members','tags','person_tags',
    'interactions','interaction_participants','reminders','media','person_merges'
  ];
begin
  foreach t in array synced_tables loop
    execute format($f$
      alter table public.%1$I
        add column created_at        timestamptz not null default now(),
        add column updated_at        timestamptz not null default now(),  -- edit time on device (LWW)
        add column deleted_at        timestamptz,                         -- soft delete / tombstone
        add column server_seq        bigint      not null default 0,      -- pull cursor
        add column server_updated_at timestamptz not null default now(),
        add column device_id         text
    $f$, t);

    execute format('create index %1$s_sync_idx on public.%1$I (owner_id, server_seq)', t);

    execute format($f$
      create trigger a_sync_row before insert or update on public.%1$I
      for each row execute function public.tg_sync_row()
    $f$, t);

    execute format('alter table public.%1$I enable row level security', t);

    execute format($f$
      create policy %1$s_select on public.%1$I for select to authenticated
      using (owner_id = (select auth.uid()))
    $f$, t);
    execute format($f$
      create policy %1$s_insert on public.%1$I for insert to authenticated
      with check (owner_id = (select auth.uid()))
    $f$, t);
    execute format($f$
      create policy %1$s_update on public.%1$I for update to authenticated
      using (owner_id = (select auth.uid()))
      with check (owner_id = (select auth.uid()))
    $f$, t);
    -- No DELETE policy: clients soft-delete; hard purge is an admin job.
  end loop;
end
$$;

-- =====================================================================
-- INDEXES (partial unique indexes ignore soft-deleted rows)
-- =====================================================================
create unique index people_single_self       on public.people (owner_id) where is_self and deleted_at is null;
create index people_name_trgm                on public.people using gin (full_name gin_trgm_ops);
create index people_name_alt_trgm            on public.people using gin (full_name_alt gin_trgm_ops);
create index people_native_place_idx         on public.people (native_place_id);

create unique index parent_child_active_uq   on public.parent_child (parent_id, child_id) where deleted_at is null;
create index parent_child_child_idx          on public.parent_child (child_id);
create unique index partnerships_active_uq   on public.partnerships (person_a_id, person_b_id) where deleted_at is null;
create index partnerships_b_idx              on public.partnerships (person_b_id);
create unique index social_active_uq         on public.social_connections (person_id, other_person_id, connection_type) where deleted_at is null;
create index social_other_idx                on public.social_connections (other_person_id);

create unique index tags_name_uq             on public.tags (owner_id, lower(name)) where deleted_at is null;
create unique index person_tags_uq           on public.person_tags (person_id, tag_id) where deleted_at is null;
create unique index family_members_uq        on public.family_group_members (family_group_id, person_id) where deleted_at is null;
create unique index participants_uq          on public.interaction_participants (interaction_id, person_id) where deleted_at is null;
create index participants_person_idx         on public.interaction_participants (person_id);
create index interactions_date_idx           on public.interactions (owner_id, occurred_at desc);
create index contacts_value_idx              on public.person_contacts (owner_id, normalized_value);
create index person_names_person_idx         on public.person_names (person_id);
create index addresses_person_idx            on public.person_addresses (person_id);
create index addresses_place_idx             on public.person_addresses (place_id);
create index media_person_idx                on public.media (person_id);
create index reminders_due_idx               on public.reminders (owner_id, due_at) where completed_at is null and deleted_at is null;
create index places_parent_idx               on public.places (parent_place_id);

-- =====================================================================
-- GRAPH VALIDATION (safety net; the app enforces the same rules offline)
-- =====================================================================
create or replace function public.tg_validate_parent_child()
returns trigger
language plpgsql
as $$
declare
  v_parent_gender text;
  v_bio_parents   int;
begin
  if new.deleted_at is not null then
    return new;                               -- deleting an edge is always allowed
  end if;

  -- 1. No cycles: the child must not already be an ancestor of the parent.
  if exists (
    with recursive ancestors(id) as (
      select pc.parent_id from public.parent_child pc
       where pc.child_id = new.parent_id and pc.deleted_at is null and pc.id <> new.id
      union
      select pc.parent_id from public.parent_child pc
        join ancestors a on pc.child_id = a.id
       where pc.deleted_at is null and pc.id <> new.id
    )
    select 1 from ancestors where id = new.child_id
  ) then
    raise exception 'GENEALOGY_CYCLE' using detail = 'A person cannot be their own ancestor.';
  end if;

  -- 2. At most two biological parents, at most one per known gender.
  if new.kind = 'biological' then
    select count(*) into v_bio_parents
      from public.parent_child
     where child_id = new.child_id and kind = 'biological'
       and deleted_at is null and id <> new.id;
    if v_bio_parents >= 2 then
      raise exception 'TOO_MANY_BIO_PARENTS' using detail = 'A person can have at most two biological parents.';
    end if;

    select gender into v_parent_gender from public.people where id = new.parent_id;
    if v_parent_gender in ('male','female') and exists (
      select 1
        from public.parent_child pc
        join public.people p on p.id = pc.parent_id
       where pc.child_id = new.child_id and pc.kind = 'biological'
         and pc.deleted_at is null and pc.id <> new.id
         and p.gender = v_parent_gender
    ) then
      raise exception 'DUPLICATE_BIO_PARENT_GENDER'
        using detail = 'This person already has a biological parent of this gender.';
    end if;
  end if;

  return new;
end
$$;

create trigger b_validate before insert or update on public.parent_child
for each row execute function public.tg_validate_parent_child();

-- =====================================================================
-- STORAGE: private bucket, files under '<owner_id>/...'
-- =====================================================================
insert into storage.buckets (id, name, public)
values ('parichit-media', 'parichit-media', false)
on conflict (id) do nothing;

create policy media_read on storage.objects for select to authenticated
  using (bucket_id = 'parichit-media' and (storage.foldername(name))[1] = (select auth.uid())::text);
create policy media_insert on storage.objects for insert to authenticated
  with check (bucket_id = 'parichit-media' and (storage.foldername(name))[1] = (select auth.uid())::text);
create policy media_update on storage.objects for update to authenticated
  using (bucket_id = 'parichit-media' and (storage.foldername(name))[1] = (select auth.uid())::text);
create policy media_delete on storage.objects for delete to authenticated
  using (bucket_id = 'parichit-media' and (storage.foldername(name))[1] = (select auth.uid())::text);
