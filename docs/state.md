# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-13 morning, post-#397 + #398 merge. Brain
back on Mac after Windows handoff. Main tip `46ca0ba`. Badge
**1.39%** (live README) — unchanged, today's merges were docs-only.
Run `python tools/next_targets.py --version eur` for current per-tier
numbers — last printed counts are still stale by +14 hard-tier
matches from waves 21 + 22.

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

Waves 21 + 22 (brief 057): **14 matches / 904 bytes / 70% avg
yield** at the 0x60 cap — comfortably above the 40% break-even
point. Brief 057 self-extend 2/2 in progress (decomper).

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

**Open PRs: 0.** #397 + #398 squashed onto main this morning.

**#397 scope-confirm: option (a).** Accepted the reloc-sig
pre-filter as the survey output. Three HIGH-confidence drops
ready to feed into the next decomper brief:

| Candidate | Size | Cluster |
|---|---|---|
| `func_0206eea0` (main) | 0x2c | Cluster A — exact triplet sig (matches 4 already-shipped C-20 anchors) |
| `func_ov002_022a8668` | 0x2c | Cluster A — exact triplet sig |
| `func_ov002_0226b00c` | 0x28 | Cluster B — byte-pack variant per C-20 *Family extension* note |

90 MEDIUM-confidence thunk-shape candidates in
[`docs/research/c20-family-corpus-scan.md`](research/c20-family-corpus-scan.md)
serve as a per-target search-space narrowing input for
`find_shape_templates`. Strict asm-grep (option b in #397's
proposal) is brain-host work — deferred; will fold into a
future calibration pass if the HIGH-3 don't surface enough
volume.

**#398:** S-1 padding off-by-one entry now reference-grade
in `codegen-walls.md` under a new top-level *Source-layout
pitfalls (not codegen walls)* section. New `S-` prefix
distinct from `C-N` / `P-N` / `E-N` / `T-N` — marks
authoring errors that *look like* codegen walls in the diff
(uniform offset shift after a `char _pad[]` array) but are
correctable in the C source alone.

**Decomper:** brief 057 self-extend 2/2 in progress. Same
selection rule as wave 22 — hard-tier, ≤ 0x60 cap, anchor by
current ranking with HIGH-prediction outliers fair game.
Iteration-win flags from wave 22 (padding off-by-one trap +
C-20-recipe-is-drop-in) sent to decomper for shape
recognition; both now reference-grade as of this morning.

**Brain:** back on Mac after Windows handoff. Main local
worktree at `/Users/leo/Dev/gx-spirit-caller`, decomper at
`/Users/leo/Dev/gx-spirit-caller-decomper` per the worktree
convention in `AGENTS.md`.

## Next-brain TODO

1. **Verify + merge decomper's brief 057 self-extend 2/2 PR**
   when it opens. Standard gate (configure → ninja rom → dsd
   check modules 24/27).
2. **Scope brief 060** from post-057 rankings once 2/2 closes.
   Folds in the 3 HIGH-confidence C-20-family candidates from
   #397 as drop-in pool. Decision points on top: stay in
   hard-tier at 0x60 cap, raise cap again to 0x80, or pivot —
   depends on the brief 057 2/2 yield trend.
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
