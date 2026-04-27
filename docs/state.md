# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-27. Main tip is `351899f` after the wave 11
merge sweep (PRs #225/#226/#227/#228/#229/#230) plus the auto-progress-
badge bot PR #231. **State.md was significantly stale before this
update** — last comprehensive refresh was PR #188 (post-cascade-wave)
and the project moved through ~40 more PRs (cluster tools, wave 11
thunk sweep) before this re-baseline.

**Baseline:** Per the wave 11 PR bodies, `ninja rom` clean and
`./dsd check modules` baseline preserved (3 expected failures: ARM9
main / DTCM / overlay 4). I did not re-run the full local build this
chunk — my Bash-on-Windows shell can't drive ninja's `&&` chains
because configure.py emits commands without `cmd.exe /c` wrapping (a
ninja-spawning quirk that's environment-specific to this brain
shell). The decomper has been running a working build all session;
CI's `pr-invariants` + `pr-tier-delta` + `pr-worklist-diff` all pass
on every wave 11 PR. Future-brain action item below.

**Progress** (live from `python tools/next_targets.py --version eur`,
which reads symbols.txt directly and is independent of report.json):

| Tier | Matched | Unmatched | Total | % matched |
|------|--------:|----------:|------:|----------:|
| `trivial` | 136 | 0 | 136 | **100.0%** |
| `easy` | 327 | 783 | 1110 | 29.5% |
| `sinit` | 50 | 1 | 51 | 98.0% |
| `named` | 38 | 1 | 39 | 97.4% |
| `medium` | 94 | 62 | 156 | 60.3% |
| `hard` | 36 | 8321 | 8357 | 0.4% |

`trivial` and `named` are essentially closed; `sinit` has only the
ov004 outlier left (deferred while ov004 is a failing module).
`easy` is the main grind with 783 unmatched candidates, but the new
**cluster propagation tool** (PR #227) just identified 53 ready-to-
propagate clusters covering 839 of those — see brief 015.

`progress.py` shows lower numbers than the symbol counts above — its
`report.json` cache is stale and a fresh `ninja report` couldn't run
from this brain shell. CI's auto-badge bot (PR #231) refreshed the
README badge from a clean Linux runner; trust that one.

## Merged in this chunk

Main tip moved from `2414c3e` → `351899f` (7 PRs).

### Decomper track — wave 11 thunk-wall sweep

The five decomper PRs together matched **61 functions** across
`main` and overlay 2/4/6/8, all `ldr ip, =sym; bx ip` 3-insn /
0xc-byte (or 0x10 with one `mov` for the IRQ handlers) thunks. Per
the PR bodies, all 61 are byte-identical with dsd delinks; CI
metadata checks all green.

- **PR #225** — wave 11/pr1: 8 NitroSDK `OSi_IrqHandler*` thunks
  (`Timer0..3` / `Dma0..3` → `OSi_PostIrqEvent`).
- **PR #226** — wave 11/pr2: 13 pure-thunk + 2 equality-check
  matches (15 total). Equality-checks `func_0202b4b4` / `_0202b4d4`
  use mwcc's `addne` second-constant trick.
- **PR #228** — wave 11/pr3: 18 more 3-insn thunks, including a
  second `Task_InvokeLocked` thunk (validates the post-#219
  pool-reloc-bug fix path).
- **PR #229** — wave 11/pr4: final 14 thunks. `main` module's
  `ldr ip, =sym; bx ip` thunks now **100% matched**.
- **PR #230** — wave 11/pr5: 6 overlay-side thunks, including 3
  cross-module (overlay → main) thunks. Confirms the mwcc-C path
  is clean for cross-module reachability.

### Cloud track

- **PR #227** — `tools/find_pattern_clusters.py`. Surfaces clusters
  of unmatched functions sharing exact `(size, reloc-sig)` finger-
  print with at least one matched anchor. 53 ready-to-propagate
  clusters covering ~900 unmatched functions. Pairs with
  `propagate_template.py` for bulk match. 24 new tests; full suite
  green.

### Brain track (this PR)

- Refreshed this file (state.md was 40+ PRs stale).
- Wrote brief 015 (cluster propagation pilot) — pick the top
  remaining cluster (`main` / `func_020498f0` / 148 unmatched
  siblings), match the anchor, propagate via tool.
- AGENTS.md open-briefs list now points at brief 015; brief 014
  (rename-cascade pilot) closes.

### Conflict-resolution note

Wave 11 decomper PRs all touched `config/eur/arm9/delinks.txt` with
append-only `complete` blocks. After merging #225, the remaining 3
(#226 / #228 / #229) needed local rebase to resolve textual-but-
not-semantic conflicts. Resolution was always "concatenate both
blocks" (`sed -i '/^<<<<<<< /d; /^=======$/d; /^>>>>>>> /d' …`) —
no decisions, no validation needed beyond `git rebase --continue`.
If this pattern repeats on future waves, brain may want to mention
it in the brief so the decomper either splits PRs into non-
overlapping address ranges or expects rebase support.

## In flight

- **Open PRs:** zero (post this brain-PR merge).
- **`decomper`** — brief 015 open. Branch:
  `decomper/cluster-prop-020498f0`. One PR, anchor +
  propagation-validated siblings.
- **`cloud`** — no open brief. Self-directed candidates per
  AGENTS.md's *Cloud autonomous work*:
  1. **Latent bug fix** — `tools/ci_format_worklist_diff.py`
     stdout crashes on Windows cp1252 console when rendering 📉
     emoji. CI uses `-o file` (works fine); local stdout breaks.
     One-liner: `sys.stdout.reconfigure(encoding="utf-8")` early
     in `main()`.
  2. **`build.ninja` shell-wrapping fix** — configure.py emits
     compound rules with `&&` and no `cmd.exe /c` wrapper, so on
     non-cmd shells (e.g. Git Bash on Windows) ninja passes the
     entire command line as one argv to the first executable.
     Touchy because it affects build infrastructure; needs careful
     cross-platform testing.
  3. **Cluster CI integration** — extend the existing PR-comment
     workflows to surface "this PR makes N new clusters ready" /
     "drains 50% of cluster X" as part of the auto-comment bot.
     Builds on PR #227 + the existing tier-delta CI from PR #88.
- **`brain`** — waiting for the next decomper PR. Will re-run the
  cluster analysis after brief 015 lands to size the next pilot.

## Next-brain TODO

1. **Review brief 015 PR when it opens.** Decomper submits one PR
   with `src/main/func_020498f0.c` + propagated siblings +
   `config/eur/arm9/delinks.txt` block. Verify locally if your
   shell can drive ninja: `ninja rom`, `ninja objdiff`, `./dsd
   check modules` (still 24/27). The propagation tool's per-target
   `TemplateMismatch` exit is the gate that makes this safe to
   bulk-merge. Summarize for cntrl_alt_lenny and offer to merge.
2. **Brain shell repair** — if you can fix the Windows-bash + ninja
   `&&` issue (or just confirm cmd.exe / WSL / PowerShell work),
   document the working setup in AGENTS.md.
3. **Brief 016 candidate** — second cluster, ov000 /
   `func_ov000_021aa4a0` (72 unmatched). Same shape as 015,
   different module. If 015 ships clean, 016 is mechanical.
4. **Pre-existing carryovers** — `func_ov021_021aaf58` placeholder-
   in-complete-TU warning; `__sinit_ov004_02209a5c` (failing
   module); `match-invariants` not yet a required branch-protection
   check.

## New agents?

Still no. Brain + decomper + cloud + the auto-progress-badge bot
continues to scale. Codex CLI sessions have played all three roles
fluently across this chunk per past chats.
