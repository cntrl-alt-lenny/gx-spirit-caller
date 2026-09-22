[//]: # (markdownlint-disable MD013 MD041)

# Decomper — autonomous C-match queue (WALL-AWARE)

> **Lane identity is the ROLE `decomper`, not a provider.** This file was
> `docs/queue/claude-decomper.md` until 2026-09-04; it was renamed because the
> standing lanes are roles and any capable agentic coding tool may occupy one.
> Git history follows the rename. Retired provider-named queues are read-only
> under `docs/queue/archive/`. Historical item text below may still name a
> provider — that is a record of what happened, not a lane definition.

**Protocol (2026-09-21 — brief-driven, not self-claimed):** this file is the backlog Brain draws briefs from, not a queue Decomper works autonomously end to end. Brain picks the next item (`python tools/work_queue.py next decomper`, read-only), writes the brief around it per `docs/agents/briefs.md`, and hands it to Decomper. Decomper works the one item in the brief it was given — it does not run `--claim` to self-select the next item or chain through the backlog unsupervised. When the item is done, `work_queue.py done decomper <id>` records it (Brain or Decomper may run this as part of closing out the brief), and Brain draws the next brief from the backlog. For each item, the candidate list is the module's CANDIDATE (non-permanent) functions — get them with `python tools/wall_aware_headroom.py --json` (that module's `convertible_files`; richer per-file detail in `coercible_files`/`unknown_files`/`no_marker_files`). Do NOT re-attempt confirmed-`permanent` files (P-NN citation or a real unconditional `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction in the body). Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Park anything that turns out to be a genuine wall (add a `P-NN` marker, or a new codegen-walls.md entry if none fits — do NOT just re-add the old generic "wall" text). Effort MAX.

**Brief 651 rework (docs/research/brief-651-wall-tooling.md):** the "~245 convertible" framing below was wrong — brief 640 found the old classifier conflated codegen-walls.md's own "coercible-with-knowledge" (`C-NN`) bucket with "permanent" (`P-NN`), and treated the blanket `GLOBAL_ASM`/brief-294/302 whole-function-ship header (a mechanical-tool bulk stamp, not per-function proof) as a wall too. The real EUR candidate pool is **6,122** (139 `coercible` — cited C-NN code, look up the lever in codegen-walls.md; 5,951 `unknown` — cohort-stamped or prose-only, never individually assessed; 32 `no_marker` — unchanged from before). Only 32 files are confirmed-`permanent` project-wide. **Prioritize `coercible` first** (`wall_aware_headroom.py --coercible` lists every file with its code) — the lever is already documented, so these are the cheapest wins. The `unknown` bucket is real but unverified: most of it (ov002's 2,740) was mechanically `.s`-shipped by size-tier sweeps with zero C-drafting attempts (brief 416) — expect a mix of easy and genuinely-hard, same as any fresh module.

**Brief 655 finding (docs/research/brief-655-main-sweep.md):** swept main's 62 coercible + a sample of its unknown pool, 6/29 shipped. Bigger finding: of the 40 main files carrying the "brief 207 / Phase 2: Vanilla brief 202 `.s` recipe" C-34 boilerplate, **30 (75%) have zero address-duplication evidence** — mechanically bulk-stamped, not individually verified (distinct from the "brief 205" C-34 sub-tag, which checked out genuine on every file read). Read the header AND check the pool-word structure yourself before trusting a C-34 citation specifically — don't stop at "does it cite a code," ask "does the body actually show 2 loads of the same address." Coercible-vs-unknown hit rate this brief: statistically the same (20% vs 22%) — taxonomy code presence doesn't predict matchability once mistagged citations are accounted for.

**Tooling budget (2026-07-23):** a NEW tool must do one of: replace/delete an existing tool, consolidate duplicated infrastructure, measurably cut cycle time, catch a demonstrated failure class, or directly ship functions/bytes — state which in the PR. **asm-void ≠ readable C:** inline-asm-in-C is coverage hygiene, counted separately from natural C (metric split shipped end-to-end, q-natural-c-metric [DONE]); prefer natural C, use asm-void only where a documented wall justifies it.

**⚠️ ROUTE BEFORE YOU DRAFT (brief 667, 3/3 + generalised):** the recurring epilogue-shape wall is NOT a wall — it is the existing per-TU compiler routing tier. **Read the TARGET `.s`'s own epilogue first:** `sub sp,#4` + separate `pop {lr}` / `bx lr` → name the file `*.legacy.c`; fused `pop {..., pc}` → `*.legacy_sp3.c`; otherwise plain `.c`. Choosing the tier BEFORE writing the body removes an epilogue mismatch that accounted for ~14% of brief 661's sample. See `docs/research/style-a-epilogue.md` + lever-payoff #28/#29.

**⚡ WORKTREE-PARALLEL SWEEP PROTOCOL (r11 [S], proven ~7x per merge slot — cm-overlay-small-sweep shipped 64/118 this way).** For any batch of >~20 independent candidates, do NOT grind them serially. Split into ~5 batches, run each in its OWN git worktree (`git worktree add ../sweep-N -b <branch>-N`), then consolidate with `git merge --no-ff` per batch — the real 3-way merge resolves overlapping `delinks.txt` edits from independent batches cleanly (zero conflicts observed across 5 batches all editing ov002). FAILURE MODES to preflight: (a) each worktree needs the baserom + a configure run before it can gate — seed it or the batch dies late; (b) `gate3`'s dsd preflight used to false-fail in fresh worktrees (FIXED on main — probes `dsd`/`dsd.exe`); (c) never let two batches claim the SAME candidate — partition the list up front and write the partition into the PR body; (d) gate ONCE on the consolidated branch, not per worktree (per-worktree gates waste the machine). ⚠️ VERIFY AFTER CONSOLIDATION: count `.c` files added vs `delinks.txt` activations flipped — they MUST be equal. The 07-24 sweep added 64 `.c` but flipped only 63 (one function shipped with a stale `.s` activation; the ROM was still byte-correct via basename fallback, so NO gate catches this — only the count check does).

---

## Items

### q-dashboard-check-coupling — two staleness tests read the live repo file, so any un-regenerated round turns them red [TODO]

`tests/test_generate_dashboard.py::TestCheckToleratesSquashMergedTrailingSha::test_check_passes_when_trailing_sha_is_squash_rewritten` and `TestCheckToleratesTrailingRowAddition::test_check_passes_when_committed_is_missing_one_trailing_row` do not use a fixture. They run the real `generate_dashboard.py --check` against the **live committed `docs/dashboard.md`**, then simulate one further trailing-row delta on top of whatever state that file is already in.

The tolerance is exactly one trailing row. So the moment a branch touches `docs/state-table.md` without regenerating `docs/dashboard.md`, the committed file is already one row behind, the simulated delta lands **two** rows out, and both tests go red with

```text
stale (line count differs)
stale (unexpected difference at committed line 87, beyond a trailing trend-row addition)
```

— a message that blames staleness in the *tree* rather than the coupling in the *test*. **Brain-reproduced on Windows** at `e6574bbf0`: both tests failed; after `python tools/generate_dashboard.py` and nothing else, `tests/test_generate_dashboard.py` went **34 passed**. That one missing regeneration is what held PR #1622 on a red required `unittest` check.

**This is the fourth round this file has cost.** Round 0901: `dashboard.md` stale on main with `line count differs`. Round 0904: two dashboard failures during merge. Round 0907/0908: PR #1622 blocked. Each time the fix was "regenerate and commit" and the diagnosis had to be rediscovered from scratch.

**Scope.**

1. **CANARY FIRST (control 7).** Construct the one-row-behind tree in a fixture and show both tests RED before your change, GREEN after — and show that a *genuinely* mis-rendered dashboard still fails. If either test is already green on a one-row-behind fixture, your model of the bug is wrong: STOP and report that.
2. **Decouple the two tolerance tests from the live repo file.** They are testing the tolerance logic, not the tree; give them a synthetic committed/fresh pair. The real staleness signal is not lost — `generate_dashboard.py --check` already runs in `generated-files-drift.yml`.
3. **Then ask whether the tolerance itself is right.** It admits exactly one trailing row. A round that lands two commits touching `docs/state-table.md` is a normal event. Decide, with evidence, whether to count real trailing rows instead of hardcoding one — and if you decide not to, say why in the PR.
4. **Make the failure self-diagnosing.** Whatever survives must, when it fires for this reason, print the actual remedy (`python tools/generate_dashboard.py` and commit) rather than only "is out of date".

### q-fail-open-audit — two more guards return "clean" on the input they exist to catch [TODO]

The campaign's dominant defect class is not "guard missing", it is **guard returns a passing answer on the exact input it was built for**. Round 0903 found two. PR #1620 fixed those two. Here are two more, both brain-verified on `main` at `b14879e28`.

**A — `check_dispatch_log.py` is blind to a round that writes nothing at all.** The repaired guard requires a dispatch row when `docs/state.md` changes:

```python
if state_base is None or state_head is None or state_base == state_head:
    return CheckResult(True, detail="state narrative unchanged; dispatch row not required")
```

A round that never touches `docs/state.md` is therefore never asked for a row. **That is not hypothetical — it just happened twice.** `docs/dispatch-log.md` ends at round **0905**; `docs/state.md`'s newest entry is round **0905**. Rounds **0906 and 0907 both ran** (PR #1622's writeup is dated by kickoff round 0907; PR #1620's body describes its own round-0906 and round-0907 iterations) and left **zero** trace in either file. `grep -n "0906\|0907" docs/state.md docs/dispatch-log.md` returns nothing on `main`; the only mention anywhere is one sentence in `docs/decomp-workflow.md` / `docs/tools-index.md`, added by PR #1621.

Guard 1 (`queue_state_drift.py`) is the only backstop, and its `_STALE_MERGE_TOLERANCE = 2` means a two-PR round slips under it silently — which is exactly the width of a normal round. Work out what a round *cannot* avoid touching and key the requirement on that; explain in the PR why your chosen signal cannot be skipped the way `docs/state.md` was. **Reconstruct the 0906/0907 window as a canary and show the guard green before / red after.**

**C — `queue_state_drift.py`'s anchor regex matches its own output quoted in prose.** `_MAIN_SHA_RE` is `main-sha:\s*`?([0-9a-f]{7,40})`?` and it takes the FIRST match in the current state section. Round 0908's narrative quoted the tool's own message verbatim, so the guard parsed the stale sha out of the sentence describing the stale sha and ignored the real anchor 70 lines below. The brain hit this while writing the round and had to reword the prose. A freshness anchor that can be spoofed by a document describing it is not an anchor; anchor the match to the HTML comment form.

**B — `pool_freshness.py --module` fails OPEN on an unknown module name.** Brain-verified on `40e5d826b`:

```text
--module overlay002        -> count: 116   bytes: 33948
--module ov002             -> count: 0     bytes: 0      (no error, exit 0)
--module not_a_real_module -> count: 0     bytes: 0      (no error, exit 0)
```

`ov002` is the spelling used in `attempts.tsv`'s own `module` column, in `codegen-walls.md`, and in every 257-320 B kickoff written so far. A lane that types the name it reads everywhere else gets `count: 0` and can reasonably report the pool exhausted. Make an unknown module an error, or resolve the aliases — state which and why. Same canary discipline.

### q-codegen-walls-br-backfill — the band-result ledger stops at BR-9 and three rounds are missing [TODO]

`docs/research/codegen-walls.md`'s BR ledger runs BR-1 … BR-9. Missing: **BR-10** (`cm-257-320-drain-3`, PR #1609), **BR-11** (`cm-257-320-drain-4`, PR #1616), **BR-12** (`cm-257-320-drain-5`, PR #1622). Round 0904 flagged the gap; PR #1622 left it deliberately untouched.

This matters because BR-6 already demonstrated the failure mode: it declared the code frontier "fully characterised" and BR-7 had to correct it. An unbacked ledger is how a stale band claim survives.

**Scope.** Write BR-10/11/12 from the ledger and the three briefs, not from prose. For each: attempted rate, pool rate, module mix, and what the round pre-registered vs. what it got. Then **reconcile the cumulative figure across all seven 257-320 B briefs and pin one number** — drain-5 pins 12/100 = 12.0%; verify it against `attempts.tsv` yourself and say so, or correct it. Where an earlier BR entry is contradicted by a later one, add the correction inline the way BR-9 corrects BR-8 — do not silently overwrite.

⚠️ **Row order in `attempts.tsv` is not chronology** (485 of the rows were batch-backfilled). Order by PR number, and fail toward AMBIGUOUS rather than guessing.

### q-gate-exit-status — the merge gate has reported success on failure three rounds running [TODO]

`docs/state.md` records this three times, in three different rounds, each time diagnosed from scratch:

- **round 0831** — "`test_generate_dashboard` freshness failed … **The `tee` wrapper reported exit 0 while the gate had FAILED** — reading the log is what caught it."
- **round 0904** (line 555) — "⚠️ **The gate FAILED on the first integration run, and the wrapper exited 0.** … **`[exited with code 0]` sat directly beneath `==================== GATE FAIL ====================`** — reading the log is what caught it, for the second round running."
- **round 0908** (line 824) — "`1 failed, 3631 passed` — while the shell wrapper exited **0**, for the third round running."

`docs/queue/scaffolder.md:1368` already carries the workaround as standing lore: "⚠️ `gate3` piped through `tee` MASKS its exit code (both lanes hit this last round) — read the log, do not trust exit 0."

**A gate that reports success on failure is worse than no gate, because it is trusted.** `AGENTS.md` says of `gate3.py --scope all`: "Nothing below outranks it." Three rounds in a row it was outranked by a pipe.

**BRAIN-VERIFIED, AND IT NARROWS THE FIX.** `gate3.py` itself propagates correctly. Run on this host on 2026-09-03 with plain redirection and no pipe:

```text
python3.13 tools/gate3.py --scope all > gate.log 2>&1 ; echo "GATE_EXIT=$?"
  → [eur] SHA1 PASS / [usa] SHA1 PASS / [jpn] SHA1 PASS
  → 1 failed, 3642 passed, 15 skipped … ==================== GATE FAIL ====================
  → GATE_EXIT=1
```

`gate3.py:466` is `sys.exit(main())` and `verdict()` returns the code. **So do not go looking for a bug in `gate3.py` — there isn't one.** The defect is that the workflow *requires* a transcript (every kickoff asks for pasted SHA1 lines, and reading the log is what caught all three incidents) and the only way anyone has to produce one is `| tee`, whose status is `tee`'s. `set -o pipefail` appears nowhere in the repo's docs or kickoffs, is not the default in any shell an agent runs, and has no PowerShell equivalent — `$LASTEXITCODE` after a pipeline is also the last command's.

**Scope.**

1. **CANARY FIRST (control 7).** Reproduce the masked status before changing anything: a command that exits non-zero, piped through `tee`, reporting 0. Paste it. Then show your fix reporting non-zero on the same input. If you cannot reproduce the mask, your model of the bug is wrong: STOP and report that.
2. **Remove the need for `tee`.** Give `gate3.py` a `--log PATH` that writes the full transcript itself while still streaming to the terminal, and exits with the verdict. A status that cannot be piped away cannot be lost. Keep the existing streaming behaviour byte-for-byte when `--log` is absent.
3. **Make a masked status visible even when someone pipes anyway.** The transcript's own last line should state the exit code the process is about to return, so a pasted log carries its own verdict and a `[exited with code 0]` under `GATE FAIL` is self-contradicting on sight.
4. **Regression test.** A failing inner command must produce a non-zero status through whatever path the docs now prescribe. Test the *shape* — an always-fail stub — not a real gate run.
5. **Then update the instructions that taught the pipe.** The original `docs/queue/scaffolder.md:1368` warning this refers to is now archived, verbatim, at `docs/queue/archive/scaffolder-done-2026-09-21.md` (its `[DONE]` item moved there 2026-09-21) — its `| tee` MASKS its exit code" text still needs whatever this fix decides, but is history now, not a line to edit in place. Sweep AGENTS.md, `docs/project-rules.md`, `docs/decomp-workflow.md`, `docs/machine-setup.md`, and the kickoff templates in `tools/make_kickoff.py` for any `| tee` guidance and replace it. Grep, do not recall.

**Explicitly not in scope:** changing what `verdict()` decides, or the gate's scopes. This item is about the status surviving the trip to the caller, nothing else.

**BUILD-FREE.** Do not run `ninja`, do not run a real region gate — the stub in step 4 is the test. The other lane owns the compiler this round.

**Gate:** `python3.13 -m pytest -q tests` green AND `python3.13 -m unittest discover -s tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean, plus the pasted before/after canary from step 1. Verify every claim against `git diff --stat origin/main..HEAD`.
