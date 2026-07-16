[//]: # (moved verbatim from AGENTS.md 2026-07-15 — Codex 32KB instruction-cap diet)

### Wine on macOS (post-deprecation)

Homebrew's `wine-stable`, `wine@staging`, and `wine@devel` casks
are all deprecated and **will be disabled on 2026-09-01** (Apple
Gatekeeper blocks the unsigned x86_64 binaries). The migration
landed in [brief 026](../../docs/briefs/026-wine-migration-prep.md):
fresh macOS brains install
[Gcenx's Game Porting Toolkit cask](https://github.com/Gcenx/homebrew-wine)
instead — the install command is in *Brain onboarding* step 6
above. Rationale + verified-baseline write-up:
[`docs/research/wine-migration.md`](../../docs/research/wine-migration.md).

Existing brains already on `wine-stable` keep working past the
deadline (the binary on disk doesn't disappear); migrate at the
next reinstall or when the cask conflict bites a fresh
configure.

On **Windows**, `dsd` is shipped as `./dsd.exe`; on **macOS/Linux** it's
`./dsd`. The `dsd check modules` invocation adapts accordingly.

