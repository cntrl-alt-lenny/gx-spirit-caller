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

**Last updated:** 2026-09-02 — **(Windows PC, brain=Opus 5; both lanes Claude
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

<!-- main-sha: 676fed454 -->
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

## In flight (post this brain-PR)

**Active PRs: 0** once `brain/integ-0824b` lands. **#1020** (decomp.dev CI)
remains the one genuinely parked draft and is declared in the `parked-prs`
anchor above. **#1534 is CLOSED**, superseded by #1542's rescope.

**All four queues re-seeded.** Dispatch host: the Windows PC (recorded in
[`docs/dispatch-log.md`](dispatch-log.md), row 0824). Every seeded item was
verified to resolve via `work_queue.py next` on the integration tree.

⚠️ **The Codex Scaffolder's next kickoff must NOT open with `git reset --hard`.**
Its `q-make-kickoff-generator` work is written, gate-passing and **uncommitted**
in `kb-types` (199 lines of `tools/make_kickoff.py` + 60 of tests). It paused
before committing because the item's own spec forbade building against an
unmerged interface — correct behaviour that the standard preflight would then
have destroyed. Brain holds a backup; the kickoff commits it as step one.

| Lane | Next item | Why |
|---|---|---|
| CC Decomper | `cm-main-band-followthrough` | The re-run answered: 0/20 at matched effort. Its Outcome-B branch fires — record the closure in the catalog, then the bounded 257-512 B pilot with the <15% kill criterion stated in advance. |
| CC Scaffolder | `cm-restock-carve-12` (rewritten) | Wave 11 sized the lever precisely: 576 windows / 3,069 symbols / 66,096 B are geometrically composable but blocked behind a per-group `.o` inspection nobody will do 576 times by hand. Build the verifier, drain what passes. |
| Codex Decomper | `q-ledger-chronology`, then `q-remaining-opportunity-census` | The first fixes a false-positive class in its own just-merged audit. The second writes down what is actually left now that the small-code frontier has closed. |
| Codex Scaffolder | `q-make-kickoff-generator` | Commit the paused work first, then finish it against the now-merged #1542 interface. Three more items behind it. |

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

## Code-decomp resumption (post-pivot active work)

**Canonical metric** (changed 2026-05-23 evening per brief 203
investigation): `complete_units` from `build/eur/report.json`.
Brief 199 / 202 / 203 investigation found that
`matched_code_percent` + `matched_functions` systematically
under-count `.legacy.c` + `.s` ships because objdiff requires
unrelocated-`.o` byte-identity, while our ship paths have
different reloc records than dsd's delink (post-link bytes match
— SHA1 PASS verifies). `complete_units` IS the SHA1-aligned
indicator. Full diagnosis:
[`docs/research/objdiff-fuzzy-vs-complete-metric.md`](../docs/research/objdiff-fuzzy-vs-complete-metric.md).

**Current (post #671 + #672 merge):**

| Metric | Value | Notes |
|---|---|---|
| **complete_units** | **1,749 / 2,660** | SHA1-aligned headline. 65.75 %. +46 over post-#668/#669 (1,703 baseline at last round). |
| matched_code_percent | **5.0263 %** | +0.046 pp this round — mostly `.s` ships which are headline-light but complete-units-heavy. |
| matched_functions | **1,786 / 9,801** (18.22 %) | +46 over post-#668/#669 baseline of 1,740. The brief 210 `$d → $a` chain credits `.s` ships cleanly now. |
| fuzzy_match_percent | **5.7246 %** | +0.047 pp this round |
| complete_code_percent | (per-unit) | for individual ships, 100 % means byte-identical at the linker level |
| **easy-tier matched ratio** | **92.9 %** | up from 88.7 %. 79 unmatched easy-tier picks remain, of which 39 are Wall-2-blocked (leaf-no-pool reg-alloc divergence). |

**Resumption queue:** [docs/research/code-decomp-resumption-queue.md](../docs/research/code-decomp-resumption-queue.md)
— 52 picks across trivial (12) / easy (25) / medium-easy (15).
Brief 188 is grinding the trivial bucket; brief 190+ picks up
easy + medium-easy once brief 189's wall pre-emption lands.

**Resumption playbook:** [docs/decomp-workflow.md](../docs/decomp-workflow.md)
§ "Code-decomp resumption — the post-scaffold playbook" (NEW in
brief 187). Routing decision tree, scratch flow, permuter staging,
3-region SHA1 PASS as headline gate.

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

**0a. SEEDED-NOT-DISPATCHED (Mac brain, 2026-08-17) — three CI/tooling items
from an external read-only audit.** They sit **second** in their lanes' queues,
behind round 0817's four items, so `work_queue.py next` is unaffected until
those clear. Every premise was verified live on `main` twice (`b1015c872` and
`fcb39a4c2`); re-verify before dispatch anyway.

- `q-cascade-ci-quadratic` (codex-decomper) — `find_mega_cascades.py`,
  `find_cascades.py` and `propagate_template.py` rebuild per-target what they
  should index once; ~78 s of CI wall per triggering PR, and all three tools run
  in PR CI on essentially every conversion PR. Brain re-measured
  `find_cascades.py` at 10.36 s for a zero-result run.
- `q-ci-timeout-cache` (codex-scaffolder) — 12 of 12 workflows lack
  `timeout-minutes`; `compile-check.yml` re-downloads the ~87 MB toolchain on
  every run of a 3-region matrix.
- `q-toolchain-repin-eval` (claude-scaffolder) — `dsd` / `m2c` / permuter pins
  have drifted 2-4 months. **Evaluation only, adoption is a separate item.**
  Carries a layer correction: upstream m2c cannot subsume our `.legacy` /
  `.legacy_sp3` routing (compile-tier vs draft-generation).

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

