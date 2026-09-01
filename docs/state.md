# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Older rounds archived.** 0818b, 0822b, 0825b, 0827, 0828 and 0828b were
lifted verbatim to
[`docs/research/brain-rounds-0822-0828b.md`](research/brain-rounds-0822-0828b.md)
on 2026-09-02 to keep this file at its intended size. Earlier archives:
[0805-0810](research/brain-rounds-0805-0810.md),
[0817-0818](research/brain-rounds-0817-0818.md).

**Round 0829 (2026-08-29, Windows PC, brain=Opus 5; both lanes Claude
Sonnet 5 at `max` effort, swarm on the build-free lane only.) Round 0829: the
falsification test came back negative — `verified_neighbor` survived 9
consecutive ROM gates and 95 ports, all 7 unchecked collision pairs audited
CORRECT, and the dashboard self-reference is fixed. USA 14.15%, JPN 14.07%.**

Merged **PR #1592**, **PR #1593**, **PR #1594**. `main` at `a3a5ce6fc`.

| region | before | after |
|---|---|---|
| EUR | 17.27% | 17.27% |
| USA | 13.79% | **14.15%** |
| JPN | 13.79% | **14.07%** |

**THE SIGNAL SURVIVED ITS OWN FALSIFICATION TEST.** `cm-verified-neighbor-tranche`
was deliberately written so a failure would be the valuable outcome. It did not
fail: **95 ports across 9 consecutive gated batches**, zero gate failures, zero
bisects, both regions. The first batch took **14 of 20** candidates that had
refused for two prior rounds. Brain verified 95 `.c` added / 95 `.s` deleted,
invariant 95/95/95, dup-scan clean, own three-region `--clean` gate PASS.

**Three things made PR #1594 trustworthy and are worth reusing.** It
**re-derived PR #1589's measurement against the current, larger tree before
running anything** (2,972/3,010 at 100%) rather than reusing a stale snapshot.
The predicted address is **arithmetic only**, and the call site verifies a real
size-matching target actually exists there before trusting it — the signal
cannot fabricate a resolution. And it wired `port_refusal_taxonomy.py` to the
same index so the measurement tool cannot silently drift from the resolver.

⚠️ **Tracked risk carried into the next item.** PR #1594 deliberately kept **two
copies** of `verified_neighbor_signal()`, arguing the evidence copy is frozen and
published with a different calling convention. That is reasonable — **but
`FLOOR_RANK` in this same codebase had already drifted across two copies** before
PR #1590 consolidated it, so the precedent cuts the other way.
`cm-verified-neighbor-drain` asks for either unification or a divergence test.

⚠️ **PR body miscount.** PR #1594's prose says "8 consecutive gated batches"
twice while its own table and the commit log both show **9**
(2+3+12+12+13+13+12+14+14 = 95). Material claims were all correct. **Verify
counts, not just totals.**

**PR #1592 — all 7 unchecked collision pairs are CORRECT**, canary reproducing
brief 673's verdict first. **The 1-in-8 known-wrong rate does not generalise.**
It found the shared mechanism:
`find_region_siblings.Function.reloc_sig` **deliberately excludes the relocation
target address** for cross-region portability — exactly the information that
would separate two same-size siblings calling different callees. 5 of 7 have a
surviving discriminator in the full reloc data; **2 (an IRQ chain) can never have
one** and shipped correct by raw byte match alone. It ran a critic pass naming
its own weakest verdict, and spot-checked its sub-agent's bonus finding rather
than relaying it.

**Bonus finding, brain-confirmed independently:**
`docs/research/brief-435-region-port-wave7.md` has two symbol names swapped **in
its prose only** — `src/usa/main/func_0209a8c4.legacy.c` calls `func_0209a900`,
and the two functions differ in size (0x50 vs 0x54), so they are not even
same-size siblings. The code was always right; only the brief's sentence is
backwards. Not fixed — out of that item's scope.

**PR #1593 — the derived-artifact self-reference is RESOLVED**, after costing
three consecutive rounds. The freshness check now tolerates **at most one**
differing line, only the trend table's **trailing** row, differing **solely** in
its SHA column, re-matched against the fresh render rather than assumed by
position. It states what the check still guarantees and what it no longer does,
and **demonstrated** the fix — pre-fix `--check` FAILs and post-fix PASSes on the
same squash-simulated mutation, with a regression test that performs it live.

**Remaining port pool, brain-measured on `main`:** USA 285 backlog / **255
sim=1.0**; JPN 299 / **269 sim=1.0** — 524 rows. The 100-port cap existed only
because the signal was unproven; `cm-verified-neighbor-drain` takes it off while
keeping the **stop-on-gate-failure rule unrelaxed**: nine clean gates bound the
error rate below PR #1589's ≤0.1% estimate, they do not make it zero.

⚠️ **THE STRATEGIC POINT.** **EUR has been flat at 17.27% for five consecutive
rounds.** Every gain since is derivative — USA and JPN porting EUR content that
already existed. When the 524-row pool empties, **all three regions stall unless
EUR moves.** `q-eur-next-frontier` is seeded to cost every remaining EUR avenue
— code bands, the 407,506 B data pool the Windows path bug had hidden, `.bss` —
**before** the ports run out rather than after.

⚠️ **Control 12 NOT executable, fourth consecutive round** — both lanes run
outside Claude Code and Codex. Every finding above is git- and tool-derived.

**Round 0830 (2026-08-30, Windows PC, brain=Opus 5; both lanes Claude
Sonnet 5 at `max` effort, swarm on the build-free lane only.) Round 0830: the
port campaign is DONE — 489 final ports take USA and JPN to 15.85% and leave 17
and 18 rows. And the code frontier was never closed: it was under-sampled. 87%
of the code pool sits behind 83 logged attempts.**

Merged **PR #1596** and **PR #1597**. `main` at `81c879c13`.

| region | before | after |
|---|---|---|
| EUR | 17.27% | 17.27% |
| USA | 14.15% | **15.85%** |
| JPN | 14.07% | **15.85%** |

**THE PORTS ARE FINISHED.** PR #1597 drained the pool the `verified_neighbor`
signal unlocked: **489 ports (USA 238, JPN 251) across 26 gated batches**, zero
failures. The byte-identical backlog went **524 -> 35 rows** (17 USA / 18 JPN).
Brain verified 489 `.c` added / 489 `.s` deleted, invariant 489/489/489,
per-region batch sums, dup-scan clean, own three-region `--clean` gate PASS.
**There is no derivative work left; from here only EUR moves anything.**

The lane **verified its own batch count programmatically**, citing last round's
miscount, and chose **unification** over a divergence test for the duplicated
`verified_neighbor_signal()` — reasoning that a test only *detects* drift while
unification eliminates it. It proved the refactor behaviour-identical by running
the measurement before and after, with the known-wrong cases predicting
byte-identical addresses.

⚠️ **PR #1596 CORRECTED THE BRAIN TWICE. Both corrections are load-bearing.**

**1. "EUR stuck at 17.27%" is a `.text`-only claim.** `progress.py`'s natural-C
metric — the same function `state-table.md` and `dashboard.md` both use — never
scans `.data`/`.bss`/`.rodata`. Brain confirmed directly: it returns "readable-C
`.text` bytes" and `CODE_SECTIONS = {".text", ".init"}`. **The data/carve lane's
work cannot move the headline number no matter how well it does**, and the brain
had been using "EUR is flat" as a strategic driver without that qualification.
The 407,506 B data pool moves a **separate, non-combined** metric.

**2. The "closed" bands were never exhausted — those were ATTEMPT counts, not
populations.** Brain re-derived from `attempts.tsv` directly:

```text
   193-256: 267 attempts      321-376:  70
   377-512:  66               513-1023: 16
    >=1024:   1
```

204 and 161 fresh never-tried candidates sit behind the "closed" 193-256 B and
321-376 B samples. **And the three largest bands hold 1,211,260 B dispatch-ready
— 87% of the entire 1,389,500 B code pool — against 83 attempts between them.**
`>=1024 B` has been attempted **once** in the whole ledger. **377-512 B appears
in no prior band recap at all.**

PR #1596 left the ship rate **blank** for all three rather than extrapolate from
83 attempts — correct, and consistent with `band-rate-vintage.md`, where a
same-band resample collapsed 27.6% to 0/60. It also corrected the item's own
premise (**ITCM has zero data symbols**; the Windows bug's hidden pool was 100%
overlay data) and the brain's "~220,000 B hidden" figure (true delta
**+241,590 B**). Its critic pass named its own weakest-provenance figure.

**Strategic consequence, and it is a real pivot.** The campaign spent months
believing the code frontier was mapped and mostly closed. It is not: it is
**barely sampled above 376 B**. `cm-377-512-probe` is seeded as a
pre-registered n=20 probe into the largest *reachable* untried band, and
`q-large-band-reachability` tests whether the toolchain can even feed those
bands — `m2c_feed.py`'s `find_object()` globs **only** `_dsd_gap@*.o` (brain
verified, around line 373) and may be structurally blind to the ~10,000
per-source delink objects. If so, the 83 attempts are a **tooling artefact**,
not a verdict on difficulty.

⚠️ **Control 12 NOT executable, fifth consecutive round** — both lanes run
outside Claude Code and Codex. Every finding above is git- and tool-derived.

**Round 0831 (2026-08-31, Windows PC, brain=Opus 5; both lanes Claude
Sonnet 5 at `max` effort.) Round 0831: both results came back NEGATIVE and both
were reported honestly. 377-512 B is CLOSED at 5.0%, and the brain's own
tooling-blindness hypothesis is DEAD. The band map is now complete and
monotone.**

Merged **PR #1599** and **PR #1600**. `main` at `bfbdc1d27`. EUR **17.27% ->
17.29%** — small, but the first EUR movement in six rounds. USA and JPN
unchanged at 15.85%.

**PR #1600 — the band is closed, on a threshold nobody moved.** n=20 at
377-512 B returned **1/20 = 5.0%**, inside the pre-registered `<=10%` zone. The
frontier is now fully mapped and **monotonically harder with size**:

| band | rate | status |
|---|---|---|
| 193-256 B | 0/60 | closed (204 fresh candidates remain) |
| **257-320 B** | **4/20 = 20.0%** | **the only pocket above 10%** |
| 321-376 B | 1/15 = 6.7% | closed |
| 377-512 B | **1/20 = 5.0%** | **closed — BR-7** |
| 513-1023 B | 0/15 | effectively closed |
| >=1024 B | 1 attempt ever | unmeasured |

Three near-misses broke **80%+** (91.5%, 82.0%, 81.1%) on genuine multi-attempt
work and were each diagnosed as **compiler-internal register-allocation
residuals, not under-effort** — the method has a ceiling and we have found it.
It also corrects BR-6's "fully characterised" claim, which had skipped this band
entirely.

**Two new levers, both worth carrying forward.** `volatile` on a raw MMIO
register pointer forces mwcc's own two-load read-modify-write instead of a CSE'd
single load — **20.8% -> 81.1% in one change**. And **shift-pair over mask
simplification**: reverting `(field & 7) == 0` to the literal
`(u32)(field << 0x1D) >> 0x1D` closed a 6.7% attempt to **100%**; it extends to
3-bit fields.

**PR #1599 — the brain's hypothesis is dead, and the ledger settled it.**
Coverage **rises** with size (48.4% small/mid vs 62.1% large), the opposite of
predicted. The load-bearing finding is build-independent: **zero of the 83
large-band attempts used gap objects at all** — every one used manual
disassembly reading. **The low attempt count is a methodology choice, not a
tooling wall.** Brain verified the canary directly: exactly one ledger row
>=1024 B, `0x02246a50` / ov002 / 1036 B / parked / `brief-650`, produced by hand.

⚠️ **BRAIN FINDING: PR #1599's coverage figure is BUILD-STATE-DEPENDENT.**
Running `tools/m2c_gap_coverage.py` on the integration tree returned **~0.0%
coverage in every band** against the reported 45-68%. Not a lane error — the
brain's `build/eur/delinks/` held **754 gap objects containing only 55 distinct
functions between them**, so the gap objects there were essentially empty. **The
percentage is a property of whichever build tree it is run against, not of the
project.** The conclusion survives untouched because it rests on the ledger
cross-check and the canary. `q-find-object-persource` requires the figure be
dated and labelled rather than cited as a constant.

⚠️ **Gate caught real drift at integration.** The first `--scope all --clean`
run passed all three SHA1 checks but **failed 2 tests** — both dashboard
freshness, including PR #1593's own regression test. Cause: merging the two
branches produced genuine content drift, which is more than the trailing-SHA
tolerance covers. Regenerated state-table then dashboard; `--scope tests` then
returned **3,540 passed**. **The `tee` wrapper reported exit 0 while the gate
had FAILED** — reading the log is what caught it.

**Next round.** `cm-257-320-drain`: 257-320 B is the only pocket above 10%, with
**263 unattempted candidates / 75,980 B** behind it — roughly 50 functions and
~15,000 B at its measured rate, and the two new levers have never been applied
there. Probing 513-1023 B was rejected: the gradient is monotone and it would
buy a predictable null. `q-find-object-persource` implements the fix PR #1599
scoped (**774/774** candidates resolve at a single predictable path — a
deterministic path check, not a glob widening) and dates the coverage figure.

⚠️ **Control 12 NOT executable, sixth consecutive round.**

**Round 0901 (2026-09-01, Windows PC, brain=Opus 5; both lanes Claude
Sonnet 5 at `max` effort.) Round 0901: the shift-pair lever is confirmed to
transfer on a controlled A/B, the `find_object()` tax is gone, and wall
membership has quietly become the thing that decides which candidates get
attempted at all.**

Merged **PR #1602** and **PR #1603**. `main` at `87b18e48f`. EUR **17.29% ->
17.32%**; USA/JPN unchanged at 15.85%.

**PR #1603 — 3/17 = 17.6% at 257-320 B**, inside the noise of BR-4's
pre-registered 20.0% at n=17. The lane **declined to declare a divergence it
could not support**, which is the correct call. Recorded as BR-8; **259
candidates remain unattempted** in the band.

**Lever 2 (shift-pair over mask) CONFIRMED TRANSFERRING, on a direct A/B.** On
`func_ov002_021fa968` the literal `(u32)(x << 0x1F) >> 0x1F` scored **71.2%**;
simplifying the identical logic to `x & 1` dropped it to **7.7%**. **Lever 1
(`volatile` on MMIO) was reported as "not exercised"** — no candidate in the
pool had the read-modify-write shape — rather than falsely confirmed. Two
restructuring attempts that made a match *worse* were disclosed
(78.8%->47.0%, 62.1%->57.6%). Three new unconfirmed failure signatures recorded
as leads: push-vs-`sub sp,#N` alignment padding, `str`/`stmib` fusion, and
independent-computation interleaving.

⚠️ **THE DENOMINATOR ISSUE, AND IT IS NOW STRUCTURAL.** PR #1603 screened **6 of
23** candidates out **on sight** as confirmed P-20 wall members and excluded
them: 3/17 = **17.6% attempted-rate** vs 3/23 = **13.0% pool-rate**. The
exclusion was defensible (11+ independently falsified prior attempts) and
clearly disclosed. But **wall membership is now gating which candidates get
attempted at all**, in the only band above the 10% closed line — and **a
screened-out candidate produces no attempt row, so it is invisible to every
ship-rate the campaign computes**. `q-wall-overblock-audit` is seeded to test
whether any wall is broader than its evidence; `cm-257-320-drain-2` now requires
**both** rate figures.

**PR #1602 — the `find_object()` tax is removed and the coverage figure is
dated.** The per-source fallback **disasm-verifies the header** at the
predictable path rather than trusting existence, so a stale object is never
silently returned; gap objects are still checked first. Its canary **confirmed
the brain's build-state finding directly**: the lane's tree (2,083 gap objects /
2,881 distinct functions) shows 45-68%, the brain's integration tree (754 / 55)
shows ~0% — **same code, two trees, two answers**. `m2c_gap_coverage.py` now
prints its own build state, turning a silent dependency into a visible one.

⚠️ **BRAIN MISS, caught by the lane.** `docs/dashboard.md` was stale on
`origin/main` — brain confirmed with `stale (line count differs)`. Cause: the
**round-0831 brain PR added a whole new trend row**, and PR #1593's tolerance
covers only a **rewritten SHA on the trailing row**, not a **new row appearing**.
Same self-reference, second form. **The brain's own loop is the trigger** — it
regenerates on the integration branch, but the round PR lands afterwards and can
invalidate it again. Folded into `q-wall-overblock-audit` as a second task.

**Process note:** the scaffolder worktree showed one dirty file
(`config/eur/arm9/delinks.txt`) whose diff was **empty** — a CRLF line-ending
artifact, not lost work. Check the diff before treating a dirty tree as a
finding.

⚠️ **Control 12 NOT executable, seventh consecutive round.**

**Round 0902 (2026-09-02, Windows PC, brain=Opus 5; both lanes Claude
Sonnet 5 at `max` effort.) Round 0902: the wall audit found that on-sight
screening leaves NO ledger trace for any wall, and that only P-20 is strongly
evidenced. The drain reported both denominators and corrected the brain's own
stale candidate count.**

Merged **PR #1605** and **PR #1606**. `main` at `676fed454`. EUR **17.32% ->
17.34%**; USA/JPN unchanged at 15.85%.

**PR #1605 — the ledger blind spot is TOTAL, and brain verified it exactly.**
Across all **1,822** rows, **zero** are `result=not-attempted` tagged to any
formal P-NN wall. The 31 `not-attempted` rows carry `unknown` (27), `C-31`,
`permanent-header`, `C-23-C-36`, `complexity` — nothing else. **Screening leaves
no trace for ANY wall**, so Deliverable 1's literal question was unanswerable
from the ledger and required re-matching each wall's idiom against the live
pool. PR #1603's own screening left zero rows (exactly 17 cite it = 3 shipped +
14 parked).

**P-20 is the only wall with genuinely independent 3+-round confirmation** — 55
confirmed members, 6 convergent falsification rounds (2026-07-27 to 2026-08-22),
and a fresh signature re-scan of the 1,777-candidate pool found **zero further
matches**. Every other wall tops out at 2 rounds; P-11 is accretive rather than
independent, P-28 self-admittedly a possible grab-bag. **So the screening in
PR #1603/PR #1606 was justified — it used the one strong wall.**

⚠️ **Two concrete defects, neither acted on (correctly).**
`generate_walls_index.py`'s heading-boundary regex only recognises an exact
`### P-N.`/`### C-N.` heading, so any other heading bleeds its bracket into the
prior wall's count. Brain confirmed the symptom in
`docs/research/codegen-walls-index.md`: **P-20 reports 30** (re-count 55) and
**P-49 reports 9** (re-count 1, from ~1,700 unrelated lines). And **8 walls
carry stale members still counted as blocking — worst P-11, 10 of 16 (62.5%)
already shipped**, never looped back; P-50 is under-counted the other way (17
pairs/34 symbols vs a documented 4). Both seeded as `q-wall-catalog-repair`.

**PR #1606 — 1/14 = 7.1% attempted, 1/27 = 3.7% pool**, both reported as asked.
**Zero of 27 candidates needed `--obj`** (down from all 20), independently
confirming PR #1602's fallback in the field. It **corrected the brain's stale
"259 remaining" to 246** and continued on the corrected number. **232 remain.**

⚠️ **Read the rate correctly — the brain nearly did not.** All-time
attempted-rate across BR-4/BR-8/BR-9 is **8/51 = 15.7%**, still marginal, not
closed. The pool-rate is lower **only because roughly half of examined
candidates are screened on P-20**, whose membership is **bounded at 55
confirmed**. The pool-rate measures "a bounded share of this band is P-20", not
"this band is hard". **Do not conflate them.**

**Honesty pattern held again:** the `volatile` lever finally met a genuine MMIO
read-modify-write case and came back **inconclusive** (blocked by an unrelated
structural mismatch), reported as such rather than claimed. A restructuring that
made a match worse (24.2%->12.1%) was disclosed **and reverted**.
Push-vs-`sub sp,#N` alignment padding is now **effectively confirmed
compiler-internal** (4th+ occurrence, zero source-level response) — a wall, not
a lever.

**The primary change seeded for next round:** the drain lane now **writes an
`attempts.tsv` row with `result=not-attempted` and the wall's `park_class` when
it screens**. That closes the blind spot permanently and makes every future
screening measurable.

**Process note:** the scaffolder worktree again showed dirty `delinks.txt` files
with **empty diffs** — CRLF artifacts. The kickoff's "check the diff before
reporting" instruction worked.

⚠️ **Control 12 NOT executable, eighth consecutive round.**

⚠️ **The `pre-push` invariants guard was INERT for its entire life** (found
2026-09-02 by an external review of the agentic workflow, verified here). It
captured the checker's status as `if ! cmd; then rc=$?` — `!` inverts the
pipeline status, so `$?` inside that block is **0** and the `-eq 2` "errors,
block the push" branch was unreachable. Every push since the hook landed went
unguarded. `tests/test_install_git_hooks.py` pinned the installer, the file
mode and `core.hooksPath`, but **never executed the hook**, which is exactly
the "documented but untested safety mechanism" failure class. Fixed with
`|| rc=$?`, plus `rev-parse --verify` (an unresolvable SHA was being echoed
back, so the "run conservatively" fallback also never fired) and CR-stripping
on the ref manifest. `tests/test_pre_push_hook.py` now runs the real script;
mutating the fix back to the original pattern turns 3 of its 4 tests red.

⚠️ **39 tests never run in CI** (found 2026-09-03 while verifying PR #1608's
one red test). `pytest --collect-only` sees **3,594**; CI's
`unittest discover` runs **3,555**. Eight files use module-level `def test_*`
functions that `unittest` cannot collect — including
`test_validate_attempts.py` (12 tests, guards the ledger every ship-rate is
computed from) and `test_port_to_region.py` (the port resolver).
`tools/check_test_imports.py` sounds like it would catch this and does not: it
checks only third-party imports. Seeded as `q-ci-test-visibility`.

⚠️ **A lane is running on the Mac, not the Windows PC.** PR #1608's red test
resolved `python3.13` only. `tools/make_kickoff.py` stamps
`"python" if host == "windows" else "python3.13"` and the test hard-codes the
Windows form, so it can only pass on Windows. The `python3.13` **hard version
pin** is a separate latent defect — it breaks on any Python upgrade — and is
deliberately NOT being changed blind from a machine that cannot verify the Mac.

**Round 0903 (2026-09-03, Windows PC, brain=Opus 5; both lanes Claude
Sonnet 5 at `max` effort.) Round 0903: the ledger screen-row change landed and
worked, P-20 screens fell 12 -> 0, and the wall-index fix corrected seven stale
counts. Written up retroactively during round 0904 — see the process defect
below.**

Merged **PR #1608** and **PR #1609**, plus brain PRs **#1610**, **#1611**,
**#1612**, **#1613**, **#1614**. `main` at `050f06c0f`. EUR **17.34% ->
17.36%** (413,622 -> 414,174 B); USA/JPN unchanged at 15.85%.

**PR #1609 — 2/16 attempted (12.5%), 2/17 pool (11.8%)**, shipping
`func_ov002_021c9c94` and `func_ov002_021c9fc4`. It delivered the ledger change
round 0902 seeded: `attempts.tsv` now carries a formal `result=not-attempted`
row when a candidate is screened, and `validate_attempts.py` reported 1,853
rows / 0 errors. **P-20 screens went 12 -> 0**, so this was the first tranche
where attempted-rate and pool-rate nearly converged.

**PR #1608 — the wall-index heading regex is fixed and seven counts
reconciled.** It found a wall nobody had asked about (C-39) and corrected
**P-11 to 13/16 shipped, not the audit's own 10/16**; P-50 went 4 -> 21.

⚠️ **PROCESS DEFECT — this round's own bookkeeping never happened, and both
guards that exist to catch it are inert.** PR #1614 appended two warning
paragraphs into the round-0902 section: it opened no Round 0903 heading, left
the `main-sha` anchor at `676fed454` (eight PR-merges behind by the time round
0904 began), and added no `0903` dispatch-log row. Control 5's checklist went
unticked. Two guards should have fired and could not:

1. `tools/queue_state_drift.py` measures anchor staleness with
   `git rev-list --count --merges <anchor>..<ref>`. **The repo has squash-merged
   exclusively since 2026-08-25** (`efb512d32`, PR #1581, the last real merge
   commit), so `merges_since` is **always 0** and the `_STALE_MERGE_TOLERANCE`
   branch is unreachable. Demonstrated in round 0904: `main_anchor_checker`
   returns `(True, 0)` for anchors roughly 30 PRs back.
2. `tools/check_dispatch_log.py` requires a dispatch row only when the
   `**Last updated:**` *block* changes — that line through the next blank line.
   A round appending its narrative anywhere else skips the requirement
   silently, which is exactly what happened.

**Neither guard is wired into any CI workflow.** This is the third instance of
the "documented, installed, inert" class in three rounds, after the pre-push
invariants hook and the unittest collection gap. `docs/guard-coverage-review.md`
is not evidence against it: that table lists `test_install_git_hooks.py` as
FIRES-CORRECTLY while the hook it installs was inert for its entire life — it
audited the installer, not the behaviour. Seeded as `q-handoff-guard-repair`.

**Round 0904 (2026-09-04, Windows PC, brain=Opus 5; both lanes Claude
Sonnet 5 at `max` effort.) Round 0904: the 257-320 B band is not one pool but
two, and the round spent 16 of 17 attempts on the wrong one. Both lanes
reported their own limits accurately; the brain's contribution was to put
numbers on what the drain lane had already described in prose.**

Merged **PR #1616**. **PR #1615 is HELD open on a red required check** — see
below. EUR **17.36% -> 17.37%** (414,174 -> 414,466 B); USA/JPN unchanged at
15.85%.

⚠️ **THE BAND IS TWO POOLS. This is the round's finding and it decides the next
dispatch.** PR #1616 returned 1/17 = 5.9% and reported it as a genuine
divergence from the all-time figure, explaining in prose that the batch "drew
heavily from `main`-tier candidates rather than the `ov002` near-miss shapes
that dominate the campaign's ship history". The brain quantified that
explanation from the ledger, across all six 257-320 B briefs:

| sub-pool | shipped / attempted | remaining candidates |
| --- | ---: | ---: |
| **ov002** | **6/30 = 20.0%** | **132** |
| `main` | 1/34 = 2.9% | 56 |
| everything else | 4/20 = 20.0% | 10 |

The per-round rate tracks the module mix almost exactly: drain-1 (10 main /
6 ov002) 17.6%, drain-2 (6/7) 7.1%, drain-3 (0 main / 12 ov002) 12.5%, drain-4
(16 main / 1 ov002) **5.9%**. **The divergence is a selection artefact, not
band exhaustion** — drain-4 spent 16 of 17 attempts on the 2.9% sub-pool while
132 candidates sat in the 20.0% one. Remaining pool measured with the project's
own `pool_freshness.py`: **198 candidates / 57,976 B**, reconciling exactly
with the lane's 215 minus its own 17.

⚠️ **Three different cumulative rates for this band are in circulation, and the
wall catalogue is two rounds stale.** `codegen-walls.md`'s BR ledger stops at
**BR-9**; drain-3 and drain-4 never added BR-10/BR-11. The figures are:

| source | figure | scope |
| --- | ---: | --- |
| `codegen-walls.md` BR-9 | 4/31 = 12.9% | BR-8 + BR-9 only |
| `state.md` + the last two kickoffs | 8/51 = 15.7% | BR-4 + drains |
| drain-4's writeup, brain-recomputed | **11/84 = 13.1%** | all six briefs |

**11/84 = 13.1% is the correct one** — the lane derived it independently and
the brain's recomputation matched exactly. One denominator, pinned, from now
on. A wall catalogue that stops being updated is the same narrative-vs-ledger
divergence the C-63 recovery just found in the other direction.

**PR #1616 — verified, and honest about its own limits.** Brain re-derived the
17 ledger rows from the diff: 1 shipped / 16 parked, **zero screens**, so
attempted-rate and pool-rate are genuinely identical at 5.9% rather than
converged by argument. The C-63 recovery (`func_ov002_02236bbc`) was a
**narrative-only decline** — documented as parked in `codegen-walls.md` but
never ledgered; the lane applied the lever for real, got 8.96%, and recorded
it. It did not ship, and the lane did not claim it did. Control 10 dup-scan
clean; `.s` deleted, `.c` added, `delinks.txt` flipped.

**Its systemic finding is real and is the highest-value tooling item on the
board.** `prepare_compile_source`'s auto-scaffold declares every referenced
`unkNN` field as a sequentially-packed `int` with **no padding for the real
byte gap**, so a compile succeeds at the wrong field offsets. One `char _pad[N]`
insertion took the shipped function from **95.89% to 100.0%**, and the same fix
moved `func_0201cab4` from 10.96% to **83.6%**. The gap is derivable from the
numeric suffixes already present in the field names.

⚠️ **BRAIN FINDING: `m2ctx.py` hardcodes `gcc`, and this machine has none.**
Reproduced directly — `m2c_feed.build_context('eur','ov002')` raises
`FileNotFoundError [WinError 2]`. PR #1616 fixed the *consequence* (the raise
escaped and dropped the whole skeleton) by catching it and recording
`context_error`, which is correct. But **`context_error` is written at
`cmatch_loop.py:361` and read nowhere**, so the degradation is now silent
rather than loud. The modules this hits are exactly those with a `*_core.h` —
**`ov002`**, the 20.0% sub-pool the next round targets. `main` has no core
header and legitimately returns `None`, which is why drain-4 was unaffected and
why the lane's attribution of its own near-misses to the scaffold, not to the
context, was correct.

**PR #1615 — the parity guard is real, brain-verified red.** Control 7: pointed
`scan_collection` at a temp tree containing a module-level `def test_*` and a
non-`TestCase` class; **both go red**, and the guard catches the class form the
brief never asked for. Green on the converted tree with an **empty allow-list**
— all 39 were converted, none excused. Brain re-derived the population by
running the new guard against `origin/main`: **exactly 39 violations across
exactly the 8 named files, per-file counts matching.**

⚠️ **PR #1615 IS HELD: its required `unittest` check is red in CI, and both
failures are real.** `Ran 3593 tests ... FAILED (errors=2, skipped=27)`:

1. `test_ship_coverage_history_is_not_vacuous` — `KeyError:
   'cm-main-tier-sweep-7'`. It derives rounds from round-labelled commits, but
   the `unittest` job uses a default shallow `actions/checkout` with no
   `fetch-depth: 0`. The `drift-check` job sets it explicitly and documents why;
   this one never did.
2. `test_pool_item_stamps_live_figure_and_reproducer` — `FileNotFoundError:
   'python3.13'`. `make_kickoff._run_pool` **executes** the pinned interpreter,
   and `_lane_spec` models only `windows`/`mac`, so the Linux runner resolves
   `python3.13`, which is absent (CI is 3.11).

**Both are pre-existing defects that were invisible precisely because these
tests never ran in CI** — the new guard working as designed on its first
outing. The brain did **not** fix (2) here: round 0903 reserved the
`python3.13` pin as unverifiable from a machine without the Mac, and that
reservation is not overruled silently. The branch stays open and the item
returns to the decomper lane.

The lane's headline "gap closed from 46 to 0" mixes the real 39 with a 7-test
discrepancy it separately investigated and concluded was an artefact of its own
diagnostic script, not of the repo. It disclosed that openly and did not report
the 7 as a repo defect — but the two halves have different provenance and
should not be quoted as one figure.

⚠️ **The gate FAILED on the first integration run, and the wrapper exited 0.**
All three SHA1 PASS, then `test_generate_research_index.py::
TestCommittedIndexIsCurrent` went red: PR #1616 added its research writeup
without re-running `tools/generate_research_index.py`. One generated line.
**`[exited with code 0]` sat directly beneath
`==================== GATE FAIL ====================`** — reading the log is
what caught it, for the second round running. Fixed on the lane's branch
(`8cc6301bd`, fast-forward push, not a force) per the round-0824c precedent,
then re-gated to `GATE PASS` (3,584 passed / 16 skipped).

**Round 0902's two dashboard failures are gone**, confirming the diagnosis:
they were caused by round 0903's missing regeneration, and PR #1616's
regeneration cleared them.

**Gate provenance, stated exactly:** the three SHA1 PASS lines were produced on
the integration tree *before* the one-line research-index commit; the only
delta between that tree and the `GATE PASS` tree is `docs/research/README.md`,
verified by `git diff --stat` and confirmed absent from `build.ninja`.

✅ **Control 12 EXECUTABLE — first time in nine rounds.** Both lanes ran in
Claude Code and both transcripts were read.

| lane | session located | final report read | caveats / parked work | matched branch, PR, files |
| --- | --- | --- | --- | --- |
| Claude Code Decomper | yes (`local_8ae4709a`) | yes | disclosed a 7-test discrepancy as its own instrumentation artefact rather than a repo defect; left the `python3.13` pin untouched as instructed and reported it as a finding | yes — 13 files, +571/-355 |
| Claude Code Scaffolder | yes (`local_32bdcd11`) | yes | disclosed a self-inflicted pytest race (regenerated `dashboard.md` while pytest exercised its own staleness fixtures) and re-ran clean; declined to adjust the 5.9% figure | yes — 10 files, +228/-107 |

Neither lane's report contradicted the artefacts, and neither overstated a
result. Both surfaced their own limits before the brain asked.

**Round 0905 (2026-09-05, Mac M1, brain=Opus 5; both lanes on the
same Mac — scaffolder toolchain-bound, decomper build-free.) Round 0905: the
brain moved to the Mac, unblocked and merged the PR round 0904 held, and found
that the ov002 m2c blocker is a property of the Windows PC rather than of the
tool.**

Merged **PR #1615**. `main` at `5b865162b`. No region percentage moved: the
merge touches tests, CI and tooling only, and no build input.

✅ **PR #1615 IS UNBLOCKED AND MERGED — both held defects were real, both are
fixed, and the reserved `python3.13` pin was never implicated.** Round 0904
held it on a red required `unittest` check and returned the item to the lane.
The brain fixed it on the lane's branch instead (fast-forward push, not a
force, per the round-0824c precedent), because both defects were one line each
and a lane-round is worth more than that:

1. `.github/workflows/tests.yml` — the `unittest` job used a bare
   `actions/checkout` while eight other workflows pin `fetch-depth: 0`. Added,
   with the reason inline, mirroring `generated-files-drift.yml`.
2. `tools/make_kickoff.py` — `_run_pool` executed `spec.interpreter`, which
   names the interpreter the WORKER will type on the TARGET host, not one that
   exists on the host generating the kickoff. Now `sys.executable`.

⚠️ **Round 0903's reservation was correct to make and is intact.** Changing the
`python3.13` pin needed the Mac; the brain had the Mac and verified the pin is
untouched — `lane_spec('scaffolder','mac').interpreter` is still `python3.13`,
and the emitted `REPRODUCER` line is unchanged because `pool_freshness.py`
prints its own hardcoded command string rather than echoing its invoker. The
interpreter the kickoff NAMES and the interpreter the generator RUNS are
separate concerns, and conflating them was the whole defect.

⚠️ **The defect is host-independent, not Linux-specific as reported.** It
reproduces on macOS too, and with the OPPOSITE missing interpreter
(`FileNotFoundError: 'python'` for `host='windows'`), because the failing test
pins the target host rather than the running one. CI's `python3.13` report was
one symptom of a two-sided bug.

⚠️ **BRAIN FINDING: the `m2ctx.py` gcc blocker is a property of the Windows PC,
not of the tool — and this round's drain target is exactly the pool it hits.**
Round 0904 recorded that `build_context('eur','ov002')` raises
`FileNotFoundError [WinError 2]`. On this Mac `/usr/bin/gcc` exists as the
Apple clang shim, and the call returns a real context file:

| call | result |
| --- | --- |
| `build_context('eur','ov002')` | `build/eur/_m2c_ctx/ov002_core.ctx.c`, **5,035 B**, exists |
| `build_context('eur','main')` | `None` — no core header, correct |

So `cm-257-320-drain-5` is the first ov002 tranche to run WITH an m2c compile
context, and round 0904's explanation of why drain-4 was unaffected is
confirmed from the other direction. `context_error` is still written at
`cmatch_loop.py:361` and read nowhere, so the fix to surface it stands — the
Windows PC will still trip it.

**The inert drift guard, re-derived independently on current `main`.**
`git rev-list --count --merges efb512d32..HEAD` is **0** against **36** real
commits, and `main_anchor_checker` returns `(True, 0)` for anchors `0b2f8c630`,
`676fed454` and `efb512d32` — 5, ~10 and 36 commits back. The
`_STALE_MERGE_TOLERANCE` branch is unreachable, exactly as round 0903 said.
Seeded as a real queue item this round rather than narrative only, which is
what round 0903's seed was.

⚠️ **UNEXPLAINED: at 22:56 on 2026-08-31 all nine non-brain worktrees were
hard-reset to `origin/main` by something outside the brain session.** No work
was lost — every branch involved was already squash-merged, and the pre-reset
commits remain in reflog — but "this branch is merged" stopped being
independent evidence for those nine, so the local branch namespace was left
untouched rather than garbage-collected. Recorded because the next brain will
see nine branches sitting exactly on `main` and should not read that as proof
of anything.

**Housekeeping.** The five spent `claude-decomper-batch*` worktrees (round-0822
sweep dirs, content verified present on `main`, remote branches already deleted
upstream) were removed, reclaiming ~470 MB. `git worktree remove` left three of
them half-deleted with ignored build artefacts in place and had to be finished
by hand — worth knowing before scripting this. The four named lane worktrees
were deliberately NOT recut to the new `decomper/`/`scaffolder/` naming: the
rename is cosmetic and the paths are load-bearing in live kickoffs.

⚠️ **`make_kickoff.py`'s Mac lane paths do not exist on this Mac.**
`LANE_WORKTREES` names `~/Dev/spirit-caller/decomper` and
`~/Dev/spirit-caller/scaffolder`; the real worktrees are
`claude-decomper-queue` and `claude-scaffolder-queue`. A generated Mac kickoff
would send a lane to a nonexistent directory and the location guard would
correctly STOP it. Both kickoffs this round were hand-written against the real
paths and pass `kickoff_lint.py` on all eight required checks. Seeded.

**Gate provenance, stated exactly.** The 3-region `gate3.py --scope all` run
was started against `1592a2568` and PR #1615 merged while it was running. The
sha1 result carries to `5b865162b` because #1615 touches **no build input** —
verified by file list: `.github/workflows/`, `docs/`, `tests/`, and two
`tools/` scripts, with nothing under `src/`, `libs/`, `config/`, `include/` or
`assets/`. The tree was not re-gated for a change that cannot reach the ROM.

**Control 12 — not yet executable for this round.** The lanes had not run at
the time of writing; the transcript audit belongs to the review that follows
their PRs.

**Last updated:** 2026-09-08 — **(Windows PC, brain=Opus 5; both lanes ran
on the Mac M1 last round — scaffolder toolchain-bound, decomper build-free.)
Round 0908: the brain moved back to Windows and merged both Mac-round lane
PRs. Two rounds ran on the Mac and left no record of themselves at all, and
the drain lane's headline rate is a lower bound it measured with a compiler
scaffold it was still repairing.**

Merged **PR #1620** and **PR #1622**. `main` at `288253e4b`.
EUR 17.37% -> **17.38%** (414,738 B natural C). USA and JPN unchanged at
15.85% — neither merge touches a port.

⚠️ **ROUNDS 0906 AND 0907 ARE UNRECORDED, AND THIS IS THE ROUND-0903 DEFECT
RECURRING TWICE UNDER ITS OWN REPAIR.** `docs/dispatch-log.md` ends at 0905.
`docs/state.md`'s newest narrative was 0905. Both rounds demonstrably ran —
PR #1622's writeup is dated by kickoff round 0907, PR #1620's body describes
its own 0906 and 0907 iterations — and `grep "0906\|0907"` over `state.md`
and `dispatch-log.md` on `main` at `b14879e28` returned **nothing**. The only
surviving trace anywhere is one sentence in `docs/decomp-workflow.md` /
`docs/tools-index.md`, shipped by PR #1621. Two rounds of dispatch, host,
model and lane-assignment facts are gone and cannot be recovered from memory
without violating the log's own premise. Rows are appended below carrying only
what git can still prove.

**The repair PR #1620 does not close this hole, and the brain verified why.**
`check_dispatch_log.check_texts` opens with

    if state_base is None or state_head is None or state_base == state_head:
        return CheckResult(True, detail="state narrative unchanged; ...")

so a round that never touches `docs/state.md` is never asked for a dispatch
row. 0906 and 0907 touched nothing. Guard 1 is the only backstop and its
`_STALE_MERGE_TOLERANCE = 2` is exactly the width of a normal two-PR round.
Seeded as `q-fail-open-audit` with the 0906/0907 window as its canary.

✅ **Both repaired guards were confirmed FIRING live, which is the part that
was never true before.** On `main` at `b14879e28`, `queue_state_drift.py`
reported the `5b865162b` anchor as three PR commits behind the ref against
a tolerance of two.
Before PR #1620 that branch was unreachable by construction — the tool counted
`--merges` in a repo that has squash-merged exclusively since 2026-08-25, so it
returned "fresh, zero behind" for every input. Both guards are now wired into
`generated-files-drift.yml`, so this round's own PR is checked by them.

**PR #1622 was held on a red required `unittest`, and the brain fixed it on
the lane's branch** (fast-forward push, not a force — the round-0824c and 0905
precedent) rather than spending a lane-round on a one-file regeneration.
Reproduced on Windows at `e6574bbf0`: `TestCheckToleratesSquashMergedTrailingSha`
and `TestCheckToleratesTrailingRowAddition` both failed. After
`python tools/generate_dashboard.py` and nothing else, the file went
**34 passed**. ⚠️ **Those two tests do not use a fixture** — they run the real
`--check` against the live committed `docs/dashboard.md` and then simulate one
further trailing-row delta. The tolerance admits exactly one row, so any branch
that touches `docs/state-table.md` without regenerating puts the committed file
one row behind and lands the simulation two rows out. **This file has now cost
four rounds** — 0901, 0904, 0907 and this one — each time diagnosed from
scratch and each time fixed by "regenerate and commit". Seeded as
`q-dashboard-check-coupling`.

⚠️ **BRAIN FINDING: `pool_freshness.py --module` fails OPEN.** Verified on
`40e5d826b`:

| `--module` | count | bytes |
|---|---|---|
| `overlay002` | 116 | 33,948 |
| `ov002` | 0 | 0 |
| `not_a_real_module` | 0 | 0 |

No error, exit 0. `ov002` is the spelling used in `attempts.tsv`'s own
`module` column, in `codegen-walls.md` and in every 257-320 B kickoff written
so far, so a lane typing the name it reads everywhere else is told the pool is
empty. The brain hit this itself while sizing this round's dispatch. Folded
into `q-fail-open-audit`.

**THE DRAIN'S 6.25% IS A LOWER BOUND, NOT A MEASUREMENT — and that decides the
next dispatch.** `cm-257-320-drain-5` shipped 1 of 16 attempted, all 16 from
`ov002` exactly as scoped, which read at face value kills round 0904's
two-pool hypothesis. But the same round found and fixed **three** real
auto-scaffold bugs in `cmatch_loop.py` *while draining*, one of which its own
writeup calls "a 100% compile blocker for every ov002 candidate", and two of
the three were found mid-tranche. Brain recomputed the parks from
`attempts.tsv` (16 rows, 34 compile attempts): of the 15 parks, **11 of the 13
carrying a numeric match are under 20%**, only two cleared 20% (53.52%,
25.35%), and **2 never compiled at all**. That is the shape of a scaffold
mistyping fields, not of a codegen wall. `cm-257-320-drain-6` re-attempts all
15 parks under the fixed toolchain as a pre-registered A/B before taking any
fresh candidate — one variable changed, and a 0/15 re-run is a publishable
result that closes the two-pool question for good.

**Brain finding, not acted on:** PR #1620 changed `make_kickoff.py`'s Mac lane
paths to `~/Dev/spirit-caller/claude-{decomper,scaffolder}-queue`, which is
right per round 0905's on-Mac verification — but `AGENTS.md`'s worktree table
and `docs/dispatch-log.md`'s own header still name
`~/Dev/spirit-caller/{decomper,scaffolder}`. Two documents now disagree about
where the Mac lanes live. Windows dispatch is unaffected.

**Directory sync (this host).** All five Windows worktrees were clean — no
uncommitted lane work was at risk. `brain` fast-forwarded to `main`;
`decomper`, `kb-map`, `kb-types` and `scaffolder` were detached onto
`origin/main`; four merged local branches were pruned. Five unregistered
directories remain beside the worktrees (`mainsweep7-p2batch2`,
`sweep17-batch1`, `sweep3-4`, `sweep9-batch5`, `scratch_stash`) plus
`mwccarm.bad.tmp`; they are not registered worktrees and were left alone
pending an owner call.

⚠️ **Control 12 NOT executable.** Both lanes ran on the Mac; their transcripts
are not readable from this host. The audit belongs to whichever brain next
runs on the Mac, and by then rounds 0906/0907 will have been unrecorded for
three rounds — see the dispatch rows below.

<!-- main-sha: 288253e4b -->
<!-- parked-prs: 1020 -->

## Durable conventions (lifted out of the archived round narrative)

Per-round narrative for rounds 0805-0810 now lives in
[`docs/research/brain-rounds-0805-0810.md`](research/brain-rounds-0805-0810.md).
These four conventions were buried inside it and are load-bearing, so
they stay here:

1. **The two HTML markers above are machine-checked** by
   `tools/queue_state_drift.py`. `main-sha` is the `main` commit this
   document describes — drift fires when `main` runs more than
   `_STALE_MERGE_TOLERANCE` (2) PR-merges ahead of it, so a stale handoff
   is caught even when this file makes no PR-count claim. `parked-prs` is
   the EXPLICIT parked list: parked is never inferred from GitHub's draft
   bit, because the worker lanes publish ordinary output as drafts.
2. ⚠️ **The active-PR count EXCLUDES the doc-PR carrying this update.**
   That PR is open while you write the number and merged moments later, so
   counting it makes the claim wrong on `main` the instant it lands, and
   fails `drift-check` on the NEXT PR's CI. Write the count you expect to
   be true *after* this update merges. The `main-sha` anchor has an
   explicit merge tolerance for the same reason; the PR-count claim has
   none.
3. **The canonical dispatch rule**: the brain hands over **one complete
   paste-ready message per active standing lane that needs dispatch,
   normally all four**, in the same final response — never deferred to a
   later message. `docs/agents/brain-onboarding.md` holds the canonical
   statement; `AGENTS.md` and `.claude/agents/brain.md` defer to it.
4. **Branch protection is LIVE** (ruleset `main-protection`). Required
   checks are `Python (ruff)`, `Markdown (markdownlint-cli2)`, `drift-check`
   and — since round 0822b (#1531) — `unittest`, the four that run on EVERY
   PR (`pr-invariants` and the compile checks are paths-filtered; requiring
   them would hang docs-only PRs — the required set and the workflows are
   contract-checked by `tools/check_ci_contract.py`). Force-push and deletion
   are blocked; repo-admin bypass keeps the brain's gated integ→main flow
   working. The brain's 3-region `ninja sha1` gate remains the real merge
   gate, always run locally.
5. **Every seeding/doc PR appends a row to
   [`docs/dispatch-log.md`](dispatch-log.md)** — round, date, host, brain
   model, lanes dispatched, transcript location. Machine-locality has burned
   this campaign at least five distinct ways (#1504's correction, the 0822
   transcript-audit gap, #1520's local git object, the WRONG-WORKTREE void
   dispatch); the log is the structural fix. A kickoff is written for the
   host in that row, never forwarded across machines.

## In flight

**Roster (as of 2026-09-02): TWO lanes, not four.** `decomper` and
`scaffolder`, both on the Windows PC. The Codex lanes (`kb-map`, `kb-types`)
and their queues are **dormant** — `docs/queue/codex-*.md` are retained as
history, not dispatched. Owner is trialling external models (GPT 5.6 Luna,
Gemini) in the two live lanes, which is why control 12's transcript audit has
been unexecutable since round 0827 — see that control's external-harness
clause for the compensating checks that replace it.

**Standing scheduling rule:** at most **one toolchain-bound lane per machine
per round**; the second lane gets **build-free** work. The compiler serialises
machine-wide and ignoring this cost a full lane-round on 2026-08-27.

**Current lane items** (re-seeded round 0908, live on `main`):

| Lane | Item | Kind |
|---|---|---|
| scaffolder | `cm-257-320-drain-6` | toolchain-bound |
| decomper | `q-dashboard-check-coupling`, `q-fail-open-audit`, `q-codegen-walls-br-backfill` | build-free |

**#1020 (decomp.dev CI) is parked on an OWNER action, not on engineering.**
It is complete as written (+579/-0: a Dockerfile, a workflow, and setup docs).
decomp.dev ingests only CI build artifacts, the build needs the ROM, and the
ROM is correctly never committed — so the design bakes it into a **private**
GHCR image that CI pulls. **Nothing in this repo can unblock it**: it needs
cntrl_alt_lenny to build and push that private image and grant the workflow
access. Declared in the `parked-prs` anchor above so `queue_state_drift.py`
excludes it. Leave it open; it is not stale work.

## Active clusters (post-pivot reality)

**The scaffold phase is officially DONE.** Cluster work is no
longer the primary axis; the project is now grinding C source
against the curated function queue. Cluster status snapshot
retained below for handoff context but cluster-side residue is
intentionally DEFERRED per pivot discipline — if any cluster
residue actively blocks a code-decomp brief, file as a brief 190+
followup; do NOT pre-emptively grind it.

- **Cluster A** — `.rodata`. Largely drained pre-SHA1; brief 141
  closed the ov004 sweep. **DEFERRED (no remaining open work
  surfacing in code-decomp wave 1).**
- **Cluster B** — main `.data`. **FULLY CLOSED** post brief 181 +
  185 (`data_ov006_021ceae4` worked example shipped under the
  raised 4096-byte cap). Single residue: `data_ov002_022ccc2e`
  (odd-aligned size=2, no nearby 4-aligned predecessor) —
  DEFERRED.
- **Cluster C / D-1 / D-2** — ov004 sub-clusters. 73 EUR syms
  shipped pre-pivot. Brief 184 wired the cross-region apply
  subcommands (EUR dry-run smoke 1855 / region). **Cross-region
  apply at scale is DEFERRED** — would be a follow-on to brief 178
  if revived, but pivot discipline says no.
- **Cluster D-3** — nested struct arrays. **EFFECTIVELY CLOSED**
  post brief 178 + 181 (~105 chunks / ~110 KB shipped). Single
  residue: `data_020c9694` 14.8 KB mega — DEFERRED.
- **Cluster D** — `.bss`/zeros. **W7 patcher chain CLOSED for EUR**
  via brief 182 (134 → 142 → 146 → 150 → 162 → 164 → 168 → 180 →
  183 → 186 → 182). USA + JPN cross-region of brief 182's two
  claims hit a +36 B cascade exceeding `MAX_SHIFT_BYTES = 4`;
  reverted, deferred indefinitely. 34 of 35 odd-aligned ov004 data
  symbols remain unclaimed — DEFERRED.

## Metrics — what the headline is, and what it cannot measure

**Acceptance gate (unchanged, the only thing that decides correctness):**
the 3-region byte-identical `ninja sha1`, driven by
`python tools/gate3.py --scope all`. Nothing below outranks it.

**Headline progress metric:** **natural-C percentage per region**, from
`tools/progress.py` — the same function `docs/state-table.md` and
`docs/dashboard.md` both render. Do not hand-compute it; run the tool.

⚠️ **The headline is `.text`-ONLY, and this is load-bearing.** `progress.py`
defines `CODE_SECTIONS = {".text", ".init"}` and never scans `.data`,
`.rodata` or `.bss`. So **no amount of data/carve work can move the headline
number** — the ~407,506 B reachable data pool moves a *separate, non-combined*
metric. Established by PR #1596 (round 0830) after the brain had spent two
rounds treating "EUR is flat" as a strategic signal without that
qualification. Any claim of the form "EUR is stuck" must say *at which
metric*.

**Historical metrics, retained for provenance only — NOT the headline.**
`complete_units`, `matched_code_percent`, `matched_functions` and
`fuzzy_match_percent` from `build/<ver>/report.json` were the canonical
indicators in the 2026-05 scaffold era. The brief 199/202/203 diagnosis of why
objdiff's fuzzy metrics under-count `.legacy.c` and `.s` ships is still correct
and worth reading —
[`objdiff-fuzzy-vs-complete-metric.md`](research/objdiff-fuzzy-vs-complete-metric.md)
— but the figures that used to sit here were from the brief-671 era and are
about a thousand PRs out of date. They were removed rather than refreshed:
a stale number in the file the next brain reads cold is worse than no number,
and the live ones are one command away.

## Worktree convention — isolation per agent, two equivalent mechanisms

Each agent runs in its own worktree to prevent parallel-session
interference that bit briefs 138 + 140 earlier. **AGENTS.md is the
canonical spec** (worktree-convention section there now covers both
mechanisms — updated in this brain-PR). Two mechanisms are
equivalent:

- **Mac convention (manual sibling worktrees):** `~/Dev/spirit-caller/brain`,
  `~/Dev/spirit-caller/decomper`, `~/Dev/spirit-caller/scaffolder`
  — three named siblings under one parent, set up once via `git worktree
  add`. Each has its own `orig/` baseroms. Adopted during the
  SHA1-milestone arc; PR #564 documented this in state.md.
- **Windows convention (Claude Code automatic sandboxes):** Claude
  Code creates per-session worktrees inside `.claude/worktrees/<auto-
  name>/` for each agent. No manual setup. They share the main
  checkout's `orig/` baseroms. Side-effect: `gh pr merge --delete-
  branch` may fail to clean up the local branch while the agent
  session is active — harmless, server-side merge still succeeds.

Brief 142's clean scaffolder-side work + brief 143's clean decomper-side work
were the validation that worktree separation (either mechanism) is
sufficient.

## Brain-pattern locked

- **Self-merge by default.** Brain reviews + merges autonomously per
  cntrl_alt_lenny's stated working pattern. User gets the scaffolder /
  decomper messages afterward, doesn't gate each merge.
- **PR-URL deliverable.** Every agent message MUST end with "push the
  branch, run `gh pr create`, reply with the PR URL." Brain verifies
  origin before claiming review-ready; PRs missing from origin → ask
  user to nudge the agent rather than silently waiting.
- **Verify gate is now 3-region SHA1 PASS** (was 24/27 module check
  before brief 140). For tools-only PRs that don't touch the build
  path, EUR-only SHA1 PASS is sufficient evidence.

## Next-brain TODO

**0a. ✅ RESOLVED — the three 2026-08-17 CI/tooling items all shipped.**
`q-cascade-ci-quadratic`, `q-ci-timeout-cache` and `q-toolchain-repin-eval`
are all marked DONE in their queues (verified 2026-09-02). The fourth item
referenced here, `q-readable-c-done-definition`, is not in any queue — its
decision is recorded at item 0 below. **Nothing in this block is
outstanding; it is kept only so the audit trail is not silently dropped.**

**Rejected in the same pass, with reasons — do not re-litigate without new
information.** A `git filter-repo` scrub of the `.wine-lane` blobs in history
is real (the three largest objects in the pack are `.wine-lane` files; 1,822
wine-path blobs; ~150 MB pack) but was **declined**: rewriting every commit hash
invalidates 47 unique commit-sha citations across `docs/`, this file's own
`main-sha` drift anchor, and the standing `git show <sha>` convention in briefs
and kickoffs, and forces a re-clone on both machines. Reclaiming ~74 MB does not
buy that. Preconditions if ever revived: between rounds, both machines synced,
commit-map retained, and docs sha-citations remapped in the same change.
Separately, `wine_link_lock.py` was examined and is **correctly scoped** — per-
worktree WINEPREFIXes already parallelise compile (3.66× at 4 lanes, brief
608/614); only the final link serialises, and wider-than-2-way concurrent
linking was never tested. That test is the next experiment if anyone wants one.

**0. ✅ DECIDED 2026-08-05 (round 0805, see top): adopted the pret-style public
ladder + verdict-complete gate; rejected attainment-as-completion. Original item
kept below for the reasoning trail.** (2026-07-25, q-readable-c-done-definition)
Decide the "readable-C done" definition; ceiling model corrected, not a completion
criterion anymore. r11 found the tractable-C ceiling self-contradicting (48.03%
vs r7-14's 14-24% band); fixed with shown arithmetic (main's headroom
fraction 0.75 -> 0.10, region-wide ceiling 48.03% -> 30.19%) but
explicitly NOT reconciled to the band — see
[`docs/research/q-readable-c-done-definition-2026-07-25.md`](../docs/research/q-readable-c-done-definition-2026-07-25.md)
for why forcing an exact match would be false precision, and for the
larger still-flagged-not-fixed `FINISHABLE_HEADROOM_FRACTION` residual.
That doc gives 3 candidate "readable-C done" definitions (pret-style
public ladder / attainment=100%-of-ceiling / internal verdict-complete
gate) with a recommendation (adopt the ladder + verdict-gate together,
reject attainment as a completion criterion) — **the brain decides**
which to formally adopt. If verdict-complete is chosen, note the
freshness-cutoff nuance in that doc (key it per-lever-family off
`codegen-walls.md`'s own correction history, not one global date).

1. **Brief 234 (decomper)** — C-39 drain wave 6 + C-40 3-pick
   mechanical cleanup. Kicked off this round. (A) Continue
   C-39b-solo drain (122 picks remain after brief 232's 35).
   (B) Ship the 3 remaining brief-219 C-40 picks via brief 233's
   locked recipe (`func_0208df40`, `_0208e1ac`, `_0208e200`).
   Target: 25-35 ships, hard-tier 7.42 % → 7.7-7.9 %.
2. **Brief 235 (scaffolder)** — Three small pilots. Kicked off
   this round. (A) **C-39e sub-classification** on brief 232's
   new `movs r4, r1` null+helper-at-top sub-shape (2 known
   picks `0228b810`, `0228b850`); if ≥2 ship, classify + extend
   detector. (B) **Brief 232's 2 deferred picks**:
   `func_ov002_02295284` (double-call disjunction),
   `func_ov002_0220673c` (cross-call compare with dead-store
   artifact). (C) **Broader-C-40 corpus pilot**: brief 233 noted
   459 broader `0x04001xxx`-pool occurrences beyond the 4 strict
   C-40 picks; pilot 5 picks outside the strict signature.
3. **Brief 236 candidates** (post-234/235):
   - **C-39e drain wave** if brief 235 (A) locks.
   - **Broader-C-40 / C-42 drain wave** if brief 235 (C) locks.
   - **C-39 mega-batch wave** — combine a/b/d/e + base into one
     cross-shape uniform-batch using brief 230 + 232's variant
     tables.
   - **Permuter wave 2** on hard-tier picks — brief 198 left
     this open; brief 218 bitfield insight may help.
   - **`.s` → `.c` upgrade pass on accumulated punts** — brief
     221 + 223 + 224 + 228 + 230 + 232's deferred cohorts;
     ~100+ `.s` ships with non-permanent walls.
4. **Carryover candidates from prior rounds:**
   - **Hard-bucket pilot** (Track 2 long-form decomp). Brief 220
     is the structural prerequisite for this.
   - Brief 213's brief-201 doc correction, C-24 wall extension,
     C-15 `mvn #0` refinement, P-11 reg-alloc-hint research —
     all still available as smaller scaffolder slots.
5. **Scope brain candidates to keep ready:**
   - **C-24 wall** (predicated cascade research from brief 103):
     pending classifier upgrade, same shape as C-23/C-31/C-32/C-33
   - **Brief 197's mis-tagged C-15 prediction caveat** — `mvn #0`
     isn't always mwcc 1.2 routing; refine the C-15 predictor
   - **Decomp.me scratch upload automation** — productivity
     multiplier (brief 201's success makes this higher priority)
   - **P-11 reg-alloc-hint research** — brief 200 left this open
     as a separate brief candidate; sweep mwcc 2.0 SPs +
     optimization levels on E-12 to see if any produce orig form
   - **Brief 201's "two pool loads" correction in C-23 entry** —
     trivial doc edit (mwcc CSE'd already; the recipe still
     works but the explanation in pick #5's `.legacy.c` worked
     example is imprecise)
6. **Deferred indefinitely (per pivot discipline):**
   - `data_020c9694` 14.8 KB D-3 mega
   - `data_ov002_022ccc2e` odd-aligned size=2
   - 34 remaining odd-aligned ov004 data symbols (brief 182
     self-extend pool)
   - USA + JPN cross-region apply of brief 182's claims (+36 B
     cascade exceeds `MAX_SHIFT_BYTES = 4`)
   - Cluster C / D-1 / D-2 cross-region apply at scale (brief
     184 wired the subcommands; never run)
   - Brief 190 Cluster D (predicated saturation chains, 3-4 picks)
     — waits for a C-1 saturation recipe or permuter coverage
   - Brief 188 epilogue orphans (2 picks) — likely linker-emitted
     scaffolding or dead code
   - These items are NOT lost. If a code-decomp brief actively
     blocks on one, file the followup it deserves; otherwise
     leave them.
7. **Pre-existing carryovers (unchanged):**
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings.
   - `match-invariants` not yet a required branch-protection check.
8. **Known infrastructure state:**
   - Agent-inbox hook fix landed in PR #634 but agent sessions
     started BEFORE that PR will continue to silently fail (Claude
     Code reads `.claude/settings.json` once at session start).
     Inbox populates from next FRESH session start onward — brain
     should mention "exit your previous session" explicitly in
     kickoffs until it stops being a problem.
   - CI comment-upsert workflows hardened in PR #641 (shared
     `.github/scripts/upsert-pr-comment.sh`, REST-only, 3-retry,
     fail-soft). `pr-tier-delta` and 5 sibling workflows no longer
     fail on transient API 401s.
   - `objdiff_filter_panic_units.py` fixed to handle `.legacy.c`
     paths properly (this brain-PR). dsd emits `.o` paths; mwcc
     produces `.legacy.o` / `.legacy_sp3.o`. Filter now rewrites
     via `source_path` as the authoritative routing signal.
     **+198 matched_functions previously invisible** were the
     immediate recovery; the fix permanently closes the gap for
     all future `.legacy.c` ships.
   - **Worktree-pointer breakage from parent-dir rename** (fixed
     this brain-PR via `git worktree repair`): the parent dir was
     renamed `gx-spirit-caller-NEW` → `gx-spirit-caller` at some
     point; `decomper/.git` + `scaffolder/.git` (and the
     corresponding `brain/.git/worktrees/<slug>/gitdir`
     back-pointers) kept the stale `-NEW` paths. Symptom: agent
     worktrees can't run git commands. Fix is non-destructive —
     `git worktree repair <path>...` from the main worktree
     rewrites all four pointer files. Future brains starting on
     a renamed-parent setup should `git worktree list` and check
     for `prunable` markers before assuming agent worktrees work.
   - **Brief 212 `TestStragglerSmoke` becomes idempotent-no-op
     post-merge.** The two tests (`test_021cb574_collapses_one_trailing_a`
     + `test_021d02a4_collapses_four_trailing_a`) load `.o.resolved`
     files from a sibling decomper build and expect the rewriter to
     collapse 1 / 4 trailing `$a` markers. Pre-#668 they passed; post-
     #668 they FAIL because decomper's post-merge rebuild ran the
     rewriter in production, so the on-disk `.o.resolved` files are
     already collapsed (`trailing_promoted_collapsed: 0` on re-run).
     Not a regression — test design depends on pre-rewriter build
     state that no longer exists in normal workflows. Fix candidate
     for whichever scaffolder brief touches `patch_arm_mapping_symbols.py`
     next: either (a) check for already-collapsed shape and skip,
     (b) read pre-resolve `.o` files instead of `.o.resolved`, or
     (c) check in a fixture rather than depending on a build
     artifact.
   - `tools/permute.py` macOS workarounds folded in (PR #655):
     PEP 668 externally-managed-environment fallback auto-creates
     `.venv_permuter/` and patches `sys.path` in-process; disasm
     path resolver scans the tree-mirroring layout (`disasm/src/
     <path>/func_<addr>.s`) when the flat layout is absent.
     Brief 198's symlink workarounds no longer needed.

## Cross-machine handoff notes

User alternates brain between Windows PC and Mac. The role is tied to
the local machine (toolchain + baserom on disk), not to a specific
Claude session. State.md is the bridge. Standing conventions:

- **Working pattern:** brain reviews + merges autonomously; user
  receives the scaffolder / decomper messages afterward.
- **Verify command (Windows):** `python tools/configure.py eur &&
  ninja sha1 && python tools/configure.py usa && ninja sha1 && python
  tools/configure.py jpn && ninja sha1`. **On Mac substitute `python3.13`**
  (macOS ships no plain `python`; `/usr/bin/python3` is Apple's 3.9.6
  which lacks `match` statements — `tools/configure.py` requires 3.11+
  per CLAUDE.md). POSIX paths and `./dsd` instead of `dsd.exe`.
- **Memory per-machine:** Each side's `~/.claude/projects/...` memory
  doesn't follow. State.md is the bridge.
- **Worktrees:** see *Worktree convention* above; 3-worktree split is
  now standard.

## New agents?

No. Continuing with 4-slot setup (brain + decomper + scaffolder +
auto-progress-badge bot).

