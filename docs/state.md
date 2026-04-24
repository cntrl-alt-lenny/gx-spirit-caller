# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-24. Main tip is `5531175` (PR #181).
Refresh written by cloud because state was 3 waves stale (#165 rename-
cascade wave + #171 rebase fire + #176–#180 follow-on waves).

**Baseline:** `python tools/configure.py eur`, `ninja rom`,
`ninja objdiff`, `ninja report`, and `./dsd check modules -c
config/eur/arm9/config.yaml` all pass on Windows/Mac/Linux. Module
check: still **24/27 OK** (ARM9 main / DTCM / overlay 4 fail for
structural placeholder-symbol reasons per CLAUDE.md — not agent-
caused).

**Progress:** `python tools/progress.py --version eur` now reports
code `9342 / 2388172` bytes (**0.39%**, more than doubled from 0.18%
in the last refresh), data `0 / 4776528` bytes (0.00%), units `483 /
483` (100%). **+5134 code bytes / +295 units** since the last
refresh. Driven by the rename-cascade validation (PR #165 = 85 tier
promotions from 4 names) and the follow-on matching waves it enabled.

**Matched breakdown** (live from `python tools/next_targets.py
--version eur --no-outputs`):

| Tier | Matched | Unmatched | Total | % matched | Δ vs last refresh |
|------|--------:|----------:|------:|----------:|-------------------|
| `trivial` | 118 | 18 | 136 | 86.8% | +40 (→100% once #184 lands) |
| `easy` | 247 | 864 | 1111 | 22.2% | **+171** |
| `sinit` | 50 | 1 | 51 | 98.0% | 0 (stable) |
| `named` | 28 | 9 | 37 | 75.7% | +6 (new named targets surfaced by cascade) |
| `medium` | **60** | 83 | 143 | 42.0% | **+57** (from 3!) |
| `hard` | 21 | 8350 | 8371 | 0.3% | +21 (first hard-tier matches ever) |

**Two tier milestones this wave:**

- **Trivial tier closing 100%** once #184 merges (18 more bx-lr
  stubs across 6 overlays, including the first ov003 TU ever
  carved).
- **Medium tier exploding 3 → 60 (+57)** — the rename cascade from
  #165 promoted ~85 placeholders into medium-tractable state, and
  subsequent waves drained most of them. First hard-tier work
  started too (21 matches).

## Merged since last refresh

Main tip moved from `71b3e9c` → `5531175`. Most-active stretch of
the project to date.

### Decomper track

- **PR #120** — medium-tier 5/6 close (anim-family cousins).
- **PR #122** — ov010 easy-tier close-out (14 matches).
- **PR #126 / #127 / #143 / #148** — multi-overlay easy-tier sweeps,
  28 + 7 + 6 + 19 matches. Crossed 15% badge threshold in #143.
- **PR #135** — medium-tier 6/6 closed via `.s` file
  (`func_020b3814`, shared-code entry point).
- **PR #136** — first 6 hard-tier matches (forwarders around
  `func_02018b28`, using cloud's #132 cascade ranking).
- **PR #140** — bundled rebase of #135 + #137 + #138 + #139 (45
  matches).
- **PR #151** — bundled rebase of #145 + #147 + #149 (22 hard-tier
  matches around the `func_02018b28` state singleton).
- **PR #165** — **the cascade-2 wave**: 4 renames (`GetSystemWork`,
  `Fill32`, `OS_DisableIrq`/`OS_RestoreIrq`, `Task_InvokeLocked`)
  producing 85 tier promotions. Validated cloud's cascade model.
- **PR #167 / #169 / #170 / #171** — bundled wave-6 rebase (33
  matches + OS_DefaultIrqHandler rename cascade).
- **PR #176** — fix: restore wave-6 renames that #171 rebase
  accidentally reverted (the "rebase drift" that inspired #185's
  cross-file drift check).
- **PR #177** — medium-tier drain: 7 more matches.
- **PR #179 + #182** — 26 matches bundled in rebase.
- **PR #180** — overlay trivial sweep: 15 bx-lr stubs across
  ov004/ov010/ov015.

### Cloud track (heavy tooling round)

Build-acceleration tools:

- **PR #132** — `tools/find_cascades.py`: rank placeholders by
  tier-promotion leverage. Feedstock for #136/#165.
- **PR #133** — `propagate_template.py` cross-module no-op bug fix
  (#122 followup).
- **PR #134** — `nitro_suggest_renames` name-token discriminator
  (score-3 ceiling → 4, cleanly discriminates OS_SpinWait in demo).
- **PR #142** — round-3 rename-suggestion analysis doc.
- **PR #144** — CI: per-PR rename-cascade impact comment (`find_
  cascades` + GitHub Actions).
- **PR #146** — `docs/briefs/014-rename-cascade-pilot.md`.
- **PR #153** — `bulk_rename_candidates.py`: find sibling
  placeholders of a named anchor. Powered #175's scouting.
- **PR #154** — `.githooks/pre-push` + `install_git_hooks.py`
  (terminal-git invariants gate).
- **PR #156** — `libs/nitro/include/nitro/os.h` + data-tier
  scouting doc.
- **PR #159** — `scratch_bundle.py`: one-shot decomp context
  assembler with `--prompt` mode.
- **PR #160** — `pattern_library.py`: shape-fingerprint template
  lookup (287 matched .c's indexed against main).
- **PR #161 / #162** — `permute.py` extended to produce runnable
  `run.sh` + README workspace.
- **PR #166** — `.claude/agents/{brain,decomper,cloud}.md`
  (subagent specs formalising the three-role split).
- **PR #173** — `.claude/hooks/`: PostEdit ruff/unittest hook +
  PreBash invariants gate.
- **PR #174** — `.claude/commands/{scratch,cascade,suggest}.md`
  slash commands.
- **PR #175** — cascade-3 scouting doc; recommended
  `Task_InvokeLocked` cluster + `Fill32`/`Copy32` pair. Option B
  (Copy32) shipped in #186.

Data-tier work:

- **PR #123** — `data_worklist.py`: rank 10,952 data symbols by
  cross-module reader density.
- **PR #168** — data-tier FIRST MATCH: `data_027e05a0` →
  `OSi_IrqCallbackTable`. Opened the data surface from 0%.
- **PR #178** — data-wave-2: 9 SDK IRQ handler renames +
  OSi_IrqCheckBuf (10 total).

### Brain track

- Coordinated the cascade-2 wave (#165) and the resulting #171/#176
  rebase drift. Filed #176 as the fix.
- Triaged the ~30 PR wave across decomper/cloud tracks.
- Flagged the cross-file drift check (#185) as priority-1 to prevent
  #171-class recurrences.

## In flight

**Open PRs (as of 2026-04-24):**

- **#184** — decomper trivial-tier close (18 bx-lr stubs across 6
  overlays, including first ov003 TU). Trivial tier **100%** after
  merge.
- **#186** — decomper `Copy32` match (brief 015 Option B from
  cloud's #175 scouting). 17 shared callers with Fill32.
  19 cumulative NitroSDK-style names.
- **#185** — cloud `check_cross_file_name_drift`: catches
  #171-class rebase drift pre-flight. Errors block pushes via
  #154/#173 hook integration. 12 new tests, 0 drift on current
  main.
- **#183** — automated progress-badge refresh (bot).

**Agent-track status:**

- **`decomper`** — trivial tier closing in #184, Copy32 shipped in
  #186. Natural follow-on per #175: Task_InvokeLocked cluster
  (Option A, 4-5 siblings in 0x02005xxx-0x02007xxx range), OR
  resume the hard-tier / easy-tier drain. Medium tier drain has
  slowed (83 unmatched, getting stickier).
- **`cloud`** — three merged this wave (#173 hooks, #174 slash
  commands, #175 cascade-3 scouting), #185 open. No production
  fires. Standing options: cascade_apply.py (scripted wave
  application), heatmap regen, or another deep-research pass.
- **`brain`** — open PRs to triage (#184, #185, #186, #183).

## Next-brain TODO

1. **Triage the 4 open PRs.** #184 is a trivial-tier close (1-round
   build verify), #186 is a single-match plus delinks cleanup, #185
   is cloud's drift-check (has test plan, verify the 814-test suite
   still passes), #183 is a bot badge refresh.
2. **Scope brief 016 (Task_InvokeLocked cluster)** from cloud's
   #175 scouting Option A. Anchor: `func_020067fc` (0x74, 0.25
   jaccard with Task_InvokeLocked, 36 shared callers). Expected
   4-5 matches across the task-family range. See
   `docs/research/cascade-3-scouting.md`.
3. **Data-wave-3** — next data candidate. `data_020b4728` (14
   modules, 27 readers) remains the highest-cross-module-spread
   unmatched data symbol per the `data_worklist.md`. Follows the
   #168 / #178 SDK-identity-pass pattern.
4. **`func_020b3814` asm follow-up carryover** — landed in #135.
   Can close this item.
5. **`func_ov021_021aaf58` carryover** — placeholder in a
   `complete` TU. Still applicable.
6. **`match-invariants` required check** in branch protection —
   now especially valuable with #185's cross-file drift check
   landing. 30-second GitHub settings change.
7. **Heatmap regeneration** — `tools/generate_heatmap.py`. The
   massive tier reshuffle (medium 3→60, easy 76→247) means the
   README SVG is visually misleading. Mechanical regen run.
8. **`docs/briefs/014-rename-cascade-pilot.md` status** — its
   suggested first pick (`func_02018b28` aka GetSystemWork) got
   renamed in #165 + matched in #136's forwarder wave. Mark the
   brief as effectively superseded by the realized cascade-2
   results in #165 + scouting in #175.

## Tooling inventory (for new brain / cloud cold-start)

Decomper-facing (most-used):

- `tools/next_targets.py` — worklist
- `tools/scratch_bundle.py` — context assembler + LLM prompt mode (#159)
- `tools/find_cascades.py` — rename leverage ranker (#132)
- `tools/bulk_rename_candidates.py` — siblings of a named anchor (#153)
- `tools/pattern_library.py` — best-fit drafting template (#160)
- `tools/nitro_suggest_renames.py` — NitroSDK name candidates
- `tools/propagate_template.py` — auto-generate siblings from template
- `tools/permute.py --copy` — stage decomp-permuter workspace (#162)
- `tools/rename_symbol.py` — placeholder → real rename
- `tools/check_match_invariants.py` — pre-push metadata sanity (with
  new `cross_file_name_drift` check in #185)

Slash commands (agent convenience, #174):

- `/scratch <module> <addr> [--prompt]`
- `/cascade [<module> <addr>]`
- `/suggest`

CI formatters:

- `tools/ci_format_diff.py`, `ci_format_worklist_diff.py`,
  `ci_format_invariants.py`, `ci_format_diff_reasons.py`,
  `ci_format_rename_cascades.py` (all upsert PR comments)

Data tier:

- `tools/data_worklist.py` (#123)

Hooks (opt-in per clone, brain + agent-loop gates):

- `.githooks/pre-push` via `install_git_hooks.py` (#154)
- `.claude/hooks/{post_edit,pre_bash}.py` via `.claude/settings.json` (#173)

## New agents?

Still no. Brain + decomper + cloud holding across the cascade wave
and the #171/#176 drift recovery. Reopen if `libs/nitro/` header
adoption balloons beyond os.h / swi.h / types.h, or if graphics /
audio decomp becomes a serious target.
