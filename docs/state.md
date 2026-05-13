# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-13 mid-morning, post-#407 + #408 merge.
Brain on Mac. Brief 060 self-extend 1/2 (wave 25) shipped 11
matches at 85% yield — combined waves 24+25 are 20 matches /
764 bytes / 80% yield, already exceeding brief 057's full
3-wave chain in just 2 waves. C-20a recipe recovered both
wave-23 drops first-try. Run `python tools/next_targets.py
--version eur` for current per-tier numbers — printed counts
now stale by +36 hard-tier matches across waves 21-25.

## This session in one paragraph

Brain stood up on Windows from a cold clone. Hit two Windows-only
build bugs that no prior contributor had exercised (CI is Linux-
only and doesn't run `ninja rom`). Both diagnosed, scoped to cloud
as separate briefs, both shipped same-day:

1. **Brief 058** (PR #394, Approach A — `cmd /c` wrap): Ninja on
   Windows calls `CreateProcess` directly, so the `&&`-chained
   `delink` / `lcf` / `mwasm` rule bodies died at step 3 / 1472.
   The `mwcc` rule family already had the Windows guard;
   `_wrap_chain_for_windows()` helper applied the same pattern
   to the three offenders. Cloud also folded in a Windows CI job
   that asserts ≥3 `cmd /c "` rules in `build.ninja`.
2. **Brief 059** (PR #396, Approach A — basement-swap): With 058
   unblocking the shell-chain layer, `ninja rom` then died at
   step 1460 / 1462 (mwldarm). `patch_objects_legacy.py` was
   comparing POSIX-form suffix strings against `objects.txt`
   lines that on Windows come in backslash form. Cloud's fix:
   match on a POSIX-normalized copy, but rewrite ONLY the
   trailing basename — directory portion stays verbatim in
   native-separator form. 9 new tests pin separator-style
   round-trip + idempotency + module disambiguation.

Brain then verified PR #392 (wave 22, brief 057 self-extend 1/2)
end-to-end on Windows — 7 byte-identical matches / 428 bytes,
**24/27 baseline preserved exactly**, no regression of any other
module. Merged.

Total 6 PRs merged in the session: #391 (cloud C-21 docs), #392
(decomper wave 22), #393 (brain brief 058 doc), #394 (cloud 058
impl), #395 (brain brief 059 doc), #396 (cloud 059 impl).

## Progress

Tier breakdown last printed post-#311 (stale by waves 21 + 22):

| Tier | Matched | Unmatched | Total | % matched |
|------|--------:|----------:|------:|----------:|
| `trivial` | 136 | 0 | 136 | **100.0%** |
| `easy` | 933 | 177 | 1110 | **84.1%** |
| `sinit` | 51 | 0 | 51 | **100.0%** |
| `named` | 38 | 1 | 39 | 97.4% |
| `medium` | 125 | 31 | 156 | **80.1%** |
| `hard` | 208 (+14 stale) | 8149 (−14 stale) | 8357 | **2.4–2.6%** |

Brief 057 full chain (waves 21 + 22 + 23 final): **16 matches /
1016 bytes / ~57% combined yield** at the 0x60 cap. Wave-by-wave:
70% / 70% / 25% — cap-raise paid for itself across 2 waves,
exhausted in the third. Surfaced C-21 (folded in #391), S-1
padding (folded in #398), and a candidate C-21 "next-ahead walk
loop" pattern (apply-list pending). **Brief 060 queued:** fall
back to ≤ 0x40, mine the 90-candidate MEDIUM C-20 thunk pool
from PR #397.

## Style A unblock chain — closed (no change)

Briefs 034 → 040 closed earlier; `.legacy.c` routing (mwcc
1.2/sp2p3) and `.legacy_sp3.c` routing (mwcc 1.2/sp3) both
operational. Brief 058 + 059 fixed the Windows-portability gap
in the post-process patchers that this chain introduced (no
Linux/macOS contributor had hit them, but every Windows brain
would).

## Windows brain status — now fully supported

Brain on Windows can now run `ninja rom` to completion on a
fresh clone (given the baserom + Python 3.11+ + Ninja + `gh` +
mwccarm.exe natively via no runner). `dsd check modules`
correctly reports 24/27 OK. CI `windows-latest` job in
`.github/workflows/tests.yml` runs the new unit tests on every
PR so neither fix can regress silently. Wine on macOS still
needs the Game Porting Toolkit cask per
[`docs/research/wine-migration.md`](research/wine-migration.md).

## In flight (post this brain-PR)

**Open PRs: 0** (post this brain-PR landing). Today's merged
set: PR #397 + PR #398 (cloud C-20 corpus scan + S-1 padding),
PR #400 (brain state refresh), PR #401 (cloud S-class sweep
verdict + preamble), PR #402 (decomper wave 23 — brief 057
self-extend 2/2 FINAL), PR #403 (brain brief 060 doc), PR #404
(cloud C-20a inline-asm fallback), PR #405 (decomper wave 24 —
brief 060 INITIAL), PR #406 (brain state refresh), PR #407
(cloud S-1 ↔ cascade cross-reference), and PR #408 (decomper
wave 25 — brief 060 self-extend 1/2).

**Brief 060 active (decomper, mid-chain — 1 self-extend slot
left).** Wave 24 + 25 combined: **20 matches / 764 bytes / 80%
yield**. Cluster-anchor compare against the 90-candidate MEDIUM
pool propagated very well at the small end (0x20-0x28). Wave
25 recovered both wave-23 C-20a drops first-try with cloud's
PR #404 recipe (`func_ov002_0226b00c` + `func_ov002_022a8668`).
~70 candidates remain. One self-extend (2/2) available.

**Brief 057 closed.** Cumulative 16 matches / 1016 bytes / ~57%
across waves 21+22+23.

**C-20a recipe shipped (PR #404).** The byte-pack C-20 variant
wall is **coercible via inline-asm** (`asm void` + `nofralloc`,
same template as C-12 / C-16). Both wave-23-dropped candidates
verified byte-identical with the recipe. Classification: C-20a
sub-letter under C-20 (precedent: C-2a, C-1r). Decomper-
discretion pickup (2 candidates < 5-target fresh-brief
threshold).

**Cloud — three scoped briefs now open (parallel pickup):**

1. **Brief 061 (HIGH) — multi-region porting research.** The
   biggest leverage point identified in this session's tools-
   investment review. EUR is at 1.45%, USA and JPN at 0%.
   Survey + prototype the EUR ↔ USA ↔ JPN correspondence
   space. Ship feasibility verdict + `tools/find_region_
   siblings.py`. GO → follow-up implementation brief unlocks
   bulk cross-region porting (potential ~800-1300 free
   matches at 30-50% port rate).
2. **Brief 062 (MEDIUM-HIGH) — diff-to-coercion suggester.**
   Rule engine over objdiff JSON + codegen-walls.md catalog.
   v0 covers 5-7 most-frequent walls. ~2-3× iteration-time
   speedup per match across all future waves.
3. **Brief 063 (MEDIUM-LOW) — permuter auto-runner.**
   Promote `permute.py` from bootstrap-only to auto-running
   decomp-permuter. Becomes high-priority on the next
   cap-raise; deferred priority while we're at ≤0x40.

All three are independent — cloud can pick any/all in any
order. Standing autonomous rule + ⚠️ scope-confirm flag still
applies per brief.

**Cloud lower-priority candidates (autonomous-only):**

- S-1 cascade variant (c) — cross-`.o` BL pool literals (wave
  25 surface). Worth a "downstream symptoms" extension to S-1.
- C-21 "explicit-next-ahead walk loop" fold-in pending
  decomper usage.
- Pre-existing carryover #1 (placeholder-in-complete-TU
  warning, `func_ov021_021aaf58`).

**Brain:** on Mac. Main worktree
`/Users/leo/Dev/gx-spirit-caller`; decomper worktree
`/Users/leo/Dev/gx-spirit-caller-decomper`.

## Next-brain TODO

1. **Verify + merge decomper's brief 060 final self-extend
   (wave 26) PR** when it opens. Standard gate (configure →
   ninja rom → dsd check modules 24/27).
2. **Triage cloud's brief 061 / 062 / 063 PRs** as they land.
   061 has a binary GO / NO-GO / GO-WITH-CAVEATS verdict
   downstream of it — feasibility output gates whether brain
   scopes the multi-region implementation brief.
3. **Scope brief 064** from post-brief-060 rankings once the
   full chain closes. Decision points: stay at ≤0x40 mining
   the MEDIUM pool residual; raise cap; pivot tier; or (if
   brief 061 verdict is GO) pivot fully to multi-region bulk-
   porting work.
4. **If brief 061 returns GO** → scope multi-region
   implementation brief (cloud) + bulk-porting wave brief
   (decomper). Brain runs `dsd init` on USA + JPN
   `extract/<ver>/config.yaml` to bootstrap their config/
   directories before the porting work begins.
3. **Pre-existing carryovers (unchanged):**
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings.
   - `match-invariants` not yet a required branch-protection
     check.

## Cross-machine handoff notes (Windows → Mac, 2026-05-12)

The brain role moves between cntrl_alt_lenny's PC and Mac.
This session's brain was the Windows-side; Mac brain picks up
from here. Specific calibration notes that don't survive a
machine change:

- **Build verify pattern proven on Windows.** `git fetch &&
  gh pr checkout <N>` then `python tools/configure.py eur &&
  ninja rom && .\dsd.exe check modules -c
  config/eur/arm9/config.yaml` is the brain's standard verify
  loop. On Mac substitute `./dsd` for `.\dsd.exe` and
  POSIX-style paths throughout.
- **Memory file is per-machine.** Windows brain's memory at
  `C:\Users\leona\.claude\projects\...` does NOT follow.
  Mac brain reads `AGENTS.md` + this state.md cold; that's
  the intent.
- **User's stated working pattern (locked in this session):**
  brain reviews + merges autonomously (no per-PR OK gate);
  user gets the cloud / decomper messages afterward to paste
  to those agents. Effectively makes `AGENTS.md` AFK-exception
  the default, not the exception. This is brain-pattern, not
  a one-off — applies to every future brain session unless
  the user revokes it.

## New agents?

No. Continuing with 4-slot setup (brain + decomper + cloud +
auto-progress-badge bot).
