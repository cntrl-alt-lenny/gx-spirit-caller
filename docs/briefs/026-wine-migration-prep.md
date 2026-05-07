### cloud/wine-migration-prep

**Goal:** Migrate the macOS wine dependency off `wine-stable` (and
its `@staging` / `@devel` siblings) onto an Apple Silicon-native
build before the homebrew casks are disabled on **2026-09-01**.
Non-urgent today (~4 months runway) but blocking everything if it
slips past the deadline.

**Context:**

`brew info --cask wine-stable` reports (as of 2026-05-07):

```
==> wine-stable (WineHQ-stable): 11.0_1
Deprecated because it does not pass the macOS Gatekeeper check!
It will be disabled on 2026-09-01.
```

The same disablement applies to `wine@staging` and `wine@devel`.
Root cause is Apple's Gatekeeper now blocking unsigned x86_64
binaries; WineHQ's homebrew casks haven't been re-signed for
arm64.

The notification users see in macOS:

> *"Wine Stable" support ending on macOS; update to Apple silicon
> version.*

In-app notification from the Wine app itself, with `+2` follow-ups.
Confirms WineHQ has begun shipping a separate Apple Silicon-native
distribution, but not via homebrew yet.

**What breaks if we don't migrate:**

- After 2026-09-01, fresh `brew install --cask wine-stable` will
  fail. AGENTS.md *Brain onboarding on a fresh machine* step 6
  fails before `ninja rom` can run.
- Existing installations may keep working past the deadline (the
  binary on disk doesn't disappear), but any reinstall / Apple
  Silicon migration / new contributor's setup breaks.
- `tools/get_platform.py` already maps Darwin → wine; no code
  change there until the binary location moves.

**Scope:**

Investigate and document the migration path. Land the result as:

- `docs/research/wine-migration.md` — research note in the same
  format as `docs/research/ov006-cluster-stuck.md`. Survey the
  options (WineHQ direct DMG, build-from-source via homebrew
  formula, Game Porting Toolkit, CrossOver if relevant), test at
  least one against the project's actual mwccarm.exe / mwasmarm.exe
  / mwldarm.exe invocations, recommend one path.
- AGENTS.md *Brain onboarding* update (proposed via PR; brain
  merges) — once a migration path is chosen, swap the
  `brew install --cask wine-stable` line for the new instructions.
- `tools/get_platform.py` — only if the new wine binary lives at
  a non-`PATH` location and we need to teach `configure.py` where
  to find it.

**Non-scope:**

- ❌ Decomping anything. Tools / docs / infrastructure only.
- ❌ Replacing wine with a non-wine alternative (e.g. native arm64
  builds of mwccarm). That's a much larger lift; if it surfaces as
  the right answer, raise it as a separate research follow-up.
- ❌ Updating the existing brain machine's setup before the
  research is done — brain stays on `wine-stable` until cloud's
  migration recommendation is reviewed and merged.

**Success:**

- One concrete recommended migration path with rationale.
- Verified against at least one full `ninja rom` build using the
  recommended wine binary, with the documented 24/27 dsd-check
  baseline preserved.
- AGENTS.md updated.
- PR body documents:
  - Each option considered, with the deal-breaker for the rejected
    options.
  - The exact install commands for the recommended path.
  - Any new env-var or `PATH` setup needed.

**Branch:** `cloud/wine-migration-prep`

**Priority:** Medium-low. Don't block higher-priority cluster work
on this. Reasonable target: land before 2026-08-01 (1 month buffer
before homebrew disables the casks).
