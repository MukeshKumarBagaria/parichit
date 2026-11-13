# Parichit (परिचित)

Private, offline-first family tree and personal network manager — Hindi + English.
The full product and technical blueprint is in [parichit-idea.md](parichit-idea.md).

## Quick start

```bash
flutter pub get                       # also generates localizations
dart run build_runner build           # Drift database code (*.g.dart)
flutter run                           # local-only mode, no account needed
flutter run --dart-define-from-file=env/dev.json   # with Supabase sync configured
```

Toolchain: **Flutter 3.47.9 / Dart 3.13.7** (pinned in CI). Android Studio + Android SDK are needed to run on a
phone or emulator.

Cloud setup (optional, milestone 6): create a Supabase project, run
[supabase/migrations](supabase/migrations) in the SQL editor, copy `env/example.json` to `env/dev.json` and fill in
the project URL and publishable key. `env/*.json` is git-ignored.

## Architecture

Feature-first, with clean layers inside each feature:

```
lib/
├── main.dart, bootstrap.dart, app.dart   # startup: key → encrypted DB → settings → (Supabase) → runApp
├── core/                                 # cross-cutting, no feature knowledge
│   ├── config/        build-time config (--dart-define)
│   ├── database/      Drift database, tables (mirror of the Supabase schema), connection
│   ├── di/            core Riverpod providers (database, clock, ids, outbox)
│   ├── l10n/          context.l10n helper
│   ├── logging/       logging facade
│   ├── router/        GoRouter, bottom-tab shell, route constants
│   ├── security/      database encryption key (platform keystore)
│   ├── sync/          sync outbox (push/pull engine arrives in milestone 6)
│   ├── theme/         design tokens, Material 3 themes, relation colours
│   └── utils/         ids (UUID v7), phone normalisation, search text
├── shared/widgets/                       # reusable UI: PersonAvatar, RelationChip, EmptyState, SectionCard
├── features/<feature>/
│   ├── domain/        entities + repository interfaces (pure Dart, no Flutter/Drift)
│   ├── data/          repository implementations (Drift)
│   └── presentation/  screens, widgets, Riverpod providers
└── l10n/              app_en.arb, app_hi.arb (+ generated/)
packages/kinship/      # pure-Dart kinship engine — tested with `dart test`, no Flutter
supabase/migrations/   # cloud schema: RLS, triggers, graph validation
drift_schemas/         # snapshots of each local schema version (migration safety)
```

### Rules that keep it maintainable

1. **Dependencies point inward.** `presentation → domain ← data`. Widgets never touch Drift or Supabase; they read
   providers, which use repository interfaces from `domain/`.
2. **Offline-first.** The local database is the source of truth; every screen reads reactive Drift streams.
3. **Every write is one transaction that also writes the sync outbox** (`OutboxWriter`). Never write a synced table
   without enqueueing it.
4. **Never hard-delete.** Set `deletedAt`; dependents are soft-deleted in the same transaction and can be restored.
5. **Store facts, derive relations.** Only parent–child, partnership and social edges are stored; relation names are
   computed by `packages/kinship`.
6. **No hard-coded strings or colours.** Text comes from ARB files (`context.l10n`), colours from the theme.
7. **Schema changes:** bump `schemaVersion`, add a migration step, run
   `dart run drift_dev schema dump lib/core/database/app_database.dart drift_schemas/drift_schema_vN.json`, and add a
   matching Supabase migration.
8. **Inject, don't construct.** Clock, id generator and database come from providers so tests can override them.

## Quality checks

```bash
dart format lib test                  # 120-column style (analysis_options.yaml)
flutter analyze --fatal-infos
flutter test
(cd packages/kinship && dart test)
```

CI (`.github/workflows/ci.yml`) runs all of the above, plus a check that generated code is up to date, on every push
and pull request.

### Windows + Smart App Control

With Windows 11 **Smart App Control** on, unsigned Flutter engine binaries such as `flutter_tester.exe` (used by
`flutter test`) and very new SDK releases are blocked. On such a PC:

- `flutter analyze`, `dart format`, `build_runner` and `dart test` in `packages/kinship` work.
- `flutter test` is blocked; rely on CI, or turn Smart App Control off (Windows Security → App & browser control).
  Note that on many Windows versions it cannot be turned back on without resetting Windows.
- `pubspec.yaml` points the *Windows host* build of SQLite at the signed system `winsqlite3.dll` so Dart tooling can
  open databases. Android/iOS still use the encrypted SQLite3MultipleCiphers build.
