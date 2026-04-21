# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-21 afternoon, after the wave of 6 PRs
(#34 / #36 / #37 / #38 / #39 / #40) brought main to `1d8cb6f`.
cntrl_alt_lenny authorised cloud to refresh the file directly since
brain is busy on the decomp-coordination path. asm-vs-C decision
went to **C** (retroactively validated by the shape of #36's match).

**Baseline:** `ninja rom` succeeds, `./dsd.exe check modules` reports
24/27 OK. ARM9 main / DTCM / overlay 4 still fail — expected,
placeholder-symbol artifacts per CLAUDE.md, not caused by agent work.
ov005 stays ✅ after the #36 match landed there.

**Matched function count:** **18** (up from 17). Delta: +1 function,
+44 bytes. The new one is `__sinit_ov005_021b16e4` from PR #36 — the
first `0x2c`-byte CodeWarrior static-init stub matched, serving as
the template for the 43-sibling bulk propagation now in flight with
the decomper. `progress.py` ticks 100 → 144 bytes matched.

## Merged since last refresh (this session)

In landing order. Main tip: `1d8cb6f`.

- **PR #34** — `claude-brain/lint-fix-test-smoke-imports`. Ruff F401
  waiver for the test file's intentional smoke-imports. Brain's
  narrow follow-up to PR #27 ↔ #32 interaction.
- **PR #36** — `claude-pc/sinit-bulk-match`. Decomper's first
  `__sinit_*` match. Locally-externed `func_020b42f4`; surfaces the
  mwcc `#pragma define_section / #pragma section INIT begin/end`
  syntax find for `.init`-section symbol routing.
- **PR #35** — `claude-cloud/refresh-state-md`. Cloud's refresh of
  this file to the previous baseline (`bf1e978`).
- **PR #38** — `claude-cloud/tests-cover-tools`. Extends the unittest
  suite 56 → 86 tests, covering `rename_symbol.py` + `ci_format_diff.py`.
- **PR #39** — `claude-cloud/overlay-coupling-loads`. `--loads` mode
  for `overlay_coupling.py`. Surfaces ov001 / ov023 as even more
  standalone in the data dimension than they are on calls.
- **PR #40** — `claude-brain/progress-delinks-fallback`. Adds a
  delinks.txt fallback to `progress.py` so the README progress badge
  stops showing 0.00%-red in CI (CI can't run `ninja rom`, so
  `report.json` never exists there).
- **PR #37** — `claude-cloud/runtime-sinit-header`. Ships
  `libs/runtime/include/runtime/sinit.h` with a `__register_global_object`
  extern, to be shared by all 44 `__sinit_*` shells once the
  decomper's propagation migrates off locally-externed
  `func_020b42f4`. Opened draft with ⚠️ scope-check; brain promoted
  to ready after cntrl_alt_lenny picked C over asm.

## Earlier wave (2026-04-21 overnight, for historical context)

Landed before this session: PRs #28 → #30 → #31 → #29 → #27 → #33 →
#32 → #23 → #24 → #25 (wave order: editorconfig, PR/issue templates,
briefs index, PR labeler, analyzer test suite, progress badge,
ruff+markdownlint CI, analyzer tier-delta workflow, state.md split,
autonomy policy).

PR #26 (wiki duplicate of `CLAUDE.md`) closed without merging.

## In flight

- **`claude-pc` → brief 003 propagation.** After #36's template match
  and #37's shared header, the decomper propagates the `0x2c` pattern
  across the remaining 43 `__sinit_*` siblings in passing overlays.
  Workflow per sibling: `#include <runtime/sinit.h>`, drop the local
  `func_020b42f4` extern, `tools/rename_symbol.py` the symbol, rebuild,
  objdiff, commit. Expect 3-5 PRs batching by overlay (ov006 × 11 is
  the biggest single-overlay cluster; ov005 × 5, ov016 × 5 next).
- **Brain** — standing by for propagation PRs; will self-merge when
  cntrl_alt_lenny is AFK per AGENTS.md §3.
- **`claude-cloud`** — optional follow-ups while decomper propagates:
  - `generate_heatmap.py` delinks fallback (same pattern as #40 for
    progress.py). Branch: `claude-cloud/heatmap-delinks-fallback`.

## Next-brain TODO

1. Review each decomper propagation PR as it lands. Check `dsd check
   modules` still reports 24/27 OK after each merge (no accidental
   layout drift in the passing overlays).
2. After the full 43-sibling propagation completes, retire `#include`
   of the local `func_020b42f4` externs and let `<runtime/sinit.h>`
   become authoritative. Rename `func_020b42f4` →
   `__register_global_object` via `tools/rename_symbol.py`.
3. Refresh this file again after propagation wraps. Matched-function
   count will jump from 18 to ~62 in one wave.
4. Stale remote branch: `claude-pc/ov005-easy-tier` (PR #11 merged).
   Cloud gets HTTP 403 on `git push --delete`; any PC session or the
   GitHub UI clears it in one click.
5. `claude/*` (no-suffix) branches continue to land from GitHub's
   built-in Claude integration. Still respecting scope so far; no
   action needed.

## New agents?

Still no. Brain + decomper + cloud slot-split is holding under ~28
merged PRs over the first working day. Reopen the question if:

- Asset pipelines (graphics / audio) become a decomp target — likely
  a dedicated `asset-pc` agent at that point.
- PR-review latency becomes the bottleneck (brain backlogged) — at
  which point a second brain-class agent on a different machine could
  help, per the existing handoff-is-stateless design.
