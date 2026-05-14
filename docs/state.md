# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-14 morning, **brief 070 D1 shipped
(PR #438): 117 compile-ready candidates, 2.34× the floor.**
9/10 of brief 069's wave 1 ports re-validate cleanly through
the new driver. Brief 071 (decomper bulk-port wave 1 rerun)
NOW ACTIVE — pool is 117 D1-ready candidates with self-extend
waves absorbing D4/D3/D2 follow-ups as cloud ships them.
Cloud parallelizes D2/D3/D4 against decomper's brief 071 work.
EUR 1.48%, USA + JPN 0.19% each.

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

**Brief 060 CLOSED.** Full 3-wave chain: **29 matches / 1072
bytes / ~75% combined yield** — strongest brief outcome since
brief 057's first two waves. ~32% of the PR #397 90-pool
drained; ~61 candidates remain. Surfaced cascade variants
(b)/(c)/(d) (PRs #407/#410/#413). Two propagate-template
4-clone families (wave 25 bitfields + wave 26 helper-thunks)
validate the template-substitution pattern.

**Brief 061 CLOSED with VERDICT GO** (PR #414). 74.8%
HIGH-confidence cross-region pairings; 90.6% in ≤0x40 band;
USA + JPN pairwise-identical to EUR in function count.
**Estimated unlock: 800-1700 cross-region matches at full
pipeline ship.** `tools/find_region_siblings.py` v1 prototype
shipped; smoke-tested 75% HIGH against bootstrapped configs.

**Config bootstrap shipped** (PR #415). `config/usa/` and
`config/jpn/` ~7 MB each via `dsd init --allow-unknown-
function-calls`. Multi-region README badges (PR #411) ready
to track real numbers as soon as the first bulk-port wave
lands.

**Brief 057 closed.** Cumulative 16 matches / 1016 bytes / ~57%
across waves 21+22+23.

**C-20a recipe shipped (PR #404).** The byte-pack C-20 variant
wall is **coercible via inline-asm** (`asm void` + `nofralloc`,
same template as C-12 / C-16). Both wave-23-dropped candidates
verified byte-identical with the recipe. Classification: C-20a
sub-letter under C-20 (precedent: C-2a, C-1r). Decomper-
discretion pickup (2 candidates < 5-target fresh-brief
threshold).

**Cloud — D2/D3/D4 follow-ups in parallel autonomous PRs:**

1. **Brief 070 D1 (CLOSED, PR #438)** — port_external_source.py
   callee-remap via .o reloc table. 117-candidate D1-ready
   pool. 9/10 wave-1 re-validation. Skip-reason taxonomy
   (struct-access 157, data-ref 110, undefined-macro 107)
   gates D2/D3/D4.
2. **D2 + D3 + D4 (cloud autonomous, ⚠️ scope-confirm)** —
   brain green-lit on PR #438 review. Cloud sequencing
   recommendation: D4 first (110 candidates, builds on D1
   RelocRef infra; structurally similar to D1's callee
   remap but for data symbols). Then D2 + D3 as a pair
   (intertwined header + struct vendoring, 264 candidates
   unlocked).
3. **Brief 063 (MEDIUM-LOW)** — permuter auto-runner.
   Becomes high-priority on the next hard-tier cap-raise.

Closed cloud briefs: 062/066/068/070-D1 plus four autonomous
patches (#427/#434/#435/#438).

**Decomper — brief 071 NOW ACTIVE:**

4. **Brief 071 (HIGH, ACTIVE)** — cross-project bulk-port
   wave 1 rerun. Pool: 117 D1-ready candidates surfaced by
   PR #438's full sweep. Target 50-100 byte-identical ports
   into region-neutral `libs/nitro/`. Self-extends 1/2 +
   2/2 pull from D4 + D3 + D2 candidates as cloud ships them
   in parallel. Routes as `.legacy.c` (1.2/sp2p3 exact SP
   match per brief 068's audit).

**Cloud lower-priority candidates (autonomous-only):**

- C-21 "explicit-next-ahead walk loop" fold-in pending
  decomper usage (brief 060 didn't surface a linked-list walk;
  carries to a hard-tier follow-up).
- Pre-existing carryover #1 (placeholder-in-complete-TU
  warning, `func_ov021_021aaf58`).

**Brain:** on Mac. Main worktree
`/Users/leo/Dev/gx-spirit-caller`; decomper worktree
`/Users/leo/Dev/gx-spirit-caller-decomper`.

## Next-brain TODO

1. **Verify + merge decomper brief 065 (bulk-port wave 1)
   PR when it opens.** Different gate than usual — instead
   of EUR-only 24/27, verify both USA and JPN reach 24/27.
   `python3.13 tools/configure.py usa && ninja rom && ./dsd
   check modules -c config/usa/arm9/config.yaml` (same for
   jpn). The first wave is 50-100 ports; PR body reports
   actual HIGH-confidence precision rate observed.
2. **Triage cloud brief 062 / 066 / 063 PRs** as they land
   (no priority blockers right now; cloud picks per
   autonomous standing rule).
3. **Scope brief 067 (decomper, bulk-port wave 2/3) after
   brief 065's self-extends close.** If precision ≥ 0.85,
   target the rest of the HIGH pool; if precision < 0.85,
   pause for cloud research on the drift shapes.
4. **Scope a hard-tier follow-up brief** for the ~61
   MEDIUM-pool residual from brief 060 once the multi-
   region rollout stabilizes. Pre-existing carryovers
   (placeholder-in-complete-TU warning, ov005 names,
   match-invariants branch protection) remain.
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
