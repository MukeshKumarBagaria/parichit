-- =====================================================================
-- Parichit · account deletion (Google Play "account deletion" policy)
--
-- Lets a signed-in user permanently delete their own account and ALL of
-- their cloud data from inside the app. Every table references auth.users
-- with ON DELETE CASCADE, so deleting the user row removes every row they own.
--
-- SECURITY DEFINER so it may delete from auth.users, but it only ever
-- deletes the caller (auth.uid()); anonymous callers are rejected.
-- =====================================================================

create or replace function public.delete_my_account()
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  uid uuid := auth.uid();
begin
  if uid is null then
    raise exception 'NOT_SIGNED_IN' using errcode = '42501';
  end if;
  delete from auth.users where id = uid;
end
$$;

revoke all on function public.delete_my_account() from public, anon;
grant execute on function public.delete_my_account() to authenticated;
