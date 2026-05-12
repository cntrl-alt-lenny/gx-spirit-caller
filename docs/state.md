# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-12 evening, post-brief-058 / post-brief-059,
mid Windows→Mac brain handoff. Main tip after PR #392 + #396. Badge
**1.39%** (live README). Run `python tools/next_targets.py --version
eur` for current per-tier numbers — last printed counts are stale by
+14 hard-tier matches from waves 21 + 22.

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

**Open PRs (2 — both cloud autonomous, both pending brain review):**

- **#397** `cloud/c20-family-corpus-scan` — C-20 family corpus
  scan (post-wave-22). **⚠️ Brain please confirm scope** flag
  set per cloud autonomous standing rule. Brain needs to read
  the survey output, decide if it's actionable as a decomper
  brief, merge or rescope.
- **#398** `cloud/source-layout-pitfalls-note` — new "Source-
  layout pitfalls" section in `docs/research/codegen-walls.md`
  + S-1 padding off-by-one entry. Originates from wave 22's
  iteration win on `func_02012560` (`char _pad[0x11]` mis-
  aligning the following `int` to +0x14). Pure docs; should be
  a quick read-and-merge.

**Decomper:** brief 057 self-extend 2/2 in progress. Same
selection rule as wave 22 — hard-tier, ≤ 0x60 cap, anchor by
current ranking with HIGH-prediction outliers fair game.
Iteration-win flags from wave 22 (padding off-by-one trap +
C-20-recipe-is-drop-in) sent to decomper for shape recognition.

**Brain:** mid-handoff Windows → Mac. cntrl_alt_lenny's Mac
session picks up cold from this state.md. New macOS brain
needs the *Brain onboarding on a fresh machine* checklist in
`AGENTS.md` plus the macOS-specific Game Porting Toolkit step
(see *Wine on macOS post-deprecation*).

## Next-brain TODO

1. **Review PR #397 (cloud, scope-confirm).** Read the survey
   output. If candidate list is actionable (decent number of
   targets at workable sizes, recipe genuinely drop-in), merge
   + scope next decomper brief around it. If too thin or off-
   scope, comment + close.
2. **Review PR #398 (cloud, source-layout pitfalls).** Docs-
   only; likely merge after a single-read pass.
3. **Verify + merge decomper's brief 057 self-extend 2/2 PR**
   when it opens. Standard gate (configure → ninja rom → dsd
   check modules 24/27).
4. **Scope brief 060** from post-057 rankings once 2/2 closes.
   Decision points: stay in hard-tier at 0x60 cap, raise cap
   again, or pivot tier — depends on yield trend.
5. **Pre-existing carryovers (unchanged):**
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
