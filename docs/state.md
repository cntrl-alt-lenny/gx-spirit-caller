# State

The owner's standing decisions, what is deliberately parked, and pointers.
Read it in a minute. It holds **no live state**: what is in flight, merged or
failing comes from `python3 tools/fw.py status` and git, every session. Its
word budget is checked by `tools/fw.py check`.

## Where we are going

The project is becoming a lean "matching factory": a script, not people,
drives the matching of functions to C, and the byte-identical rebuild of all
three ROMs (EUR, USA, JPN) is the reviewer. Rounds exist to improve the
factory, run readability passes, and deal with the functions it gives up on.
The redesign is five reviewed rounds, each guarded by the three-ROM check:

- **A** Framework 3.0.0 and retiring the old process.
- **B** Housekeeping: research corpus and retired logs out of `main`, `tools/`
  cut to what the build, gate, matching loop and CI use, comment-only CI jobs
  dropped, and one short compiler-quirks reference distilled from the research.
- **C** A trustworthy checker: the gate's exit status, a check that every call
  and data reference points at the right symbol, a lint rule against fake
  matches, and Claude Code and Codex settings that stop agents editing
  checksums, the original ROMs or generated files.
- **D** One source tree with per-region configuration, instead of `src/`,
  `src/usa/` and `src/jpn/`.
- **E** The factory: an unattended `cmatch_loop.py` runner and a one-week pilot,
  measured against the baseline under Historical anchors.

## Owner decisions (2026-09-23)

1. **A script drives the matching; the ROM rebuild is the reviewer.** A
   byte-identical rebuild of three ROMs is a check no report can fake.
2. **The project's state is the code, the attempts ledger and one computed
   progress number.** STATE-LOG, the dispatch log, the queue essays, the
   generated state table and dashboard, the briefs index, the report inbox and
   the Dev Hub log are retired: hand-kept records went stale (two rounds ran
   unrecorded).
3. **Housekeeping is aggressive.** The research corpus, old logs and unused
   tools and tests go to a git tag and out of `main`, because the tag keeps
   everything retrievable and agents then read less.
4. **Roles are Brain, one executor (Worker) and Verifier.** The
   Decomper/Scaffolder lanes belonged to the retired process.
5. **The factory runs on the owner's Windows 11 desktop.** Its usage cap is set
   after a one-week pilot measures the cost per match, because that cost is
   unknown until measured.
6. **The merge rule stays `owner-approves`.** Once the factory runs, the owner
   approves one batch merge a day, not one per function, because per-function
   approval cannot scale to a factory.

## Parked, and why

- **Data-carve residue, deferred indefinitely** (none of it moves the headline
  metric): the 14.8 KB `data_020c9694`, `data_ov002_022ccc2e`, 34 odd-aligned
  ov004 data symbols, USA and JPN cross-region apply of brief 182 (its +36 B
  cascade exceeds `MAX_SHIFT_BYTES = 4`), cluster C/D cross-region apply at scale,
  brief 190 saturation chains (waiting for a recipe) and brief 188 epilogue
  orphans (2 picks).
- **Frontier above 376 B:** 1/20 = 5.0% at 377-512 B and 0/15 above 512 B;
  near-misses stop at compiler-internal register allocation. The 257-320 B band
  (ov002 sub-pool 6/30 = 20% on 2026-09-04) is the only pocket above 10%.
- **USA and JPN ports are finished** (15.85% each); only EUR movement changes
  the picture now.
- **Rewriting history to scrub `.wine-lane` blobs was declined:** it changes
  every commit hash for about 74 MB. Revive only between rounds, both machines
  synced, with citations remapped.
- **Wider-than-2-way concurrent linking through `wine_link_lock.py`** was never
  tested; only the link step serializes.
- **decomp.dev CI** was closed; it needed a private image only the owner could
  build.
- **Retired hook still seeded:** `docs/agents/framework.json` still lists
  `.githooks/pre-push` as a seed file (framework issue 25), so the next
  framework update would re-create it; that update round must delete the hook
  again.
- **Tool defects reported 2026-09-08, not re-checked:** `pool_freshness.py
  --module` returning an empty pool for a spelling it does not know, and
  `m2ctx.py` needing a `gcc` the Windows PC lacks. Re-verify in rounds C and E.

## Pointers

- Rules, roles and evidence: [`AGENTS.md`](../AGENTS.md); one folder per round in
  [`docs/rounds/`](rounds/).
- Build and toolchain: [`BUILD.md`](../BUILD.md); the matching guide:
  [`docs/decomp-workflow.md`](decomp-workflow.md).
- The attempts ledger is `docs/research/campaign-analytics/attempts.tsv`,
  checked by `tools/validate_attempts.py`; round B decides its final home.
- Everything retired lives at the git tag `archive/pre-redesign-2026-09-23`.

## Historical anchors

- 2026-09-23: the tag `archive/pre-redesign-2026-09-23` points at
  `5ad1a7a2a9733b191d5c838a36593d429bd7a841`, `main` before the redesign.
- 2026-09-23, pilot baseline: EUR natural-C is 17.38% (414,738 B) by
  `python3.13 tools/progress.py --version eur`. The one-week pilot is measured
  against the EUR natural-C gain made by hand between 19 August and 1 September:
  16.79% (400,530 B) at `555c2aeac`, the last `main` commit of 19 August, to
  17.38% (414,738 B) at `722d7b385`, the last of 1 September, which is 0.59
  points (14,208 B) in 13 days.
