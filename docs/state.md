# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-06-10 (Mac), post briefs **401 + 402** merge.
**This round (2 PRs + brain #932):** **#931** decomper fresh-overlay scout
(**0 matched by design** — verdict: **no fresh easy clean-C overlay
remains**; census fixes: count carves by `.text start:` ADDRESS not name
regex → ov006 = 182 carved not 242; ov017 WAS tracked at brief 332; the
ov017 calibration 4/4 = 1-2-instr reg-alloc/const-materialisation
near-misses); **#930** scaffolder ov002 `.s` upper-half wave 16 (8 ships,
all 0x58, enumeration widened to `≤0x6c`, scaffolder `.s` total 128).
Doc: `docs/research/brief-401-fresh-overlay-scout.md`.

**Current metrics (EUR — reconfigured at `1f4e8f5` via `configure.py eur`,
`ninja objdiff`+`report` regenerated this session, clean tree):**
**`complete_units 3605 / 5207 (69.23 %)`** (+8 = the 8 `.s`; scout shipped
0). `matched_functions 3642 / 9766`. **Code-byte tier 11.57 %**
(`complete_code`). **3-region `ninja sha1` PASS (eur / usa / jpn)**
reproduced this session on the merged main — both PRs byte-correct.
(Reminder: **~69 % *units*, ~11.6 % by *code bytes*; SHA1 is the
ship-count truth, not `complete_units`** — the report under-counts
`.thumb.c` carves.)

**Overlay census (brief-401-corrected — count carves by ADDRESS):** ov002
~2556 uncarved (scaffolder), main 2677 (legacy/region-complex, parked).
Per-overlay residue is now **reg-alloc-finicky near-misses + detailed
builders + jump-table/switch-tree walls everywhere** — no fresh easy
clean-C tier anywhere (the brief-401 verdict that sets the 403 routing
direction).

**Prior (Windows session 2, briefs 366–392): ~24 PRs (#892–#915), THE
PIVOT = the `.s` ENDGAME** (permuter proved niche; clean-C tapped) — both
agents `.s`-converting reg-alloc walls at scale; Mac reconciled (#916/#917).

🔻 **Permuter: 383-vs-401 tension → brief 403 settles it with a number.**
Brief 383: 0-for-the-*catalogued* tiers (labels stale/mislabeled) — niche
verdict. Brief 401 re-pick: feed it *freshly-harvested* 1-2-instr misses.
Synthesis now queued (403): the permuter gets ONLY freshly-re-verified
single-transform diffs (commutative-operand / peephole-split /
const-materialisation — the 363 crack classes); reg-mirror, reg-pressure,
CSE-of-base, scheduling-interleave route straight to `.s`. **m2c stays
vendored** (clean-C accelerator). **Volume = `.s`; permuter hit-rate on
fresh single-transform targets is 403's headline deliverable.**

🪓 **The `.s` endgame (the volume lane).** main + ov002 reg-alloc walls are
**proven non-C-recoverable** → bank them as whole-function `.s` toward
100 % byte-completion. Decomper drained the overlay backlog (thinned) then
joined ov002 lower-half; scaffolder did main + ov002 upper-half (8/wave).
ov002 `.s` runway is long (~260 lower + ~71 upper small-band uncarved).
Collision (both on `ov002/delinks.txt`) managed via `tools/sort_delinks.py`.

🔁 **Where we are (lanes — collision-free by module).**
**decomper → brief 403** = **diagnose-and-ROUTE wave 1 on the ARM overlay
residue** (re-verify each diff against a FRESH `.o`; permuter ONLY for
single-transform misses, time-boxed; `.s` via `asm_escape` for the rest;
seeds across ov017/ov016/ov008/ov005/ov000; target ~10-16 ships + the
hit-rate number; stay OFF ov002/`main`). **scaffolder → brief 404** =
**ov002 `.s` upper-half wave 17** (SOLE owner of the ov002 delinks;
`≤0x6c` band, ~72 clean → ~9 waves runway, parked set 10; `kind:data`
drop rate 18→23→26→28 % — report step-up-vs-pivot if runway <~2 waves).
Both queued; decomper-multi-overlay-residue / scaffolder-ov002 stays
collision-free (different delinks files).

🗂️ **Settled / reference:** walls P-11, P-15, switch-case-body-layout
(brief 305). ov004 `dsd check symbols` noise = benign label-drift, leave it
(#818 diagnosis, `docs/research/ov004-check-symbols-diagnosis.md`); the
project gate is `ninja sha1` + `dsd check modules`. ntrtwl branch parked
(land/drop on request).

🛰️ **Ecosystem scout (brain swarm) + two spawned follow-up sessions.**
Verified wins for when cold-RE starts: (1) **m2c arm-mwcc-c** — a real
ARM decompiler that knows mwcc, the genuine Track-2 accelerator (pilot
free via decomp.me Decompile button); (2) **dsd-ghidra** (Ghidra primed
with our symbols) + **dsd `sig`** (auto-ID lib funcs) — both unused;
(3) **TWEWY** (CC0, our exact 2.0/sp1p5) = the one net-new SDK port pool.
We're the most tooling-advanced project in the ecosystem (codegen-walls.md
leads). ⚠️ **Two spawned Claude Code sessions** (origin 1dfcadb5…) acted
on the ntrtwl finding and left it uncommitted on main; brain preserved +
verified it on branch `brain/ntrtwl-vendor-pool-review` (49 tests pass,
ruff clean). Finding: the ntrtwl wireless pool is ~99 % already-complete
(33 net-new, 5 exclusive) — NOT a goldmine; see `reference_ntrtwl_pool`
memory + `ntrtwl-nitrosdk-feasibility.md`. Branch awaits a land/hold call.

🤖 **Workflow hardening (Opus 4.8 review, PRs #728 + #730 + #731).** The
verify gate is now paste-the-output: paste-or-FAIL SHA1 tails, captured
state block, metric provenance, authorization-source for destructive
ops, end-of-round checklist; + falsification-for-permanence claims,
test-must-red-on-bad-input, Success = artifact, neutral what-didn't-land,
untrusted-content rule. Posture: 4.8's diligence gains are short-context;
the brain runs in the long regime the evals don't cover → integrity =
captured artifacts, not narrative. Both agents already show these
unprompted (brief 253's evidence-backed non-shippers). See AGENTS.md
§ Verify gate and round discipline.

🧭 **Next round queued (254 + 255):** above. Brief 256's direction
depends on 254(A)'s Track-2 ship-or-over-fire verdict.

🎯 **Brief 246 — both brief 245 escapes resolved via existing
gotcha 7.** No new gotcha needed. Key methodology lesson surfaced:
**count the orig's desired temp register FIRST, then gotcha 7
mechanically picks the right arg count**. Important correction:
brief 245 misdiagnosed `02087528` as an objdiff scoring quirk —
it was actually real reg-alloc divergence (bytes really didn't
match). objdiff was correct. The new diagnostic discipline
prevents this misdiagnosis going forward. Cluster scout repeated:
no new >100-pick clusters after C-42 drain. Top-5 unchanged from
brief 241 (55/45/40/26/20 picks). C-42 itself dropped from 851 to
539 unmatched picks across waves 1-4 — the drain is coming out of
C-42's own population, not adjacent clusters. Brief 246 also
proposed an additive symptom→gotcha lookup table for
recipe-gotchas.md (deferred to brain decision, not landed).

⚠️ **Brief 247 — 19 .c at 73% C-yield, surfaced 4 NEW escape
patterns.** Halted at first repeat escape per brief discipline.
**Important new lesson surfaced: yield correlates with sub-shape
homogeneity, not recipe-library maturity.** Wave 4's 94% yield
came from sibling families (tag6+sp3 same-recipe 25 times). Wave
5's 73% yield came from main-heavy thunks where each pick had a
unique shape. The yield drop isn't a recipe-library regression —
it's that the remaining cohort is shape-diverse. **For brief 249+:
hunt sibling families and exhaust them, not random picks from the
cohort.** 4 new escape patterns filed for brief 248:
- **N1** sub-shape 2 with trailing void helper (gotcha 8 doesn't
  apply when there's a `bl` after the field write)
- **N2** predication collapse (`if (X) return 0` collapses to
  `moveq+popeq` even with braces — overrides gotcha 5)
- **N3** nested struct ptr-alias (mwcc inlines `&self->inner` to
  a single offset; orig pre-computes the alias in a callee-save reg)
- **N4** 2-helper if-else r3 vs r1 reg-alloc (orig picks r3 for
  pool temp; ours picks r1; no obvious source-side lever)

**C-42 cohort drain progress** (now 5 waves):
brief 238 (30) + brief 240 (8) + brief 241 deferred (8) + brief
243 (22) + brief 245 (33) + brief 247 (19) = **127 picks** of
~860 original C-42 cohort. Remaining ~535-540 picks. With brief
247's lesson now folded in, brief 249+ should pursue
sibling-family hunting for sustained 85-94% yield rather than the
73% baseline.

**The "scaffolder unblocks, decomper surfaces" cadence is now
fully validated across 4 iterations.** Brief 246 resolved 2/2
escapes (100% lock rate sustained: 9 of 9 patterns across briefs
242/244/246). Methodology + catalog converge fast on any new
escape — the catalog is mature enough that escapes increasingly
turn out to be misapplications of existing gotchas rather than
genuinely new patterns.

🎯 **Brief 244 — 5/5 reg-alloc patterns LOCKED, no P-14
again.** Brief 243's 5 new sub-patterns (6-10) all yielded to
brief 242's methodology. Pattern 6 (pointer-double-store) → gotcha
8 family (return helper_ret keeps r0 live). Pattern 7 (switch-on-
ldrh) + Pattern 10 (indexed-ldr) → gotcha 7 direct (2-arg / 3-arg
pass-through). Pattern 8 (stmia fusion miss) → gotcha 10
(`.legacy_sp3.c` — was a tier misclassification, not reg-alloc).
Pattern 9 (loop counter / index) → **NEW gotcha 11**
(declaration order — declare loop var FIRST). 7 worked examples
shipped. recipe-gotchas.md now 11 gotchas + 6-step diagnostic
order. **The "reg-alloc divergence" framing is now a settled
solved class — methodology + catalog converge fast on any new
escape pattern in this family.**

🎯 **Brief 245 — 33 .c at 94% C-yield, the highest yield of any
C-42 wave so far.** Decomper drained 33 of 35 attempted (12 main
+ 21 ov002), shattering brief 243's empirical 70-75% expectation.
The expanded recipe library (gotchas 1-11 + 4-step diagnostic) is
now mature enough that high-yield mechanical drain dominates over
escape-pattern discovery. Sub-shape coverage: tag6 bitfield
single-helper (10), tag6 bitfield if-else 2-helper (7), pool +
global check (3), pool-deref 2-fields + helper (3), sp3-routing
ptr-null + helper (4), sp3-routing other (6). Only **2 escapes**
filed for brief 246: `02087528` (objdiff fuzzy 66% despite
matching bytes — relocation scoring issue), `02259f74` (`movhi`
unsigned-compare variant of sub-shape 2 — gotcha 7 doesn't
generalise to this variant).

**C-42 cohort drain progress.** Total drained across waves 1-4:
brief 238 (30) + brief 240 (8) + brief 241 deferred (8) + brief
243 (22) + brief 245 (33) = **101 picks** of ~860 original C-42
cohort. Remaining ~445 picks (more after brief 244 expanded
detector coverage, but approximate scale stable). At 94 % yield
this wave, cohort exhaustion expected around wave 7-8 if
trajectory holds — possibly faster as the gotcha library matures.

**Methodology pattern fully validated — "scaffolder unblocks,
decomper surfaces."** Briefs 240→241→242→243→244→245 are 3
complete iterations of this cadence. Average per iteration: +30
ships, +1-3 new gotchas, +5 sub-shapes documented. Each
scaffolder round has locked 100 % of the escape patterns
surfaced by the prior decomper round (no P-14 needed in either
242 or 244). **Confidence is high that this cadence will fully
drain C-42 in 3-5 more iterations.**

🎯 **Brief 242 — 4/4 reg-alloc sub-shapes LOCKED, no P-14.**
Brief 240's halt-trigger was an incomplete diagnosis — all 4
documented sub-shapes ship under natural recipes with the right
gotcha combination. Sub-shape 1 (tag6 bitfield, 5+ picks) reaches
via gotcha 7 (arg-count) direct. Sub-shape 2 (pool + 2 global
writes) reaches via **NEW gotcha 8** (return LIT reuses last
`mov r0, #LIT`, forcing pool to r1). Sub-shape 3 (ptr-copy +
helper + LIT-write) reaches via **NEW gotcha 9** (helper takes
both args + int return → r2 temp + r1 LIT). Sub-shape 4 (stmfd +
sub sp #4, 6+ picks) is NOT reg-alloc at all — it's a routing
tier mismatch, fixed by **NEW gotcha 10** (use `*.legacy_sp3.c`).
8 worked examples shipped (2 main `.legacy_sp3.c`, 6 ov002 `.c`).
recipe-gotchas.md extended by 3 gotchas + 3 checklist items +
4-step diagnostic order. **~500 C-42 picks across these
sub-shapes now unblocked for mechanical drain.**

⚠️ **Brief 243 — 22 ships at 71% C-yield, halted on 5 NEW
reg-alloc sub-patterns.** Decomper drained 22 of 31 attempted
C-42 picks (5 main + 17 ov002), expanding the recipe library by
5 more documented sub-shapes (17-20 + single-helper conditional
thunks). Hard-tier 8.62% → 8.88%. C-yield 71% (below 85%
target) — halted per brief stop-rule after 9 escapes surfaced 5
**new** reg-alloc sub-patterns beyond brief 240's set: (6)
pointer-double-store reg choice (2 picks), (7) switch-on-ldrh
reg choice (1), (8) stmia fusion miss (1), (9) loop counter/index
reg-alloc (4), (10) indexed-ldr reg choice (1). 3 source-side
controls tried (explicit local var decls, struct vs ptr types,
declaration-order swaps) — none deterministically shift mwcc's
allocator. Filed for brief 244 scaffolder.

**Empirical cohort sizing finding (brief 243).** Brief 240's
"safe profile" (2+ args + no bitfield) is smaller than estimated:
~250 main+ov002 metric-safe candidates → only 22 ship first-
attempt (71% yield). Remaining ~150 hit one of the 5 new
sub-patterns. **Wave 4+ should expect 70-75% yield without
source-side controls** — until brief 244 cracks more reg-alloc
patterns, the natural yield is bounded around 70-75%.

**Methodology pattern emerging — "scaffolder unblocks, decomper
surfaces."** Briefs 240/241/242/243 are the second iteration of
a clear pattern: decomper drains until repeat reg-alloc escapes
trigger a halt, scaffolder runs a focused variant matrix against
the documented escape shapes and locks recipes, decomper drains
the unblocked picks and surfaces the next batch of escapes. Each
iteration nets +20-30 ships and +1-4 new gotchas. Likely the
dominant cadence for the next 5-10 rounds while the C-42 cluster
drains.

**Two open lanes after this merge.** **Brief 248 (scaffolder)**
— investigate brief 247's 4 NEW escape patterns N1-N4 (sub-shape
2 with trailing void helper, predication collapse, nested
struct ptr-alias, 2-helper r3 vs r1). Apply the now-proven
catalog-+-variant-matrix methodology (4th iteration). Plus
decision on brief 246's proposed symptom→gotcha lookup table.
Plus opportunity to extend the recipe-gotchas catalogue
narrative with brief 247's "sub-shape homogeneity drives yield"
lesson — this is a strategic methodology insight that future
briefs will reference. **Brief 249 (decomper)** — C-42 drain
wave 6, sibling-family-first strategy. Apply brief 247's
empirical lesson: hunt sibling families and exhaust each before
moving on. Sub-shape families to enumerate first (per brief
247's high-yield wave 4 pattern): tag6 bitfield siblings,
sp3-routing thunks (`.legacy_sp3.c`), pool + global check
clusters, pool-deref 2-fields + helper. Use brief 239's
sub-shape histogram to enumerate cohort sizes per family.
Target 25-40 ships at 85-94% C-yield (sustained brief 245
trajectory). Avoid brief 247's 4 escape patterns until brief
248 lands their recipes. Both kickoffs sent.

**Brain methodology insight (this round, NOT yet in
docs/research/) — "sub-shape homogeneity drives yield".** Brief
247 surfaced an empirical pattern: a 33-ship wave with 25 from
same-recipe siblings yields 94%; a 26-ship wave with each pick
shape-diverse yields 73%. The recipe library isn't the
bottleneck at wave 5+ — the **selection strategy** is. Future
decomper briefs should explicitly favour sibling-family drains
over random picks from the cohort. Worth documenting in
codegen-walls.md or recipe-gotchas.md as a brief-249 deliverable
or brief-248 (C) write-up.

---

## Previous round — briefs 240 + 241 (post-#712 + #713)

---

## Previous round — briefs 240 + 241 (post-#712 + #713)

⚠️ **Brief 240 partial — reg-alloc divergence escape surfaced.**
Decomper hit a recurring escape: mwcc 2.0/sp1p5 picks `r1` for
free-scratch where orig used `r2` (or vice versa). Same
instructions, control flow, opcodes — only register choice
differs. 4 source-form variations tried (extra unused arg,
struct layouts, extern forms, return type) did not shift mwcc's
choice. Affects ~5 sub-shapes across the ~500 remaining C-42
picks: (1) tag6 bitfield extract (5+ picks), (2) pool-data +
global field write, (3) helper-returns-ptr + field write,
(4) `stmfd; sub sp, #4` prologue thunks (6+ picks), (5)
`*p = *q; helper(p); *p = LIT`. Decomper halted at 8/15 (53%
C-yield) per brief guidance — exactly the right move. 8 ships
landed in `src/main`, all sharing the empirical
ships-without-walls profile: 2+ explicit args, no bitfield
extract.

🎯 **Brief 241 (A) locked brief 238's 7 deferred picks.** All
ship byte-identical under natural recipes — NOT a new wall class.
Folded as 5 new C-42 sub-shapes (struct-large-offset, clamp,
sp3-dup-helper, helper3-u64-return, cmp-dispatch-switch). C-42
family taxonomy now 16 sub-shapes documented (brief 237's 5 +
brief 238's 6 + brief 241's 5). **New recipe gotcha 7
(arg-count tunes the temp register)** added to recipe-gotchas.md
— directly applicable to brief 240's escape pattern, queued for
brief 242 systematic investigation.

🎯 **Brief 241 (C) calcrom canon corrected.** Brief 239 (D)
empirically falsified brain's interpretation: the
`matched_functions > complete_units` delta is a natural multi-fn-
per-TU counting artifact, NOT a missing-marker indicator.
Calcrom output now annotates this inline; `reference_metric_canon.md`
updated. Brain methodology lesson reconfirmed: don't ship plans
based on metric-artifact misreads.

🎯 **Brief 241 (B) next-cluster scout.** Post-C-42-drain
unclassified residue is 1204 picks. Top 5 clusters histogrammed
with sample picks — no cluster crosses the 100-pick pilot
threshold, meaning the next wall isn't a single big cohort.
Deferred to brief 244+ if needed.

**Brain methodology re-confirmed (brief 240 round):** when a
sub-shape produces repeat escapes within a single decomper
session, halt and surface to scaffolder rather than grind. Brief
240's halt at 53% C-yield cost ~32 missed ships but unlocked the
path to ~500 in subsequent rounds — and brief 242 then locked all
4 escape sub-shapes the next round, validating the bet.

---

## Previous round — briefs 238 + 239 (post-#709 + #710)

**Brief 238 (C-42 first drain wave, decomper) and brief 239
(C-39e generalises + C-42 audit + recipe gotchas + calcrom
verdict, scaffolder) both shipped.**

🎯 **C-42 drain underway — 30 ships first wave, taxonomy
expanding.** Brief 238 cashed in brief 237's C-42 classification:
30 .c shipped, hard-tier 8.16% → 8.52%. **Strategic drain hit:
14 main + 16 ov002** per calcrom debt-reduction guidance.
C-yield was 81% (not 95% target) — 7 escapes were struct-layout
/ pool-deref edge cases (mwcc's `add r4, r0, #N; ldr [r4, #M]`
split for large field offsets). **6 NEW C-42 sub-shapes
surfaced** beyond brief 237's 5 (sub-shapes 6-11): chain
`helper2(self, helper1_ret)`, 2-helper preserving (self, arg1),
arg-insert thunk with literal, store + cond-skip + helper,
save/clear/helper/restore, pool-deref + helper. C-42 family
taxonomy now 11 sub-shapes documented.

🎯 **Brief 239 quad-deliverable, mixed but all valuable.**
(A) Brief 236's 2 deferred C-39e picks both LOCK under natural
recipes — C-39e recipe generalises to complex bodies (NOT a new
sub-shape). New gotcha surfaced: `&&` short-circuit merges
duplicate-call paths. (B) C-42 detector audit: 97.3% TP rate
(2.7% FP, below threshold). Tightened to exclude
`sub sp, sp, #N>16` large-stack-frame buffer-pass thunks. 9-way sub-shape
histogram added for decomper pre-tagging (A3 single-bl-plain
189 picks dominant, B5 two-bl-plain 92, C three-or-more-bl 91).
(C) Recipe-gotchas reference doc shipped at
`docs/research/recipe-gotchas.md` — 6 patterns catalogued
(return-r-vs-return-0, array-vs-scalar extern, ternary polarity,
XOR operand ordering, if-then vs early-return for bmi, mask <
0xff triggers C-1 predication) + pre-flight checklist.
**(D) NEGATIVE RESULT — brain's calcrom interpretation corrected.**
The "matched_functions > complete_units" delta is NOT a "missing
complete markers" indicator — it's the natural state for
multi-fn-per-TU TUs. All 9 "affected" overlays already have 100%
complete delinks. Mf − cu delta = avg fns-per-TU × num multi-fn
TUs. **Brain methodology lesson:** do not treat the mf > cu
delta as actionable bookkeeping; it's a counting artifact.

🎯 **C-42 NEW WALL CLASSIFIED — multi-call thunk hint.** Brief 237
piloted 5 picks from the dominant unclassified hard-tier cluster
(861 picks, 50% of unclassified). **5/5 shipped byte-identical on
first attempt** under natural source — these picks aren't a wall,
they're shape-unrecognised. C-42 is therefore a hint (mechanical
drain unlock), not a recipe. **~600-800 picks accessible from the
C-42 cluster expected to ship first-attempt** in subsequent
mechanical drains — roughly 100-130 hours of decomper work
available. This is the biggest single-round unlock since C-39
family was classified.

🎯 **Hard-tier landscape resurveyed (brief 237).** Unclassified
slice dropped 27.9% → 22.4% (-484 picks) thanks to retroactive
C-39 family classification. New histogram: C-39 base 1279, C-39d
562, C-39b 304, C-39a 40, C-39e 25 — total ~2210 picks now
correctly tagged. Unclassified residue 1725 (22.4%) — multi-call
thunk shape dominates, plus heterogeneous one-offs.

Brief 236 shipped 31 .c (28 C-39b mixed cohort + 3 C-39e cohort
drain). Hard-tier ~7.79% → ~8.16%. 2 picks deferred
(`021e27c0`, `02206608` — C-39e prologue but divergent body,
flagged for brief 239 sub-pattern review). Methodology lesson
reconfirmed: multi-bitfield interleaved scheduling ships under
natural source (brief 224's old hypothesis was wrong); 5-arg
helpers with stack-spill ship via natural C signature.

🎯 **C-41 NEW WALL LOCKED — MMIO bit-clear + tail-call.** Brief
235's broader-0x04001xxx pilot found 4 sibling picks
(`func_0208cc18` / `_0208cc40` / `_0208ce48` / `_0208ce70`)
sharing the same 7-instruction shape: read DISPCNT, `bic` one
bit, write back, tail-call helper(data). All 4 ship from a
single natural recipe — `MMIO &= ~MASK; return helper(data);` —
under default mwcc 2.0/sp1p5. C-41 detector + 2 unit tests
added. The remaining ~455 broader-0x04001xxx picks are
heterogeneous one-off shapes; no further bulk-recipe scaffolder
work expected there — per-pick decomper territory.

🎯 **C-39e LOCKED — null+helper-at-top sub-shape.** Brief 232's
2 known picks (`0228b810`, `0228b850`) + 1 simpler variant
(`0228b894`) all ship 3/3 from a natural recipe:
`if (arg1 == 0) return 0; if (helper1(...) == 0) return 0;
return helper2(self, arg1);` mwcc emits `movs r4, r1` as a
peephole-fused mov+cmp when arg1 is both spilled to callee-saved
AND tested for null at function top. Detector + 2 unit tests
added. Brief 235 scan found 6 additional candidates in ov002 —
cohort estimated 10-20 picks total, feeds brief 236 drain.

**Brief 232's 2 deferred picks both recovered** in brief 235
with natural recipes (`func_ov002_02295284` double-call
disjunction + `func_ov002_0220673c` cross-call compare with
dead-store) — confirms brief 232's "bookkeeping noise from
per-pick effort cap, not recipe failure" framing.

**Brief 234 shipped 31 .c files** (C-39 wave 6 + 3-pick C-40
mechanical cleanup using brief 233's locked recipe). Brief 235
also shipped the 3 C-40 picks as bonus during its broader-corpus
pilot, which produced add/add rebase conflicts (resolved in
favour of brief 234's already-merged bytes — both versions byte-
identical, just attribution).

Brief 224 (decomper) ran C-39 drain wave 1. **25 ships, hard-tier
5.6 % → 6.0 %.** Routing: 24 `.s` + 1 `.c` upgrade
(`func_ov002_021f4a00.c`). The 1-of-25 `.c` rate is below the
brief's 10-18 target but consistent with brief 223's hard-tier
reality. **Identified 4 second-order C-39 shape variations** that
block volume `.c` upgrades at hard tier: (1) sign-check vs
comparison (`movs; bmi` vs `cmp; blt`), (2) bitfield packing into
helper args, (3) helper-return reuse (callee-saved storage), (4)
multi-call sequences (re-read explicitly). Each needs 20-40 min
per pick — above brief 224's 10-15 min cap. Brief 226 takes 2 of
these (sign-check + helper-return reuse) as sub-classification
pilots. Research note:
[`brief-224-c39-wave1.md`](docs/research/brief-224-c39-wave1.md).

Brief 225 (scaffolder) ran the C-39 sub-patterns + brief 216
deferred investigation. **1 ship + 4 documented near-misses**
(with full 5-tier × 5-10 idiom falsification matrices).
**Shipped:** `func_0207d304.legacy.c` (20 B) — orig has a chained
`(u16)(u8)*p` cast where the trailing `lsl/lsr #16` after the
`and #0xff` is semantically redundant. mwcc 2.0 peepholes the
pair away; mwcc 1.2/sp2p3 (legacy tier) preserves both casts
literally. Extends **C-38 family** with new "redundant-cast"
sub-shape — route-tier wall, not source-form wall. **4
near-misses documented:** scheduling-divergent DCE (A1), 396 B
switch-table (A2 — beyond pilot scope), DCE of unused load (B2 —
all 5 tiers + volatile + inline-asm), u64 pack/value-in-regs (B3
— likely hand-`.s` or RealView convention). Brief 227+ decomper
candidate: corpus-scan for `and #0xff; lsl #16; lsr #16` tail
to find more C-38 chained-cast picks. Research note:
[`brief-225-c39-subpatterns-and-c38-deferred.md`](docs/research/brief-225-c39-subpatterns-and-c38-deferred.md).

**Current metrics (post-#709 + #710 merge, EUR):**
`matched_functions 2166 / 9801 (22.10 %)` — **+32 functions**
(30 brief 238 + 2 brief 239 — exact reconcile),
`matched_code_percent 5.8882 %`, `complete_code_percent 6.5918 %`,
`complete_units 2129 / 3263 (65.25 %)` — **+32 units**. 3-region
SHA1 PASS preserved.

**Tier breakdown (post-#709/#710):** trivial 100 %, easy 100 %,
sinit 100 %, named 100 %, medium 100 %, **hard 8.52 %** (brief
238's reported delta; +0.36 pp).

**Wall taxonomy after this merge.** Active C-class: C-1 through
C-42 (42 named recipes). **C-42 family expanded to 11 sub-shapes**
(brief 237's 5 + brief 238's 6 new). C-39 family unchanged:
base + a + b + d + e (5 active) + c → P-13. Permanent walls:
P-1 through P-13. **Detector tightened in brief 239:** C-42 now
excludes `sub sp, sp, #N>16` (97.3 % TP rate, 2.7 % FP).

**Two open lanes after this merge.** **Brief 240 (decomper)** —
C-42 second drain wave with the audit-refined detector + brief
239's 9-way sub-shape histogram. Target: 40-60 ships, hard-tier
8.52 % → 9.0-9.4 %. **Brief 241 (scaffolder)** — (A) investigate
brief 238's 7 deferred picks (struct-layout / pool-deref edge
cases — `add rN, r0, #N; ldr [rN, #M]` split pattern for large
field offsets); (B) survey what comes after C-42 drain in the
unclassified hard-tier residue (1725 picks − ~554 C-42 unmatched
left after wave 2 ≈ 1170 residue picks for next-cluster scout);
(C) reconcile calcrom.py interpretation in tooling docs +
README — the mf > cu finding from brief 239 (D) updates the
metric canon understanding.

**Brain-PR investigations last round:** 3 ecosystem-survey
research agents + 2 follow-up agents (calcrom.py port shipped in
PR #707; objdiff v3.7.1 upgrade trial captured as defer-verdict
research note in PR #708). Research adoption arc closed — next
candidate from the punch list is Mizuchi mwccarm fork (Tier A #5,
2-3 days dedicated brief) when prioritised.

**Brain methodology update (this round):** "metric interpretation
must be empirically validated before issuing as a directive."
Brain's brief 239 (D) directive — "flip delinks.txt markers in
overlays where mf > cu" — was based on misinterpreting calcrom
output. Scaffolder's audit found the gap is a natural artifact
of multi-fn-per-TU counting, not a missing-marker indicator. No
ships needed for (D). Brain should treat new metrics as
hypotheses needing validation runs, not as commands.

**Strategic direction (set 2026-05-25 by cntrl_alt_lenny):** the
project pursues TWO goals in parallel, not either-or:
1. **Track 1 — byte-identical ROM from controlled source.**
   `complete_units` is the gauge. Currently 1666/2553 (65.3%).
   Recipe pipeline mature; `.s` ships handle hard walls. Estimated
   30-50 more rounds at current pace to complete (~4-7 weeks).
2. **Track 2 — human-readable C source for every function.**
   `matched_functions` minus `.s`-via-recovery is the gauge.
   Currently ~280 actual C-source matches across 9,801 functions.
   Multi-year arc at current pace, but cntrl_alt_lenny is
   explicitly bullish on AI-tool improvement (6-18 months) cutting
   this much shorter. The project will continue regardless.

**Brain-PR investigations this round:** Verification + housekeeping
only. No code changes this round; both PRs landed cleanly (brief
220 research-only, brief 221 mechanical .s drain with one
StyleA .legacy.c the PR body undercounted). **Two standout
artifacts this round:** (1) brief 220's hard-tier survey is the
strategic groundwork for the next 5-10 rounds — the histogram +
unclassified-pattern breakdown gives brain crystal-clear drain
priorities. The C-39 candidate (454 non-leaf bitfield picks) is
particularly exciting because it extends brief 218's recipe to a
huge slice of the hard tier. (2) brief 221 closing medium-tier
at 100 % means trivial+easy+sinit+named+medium are all DONE; the
remaining unmatched pool is entirely hard-tier (7,911 picks).

**Methodology observation (brief 221):** the brief was scoped as
"apply existing recipes per classifier output." Decomper
interpreted this conservatively — all 18 picks shipped as `.s`
(except 1 StyleA `.legacy.c`). The mature recipes (StyleA, C-23,
C-33, C-36, C-15) MIGHT have reached on the other 10 picks with
per-pick variant-matrix work. Brief 223 explicitly flags this as
a lesson: "when the recipe is mature, try .c first."

**Wall 1 status:** classified as **P-4 extended** per brief 218.
"Tiny-thunk reg-allocator divergence" now covers 3 sub-shapes
(swap-tail, pool-load tail, fnptr-cache). Permanent under current
toolchain — informative near-misses captured for future research
if mwcc options ever change.

**Headline metric shift this round.** Investigation found that
`matched_functions` is systematically under-counting `.legacy.c`
+ `.s` ships because objdiff requires unrelocated-`.o` byte-
identity while our shipped units have different reloc records
than dsd's delink (post-link bytes match — that's what SHA1
verifies). **Switch to `complete_units` as the headline metric.**
The post-pivot arc (briefs 188 → 203) shipped +44 complete_units
vs the +11 matched_functions previously reported. Real code-
decomp progress is ~4× the prior headline. Full diagnosis:
[`docs/research/objdiff-fuzzy-vs-complete-metric.md`](docs/research/objdiff-fuzzy-vs-complete-metric.md).

**Two open lanes after this merge.** **Brief 230 (decomper)** —
C-39 drain wave 4 (cohort hunting). Apply brief 228's recipe-
variant taxonomy + brief 229's C-39d detector to hunt the
next-largest uniform cohort. Target: 25-40 ships. **Brief 231
(scaffolder)** — C-39c tier-mismatch workaround (cross-tier
pilots) + C-38 non-leaf P-12 verdict. Both kickoffs sent.

**Brain methodology update (PR #664):** "empirical hypothesis
testing — non-negotiable for pre-validation." Brain
pre-validations must run the falsification test before claiming
a root cause; brief 209's `.word`-to-mnemonic test correctly
identified the real mechanism after brain's PR #662 hypothesis
turned out wrong.

**Brain methodology update (this PR):** "reconfigure after rebase
that changes source TU paths." Brief 218 rebased onto post-#677
main, which had brief 219's `.s` → `.legacy.c` swap for
`func_0207db74`. The old `build/eur/build.ninja` still referenced
the deleted `.s`; `ninja sha1` failed until `configure.py` re-ran.
Sibling of the existing "always reconfigure before quoting metrics"
lesson.

**Brain methodology update (this PR):** "recipe falsification ≠
permanent wall." Brief 217 falsified brief 214's Shape B
shift-pair-cast recipe (empirically didn't reach orig on the actual
picks). Brief 218 found a NEW recipe (bitfield struct read) that
DOES reach. The methodology lesson: when a recipe is empirically
falsified, the wall isn't automatically permanent — try other
recipe classes (bitfield, union, intrinsic, address-arithmetic,
volatile, etc.) before classifying as P-N.

**Brain methodology update (last PR):** "rebase open PRs onto
post-merge main BEFORE merging the second one." Brief 217's PR had
markdownlint failing on lines fixed by brief 216 — rebasing onto
post-216 main cleared the CI failure without any new edits. Cheap
when remembered; otherwise burns a force-push + CI cycle on the
agent's branch chasing a stale conflict. (Applied again this round
on brief 218 — same playbook works.)

**Brain methodology update (this PR):** "always reconfigure +
`ninja report` after a merge wave before quoting metrics."
Decomper's brief 213 had to recompute the matched_functions
baseline because state.md's quoted 1698 was stale (real was
1701 post-#666/#667 once a fresh build ran).

## The current headline — 10-brief pivot validation arc (briefs 188 → 197)

The pivot from scaffold to code decomp landed cleanly. 10 briefs
shipped against the post-SHA1 resumption queue + wall taxonomy:

| Brief | Agent | Result | Headline |
|---|---|---|---|
| 188 | decomper | 5/12 trivial ships | First code-decomp brief in 39 briefs |
| 189 | scaffolder | Wall classifier shipped | `predict_walls.py` foundation |
| 190 | decomper | 10/25 easy ships | +0.0093 % matched_code; 4 wall clusters surfaced |
| 191 | scaffolder | C-31 wall closed | Recipe + classifier + 100% detection |
| 192 | scaffolder | C-32 wall closed | Recipe + classifier + 16-pick ov011 scan |
| 193 | decomper | 0/15 medium-easy | Surfaced Cluster E + F mechanisms |
| 194 | scaffolder | C-33 wall closed | Per-section modal-deviation patcher cap |
| 195 | decomper | **8/8 recipe drain** | 100% recipe-locked throughput |
| 196 | scaffolder | Permuter wrapper shipped | 9-pick worklist + outcome schema |
| 197 | decomper | **13/13 ov011 C-32 drain** | Above target + Track B documented |

**Three named walls (C-31/C-32/C-33)** now have locked recipes +
classifier detection in `tools/predict_walls.py`. The post-pivot
methodology has a steady cadence: decomper either drains recipe-
locked picks (briefs 195/197 averaged 95% throughput) or surfaces
wall mechanisms when something new fires (briefs 188/190/193); the
scaffolder converts wall mechanisms into recipes (briefs 191/192/194)
or builds pipeline infrastructure (briefs 187/189/196).

**The unsolved problem:** `matched_functions` has NOT moved since
brief 190. Briefs 195 + 197 shipped 21 `.s` files (which tick
`complete_units` but not `matched_functions`); the C-source matches
brief 188 + 190 produced were small and the well of "trivially
matchable" picks ran dry. Brief 198 is the strategic bet that
permuter can crack the Cluster E / B picks where mwcc-shape
iteration is the bottleneck. Outcome answer due next round.

## The previous headline — pivot from scaffold to code decomp (briefs 182 → 187)

Three pivot-enabler briefs closed the W7 patcher chain at n=0 + revived
`ninja report` (objdiff-verified metrics) + published the 52-pick
curated queue. See PR #634 for the brain-PR that captured the pivot.

## The previous headline — SHA1 PASS achieved (briefs 137 → 140, 2026-05-13)

Mac brain's last full arc closed the SHA1 gap:

1. **Brief 137** — scoped the gap (99.995% was `.DS_Store` noise across
   the extract; 3-brief unlock plan).
2. **Brief 138** — `.DS_Store` filter shipped (100K → 5 bytes / 3 regions).
3. **Brief 139** — cluster A wave 4 + Pattern 3 wave 2 (305 effective
   candidates).
4. **Brief 140 — 🎉🎉🎉 `ninja sha1` PASSES** for EUR + USA + JPN. First
   byte-identical ROM rebuild across all 3 regions. **This is the
   `CLAUDE.md` final-gate criterion.**

Subsequent briefs (141 → 148) ran the post-SHA1 polish wave: ov004
cluster sweep (brief 141), 3-region 27/27 module baseline canonicalised
(brief 136 → 141), patcher generalisation for variable veneer counts
(brief 142 — `n ∈ [0, 86]`), first post-SHA1 decomp wave (brief 143 —
cluster B opened with 60 + 114 true scalars across two waves), Pattern
3 generator extern emission fix (brief 144), ov004 `.rodata` cluster
wave BLOCKED (brief 145) → patcher ctor-terminator detection (brief
146) → ov004 `.rodata` retry shipped 14 syms across 3 shapes (brief
147), cluster B pointer pool survey + recipe (brief 148).

## SHA1 PASS is now the floor

Every PR going forward must preserve 3-region `ninja sha1` PASS:

```
ninja sha1  # EUR — must say "OK"
python tools/configure.py usa && ninja sha1  # USA — must say "OK"
python tools/configure.py jpn && ninja sha1  # JPN — must say "OK"
```

This supersedes the old "24/27 module check" gate. If a PR drops any
region from PASS → FAIL, it does not merge. Cloud and decomper both
verify 3-region SHA1 PASS pre-PR; brain re-verifies pre-merge.

## Today's merges (just-landed)

- **PR #671 — decomper / brief 215 trivial-bucket wave 2.** 🎯
  **46 ships** (12 + 8 + 26 across three waves), well above the
  20-40 target. Easy-tier matched ratio 88.7 % → 92.9 %; unmatched
  easy-tier 125 → 79 picks. Recipe routing: 6 C + 40 `.s` (the
  brief 210 `$d → $a` patcher chain handles all `.s` ships as
  `matched_functions: 1/1`). **Two new walls flagged for scaffolder
  follow-on:** Wall 1 — swap-tail-call register temp (mwcc 2.0
  picks r2; orig wants r3; 3 picks affected; tried 4 source forms,
  none reach r3). Wall 2 — leaf-no-pool reg-alloc divergence (39
  of 79 remaining easy-tier picks share this shape — major drain
  blocker; mwcc 2.0's register choices + instruction scheduling
  diverge from orig in ways that don't track to source-form
  differences). Picks deferred: 1 `func_020b3648` (branches OUT of
  its own range) + 17 Thumb picks (untouched this round; brief 191
  C-31 recipe applies to interwork shims; others need their own
  recipe — suggest a dedicated Thumb sweep). 3-region SHA1 PASS +
  27/27 OK + 0 invariant errors.
- **PR #672 — scaffolder / brief 214 C-37 bit-test/byte-zero 0/1
  idiom — recipe + worked example + detector.** 🎯 **C-37 recipe
  unlocked.** Source idiom
  `unsigned t = (unsigned)(x << 31) >> 31; if (t != 0u) return 1;
  return 0;` produces orig bytes byte-identically under mwcc
  1.2/sp2p3 (legacy tier). mwcc 2.0 has a `tst r0, #1` peephole
  that defeats it; mwcc 1.2 doesn't, and keeps the lsl/lsr shape.
  Three jointly-required source elements pinned: (1) shift-extract
  via unsigned cast (NOT mask); (2) stored in a named temp;
  (3) explicit `if (t != 0u) return 1; return 0;`. Shipped 1
  worked example (`src/main/func_020a584c.legacy.c`), deleted the
  `.s`. New C-37 detector in `tools/predict_walls.py` covering
  4 polarity × shift-width combos. 2 byte-low C-37 variants remain
  as `.s` — recipe documented for decomper follow-up. Drive-by:
  brief 212's `TestStragglerSmoke` tests updated to accept post-fix
  idempotent state (the design-issue I flagged in last round's
  brain-PR — scaffolder fixed it). Bonus finding: scaffolder
  worktree has mwccarm.exe downloaded locally — direct compiler
  invocation worked for the 23×8 variant matrix, bypassing the
  ninja/dsd/objdiff orchestration constraint. EUR SHA1 PASS
  preserved (tools + 1 worked-example swap).
- **Brain-PR (this one) — close briefs 214 + 215, log Wall 1 + 2
  for scaffolder follow-on.** 🔬 Verification + housekeeping. Both
  PRs verified standalone in decomper + combined-merge for #672 on
  top of #671. EUR SHA1 PASS preserved through both. AGENTS.md
  Open briefs already empty from last round; added 214 + 215 to
  Closed briefs. Next-brain TODO updated with Wall 2 classifier as
  top scaffolder candidate (39 of 79 remaining easy-tier picks
  blocked by single mechanism) + 2-byte-low C-37 + Thumb sweep as
  decomper continuation options.
- **PR #669 — decomper / brief 213 trivial-bucket revalidated sweep
  + Entry match.** 🎯 **31 ships** (4 + 8 + 18 across three waves).
  Wave 3 was an `ov002:0x0226acf8` dispatcher cluster — 18 thin
  trampolines all shipped as `.s` since the shape is mechanical.
  Plus `Entry` lifted 98.73% → 100% via a 3-region `relocs.txt`
  addition (`from:0x02000928 kind:load to:0x02000b68 module:main`)
  — same `$d`-family root cause as brief 209, config-side
  remediation. Re-validated the survey-staleness rule from brief
  211: fresh `next_targets.py` showed 156 unmatched easy-tier (not
  the 2026-05-25 survey's "231 trivial" size-only bucket), now
  125 post-drain. New wall candidate surfaced: bit-test → 0/1
  idiom (`lsl r0,r0,#31; movs r0,r0,lsr #31; movne/moveq`) — 4
  picks shipped as `.s` because mwcc 2.0 collapses plain
  `(x & 1) ? 1 : 0` to `tst r0,#1`. Queued as brief 214 candidate.
  Side find: state.md baseline `matched_functions=1698` was stale;
  fresh build at brief 213 start showed 1701 (brain hadn't rebuilt
  objdiff post-#666/#667). Metric deltas: `complete_units` 1672 →
  1703 (+31), `matched_functions` 1701 → 1733 (+32). 3-region SHA1
  PASS + 27/27 OK + 0 invariant errors.
- **PR #668 — scaffolder / brief 212 `$d`/`$a` rewriter audit +
  pass-2 trailing collapse.** 🎯 **Both unflipped brief-209
  stragglers landed at `matched=1/1, fuzzy=100`.**
  `func_ov011_021cb574` and `func_ov011_021d02a4`. Root cause:
  asymmetric `$d` emission (mwasmarm: one `$d` per `.word` *run*;
  dsd-delink: one `$d` per pool *entry*); when a `cond==0xF` data
  word is followed by ARM-like words, pass 1's per-symbol promotion
  produces divergent shapes between the two sides. Pass 2 zeros
  trailing `$a` markers after the last data marker so both sides
  converge on implicit-`$d` to end-of-text. Audit dry-run predicted
  +11 flips; actual incremental over brief 213 was +7 (predictions
  shifted shape on some candidates once brief 213's new src
  landed). New `--sweep` mode for post-fix idempotency checking.
  9 new tests, 25/25 pass; ruff clean. EUR SHA1 PASS preserved
  (tools-only PR, no source touches).
- **Brain-PR (this one) — close briefs 212 + 213 + Windows
  worktree-repair + xMAP infra gap noted.** 🔬 Verification +
  housekeeping. Repaired the `decomper/` and `scaffolder/` worktree
  pointer files (stale paths from a parent-dir rename
  `gx-spirit-caller-NEW` → `gx-spirit-caller`) via
  `git worktree repair` before the agents could git-fetch. Brain
  re-verified post-merge metrics from decomper worktree (brain has
  no build state on this Windows install). Surfaced a long-standing
  `configure.py` gap: `arm9.o.xMAP` (mwldarm linker map side-output)
  is referenced as an input in `build.ninja` but no rule produces
  it — bites fresh worktrees that haven't built before (scaffolder
  worktree triggered this). Queued as scaffolder brief 216 candidate.
- **PR #661 — decomper / brief 209 straggler root-cause diagnosed.**
  🔬 Investigation-only PR. All 23 stragglers (units at
  complete_code=100 + low fuzzy_match) traced to a single mechanism:
  mwasmarm tags `.word 0xHEX` directives with `$d` (data) mapping
  symbols; objdiff reads these as data not code. Empirical
  falsification test: promoted one `.word` to its mnemonic, fuzzy
  went DOWN (13% → 3%) — mixed `$a`/`$d` is worse than pure `$d`.
  Recipes are correct; metric is wrong. Three remediation paths
  proposed; brain queued path #1 (post-process rewrite) as brief
  210. Phase 1 (literal-tail drain) deferred to brief 211 since
  brief 208 hadn't merged at brief 209 start.
  **This invalidated brain's pre-validation hypothesis from PR
  #662** — see "Brain methodology update" in the headline.
- **PR #663 — scaffolder / brief 208 C-36 literal-tail trim trap.**
  🎯 Two-guard patcher fix shipped. Brief 204's reloc-protection
  handled cascade-fill; brief 208 adds delinks-aware slot-size
  guard for literal-tail (no-reloc) case. mwasm padding always
  rounds UP, so when sh_size matches the declared slot size, the
  trailing zeros are content (don't trim). Worked example:
  `func_02023478.s` ships clean. Classifier validates all 5
  brief-207-deferred picks; 6th was a brief-207 mis-listing
  (symbol-ref tail, covered by brief 204 already). +18 tests
  (2150 → 2168).
- **Brain-PR (this one) — brief 208/209 housekeeping + methodology
  lesson.** 🔬 Captured the "empirically falsify hypotheses
  before claiming root cause" lesson in
  [user memory feedback-session-patterns.md](file:///Users/leo/.claude/projects/-Users-leo-Dev-spirit-caller/memory/feedback_session_patterns.md).
  Also doubled down on "always reconfigure before reading metrics
  post-branch-switch" — that pattern burned brain 3+ times this
  arc with false matched_functions-dropped alarms. Reconfirmed the
  actual metric (post-fresh-build) is matched_functions = 1687,
  not 1673 the stale-build reading showed. AGENTS.md +
  state.md rotated for 208/209 closure + 210/211 queueing.

- **PR #660 — decomper / brief 207 C-34/C-35 rescan drain 32/33.**
  🎯 **Biggest single drain to date.** 5 main + 27 overlay picks
  via the now-locked brief 202 C-34 `.s` recipe. Full-corpus EUR
  rescan via brief 204's C-35 composite classifier; overlay picks
  were out-of-scope in brief 205. 1 deferred (`func_02023478`) —
  surfaced a NEW failure mode beyond brief 204's reloc-only trim
  protection: literal-tail (no relocation) trim. ~5 sibling picks
  affected. Queued as brief 208. +32 complete_units (1636 → 1666).
- **PR #659 — scaffolder / brief 206 objdiff resolve-relocs harness
  shipped.** 🎯 **matched_functions accounting permanently fixed.**
  `tools/objdiff_resolve_relocs.py` applies `R_ARM_ABS32` +
  `R_ARM_PC24` to a fictional fixed base before objdiff compares.
  All 21 high-confidence canaries from brain-PR #658 flipped to
  `matched_functions: 1/1`. Recovery: matched_functions 1430 →
  1654 (+224 cumulative across the arc; +24 against the immediate
  prior measurement). Brain pushed research-index regen on
  review-fix. 2117 → 2146 tests.
- **Brain-PR (this one) — brief 209 stragger pre-validation +
  unmatched function pool survey + two-track strategic capture.**
  🔬 Three research artifacts + housekeeping. (1) Brief 209
  pre-validation: empirically diagnosed brief 206's 23 stragglers,
  showing the bottom-tier 13 ov011 picks have a structural
  unrelocated-byte gap (not a recipe bug); 7 close picks remain
  for brief 209 Phase 2. (2) Strategic survey: 8,149 unmatched
  functions categorised by size/module; identifies BIOS-thunk
  family as highest-leverage easy pick (~30 named SWI thunks
  shippable in one brief). (3) state.md captures the two-track
  strategic direction (byte-identical + human-readable C, both
  pursued in parallel) per cntrl_alt_lenny's 2026-05-25 framing.

- **PR #657 — decomper / brief 205 C-34 full-scan drain 20/21.**
  🎯 Phase 1 (E-08) + Phase 2 (full EUR scan harvest). 20 of 21
  picks shipped via brief 202's C-34 `.s` recipe — biggest drain
  since brief 197's 13/13. Surfaced + worked around a patcher
  trim trap (later properly fixed by brief 204): duplicate-slot-
  as-literal + last-pool-entry-as-literal defeat the 4-byte
  `\x00\x00` trim trigger. 1 pick deferred (`func_02023478`) —
  last pool entry too small to promote; now shippable post-204.
  +20 complete_units (1617 → 1636).
- **PR #656 — scaffolder / brief 204 C-35 routing trilemma +
  patcher trim-protect.** 🎯 Multi-track win. (1) Swept all 15
  mwccarm variants on `func_02021b38` — confirmed no native tier
  produces orig's compact-push + dup-pool + non-strength-reduced-
  loop combo (trilemma is real). (2) Applied brief 202's `.s`
  recipe; shipped `func_02021b38.s` as worked example. (3)
  Surfaced + fixed a patcher trim false-positive in
  `tools/patch_section_align.py::trim_text_section_padding` —
  added reloc-protection that prevents trimming when `.rel.text`
  has an `r_offset` in the last 4 bytes. PR #115's Thumb-thunk
  fix surface preserved. (4) New C-35 composite detector
  (C-23 + C-34) flags routing-trilemma picks. 2110 → 2117 tests.
- **Brain-PR (this one) — brief 206 pre-validation + .codex
  cleanup + 204/205 housekeeping.** 🔬 Diagnostic + janitorial.
  (1) Profile of the 47 units currently sitting at
  `complete_code_percent=100` but `matched_functions=None` —
  brief 206 will recover all of them (predicted: 1630 → 1677).
  Concrete canary list at
  [`docs/research/brief-206-prevalidation.md`](docs/research/brief-206-prevalidation.md).
  (2) `.codex/` cleanup: renamed `cloud.toml` → `scaffolder.toml`,
  updated content (cloud → scaffolder throughout 3 files),
  removed bogus Codex.ai URL convention, fixed `hooks.json`'s
  hardcoded `/Users/leo/Dev/gx-spirit-caller/` paths (relative
  now) + `python` → `python3` (same fix as `.claude/settings.json`
  in PR #634). (3) AGENTS.md / state.md rotated for 204/205
  closure + 206/207 queuing.

- **PR #654 — decomper / brief 203 C-23 drain 2/3 + recipe
  extensions.** 🎯 `OSi_PostIrqEvent` (0x9c) + `func_02093dc8`
  (0x70) shipped as `.legacy.c`. `func_02021b38` (0x74) left
  un-wired (routing trilemma — brief 204 scope). Two new recipe
  extensions to brief 199's C-23 framework: (1) inline-expression
  form `int mask = 1 << data[idx]` anchors callee-saved reg from
  first use; (2) `&base[expr]` forces pool load for variable
  index (direct subscript constant-folds at imm). +3 complete_units;
  matched_functions ticks under-reported (see new research note).
- **PR #653 — scaffolder / brief 202 C-34 wall closed (NOT
  permanent — recipe found).** 🎯 mwcc 2.0's address-CSE pass
  collapses two pool entries for the SAME data symbol into one
  slot. Brief 202 found the bypass: `.s` with explicit `.word`
  data directives at distinct labels — defeats BOTH layers (mwcc
  IR-CSE + mwasmarm pool dedup). E-07 (`func_02023f7c`, 0x70)
  shipped as worked example. New `detect_address_cse` consults
  relocs.txt for 2+ `kind:load to:<same addr>` entries. 8 new
  tests (2080 → 2110). Brief 199 + 200 cohorts correctly DON'T
  fire on C-34.
- **Brain-PR (this one) — rename-tracking investigation +
  housekeeping.** 🔬 Diagnostic-only. Investigation discovered
  that `matched_functions` systematically under-counts `.legacy.c`
  / `.s` ships due to reloc-record divergence between mwcc's
  output and dsd's delink (post-link bytes match — verified by
  SHA1 — but unrelocated `.o` bytes don't, so objdiff classifies
  as fuzzy_match < 100). Recommendation: `complete_units` is the
  SHA1-aligned headline. New research note documents the finding
  + proposes upstream / local fix paths for brief 206+.

- **PR #651 — decomper / brief 201 first C-source via decomp.me
  workflow.** 🎯 **B-08 `func_0205da2c` matched as `.legacy_sp3.c`.**
  Three-routing-tier verification table documented (`.c` wrong reg
  alloc; `.legacy.c` wrong epilogue style; `.legacy_sp3.c` ✓ — explicit
  sub-sp + Style B `pop {pc}`). Permuter couldn't find this because
  the wall was a ROUTING decision, not a source-shape one. E-07 + E-08
  hit a new wall (1-insn diff each — mwcc 2.0 address-CSE collapses
  two pool entries to one slot); handed off to scaffolder brief 202.
  Bonus finding: brief 199's "two pool loads" comment is imprecise
  (both target SAME pool slot — mwcc had already CSE'd). 3-region
  SHA1 PASS. matched_code_percent 1.7190 → 1.7201, matched_functions
  1628 → 1629.
- **PR #649 — scaffolder / brief 200 P-11 reg-allocator plateau.** 🎯
  Brief 198's 5 plateau picks (E-12/13/14, B-22, B-24) classified as
  ONE shared wall — mwcc 2.0 reg-allocator + liveness divergence at
  0x5c-0x74 sizes with helper-call-in-body. Three sub-shapes
  documented: find-empty-slot template, array destructor with
  in-loop bl, useless-spill stack-scratch. All recipe attempts failed
  (volatile / `.legacy.c` / structural simplification) — P-11
  classified as permanent under current tools, may promote to C-N if
  a coercion is found (precedent: C-29 supersedes P-10, C-27
  supersedes P-7). Two-path detector in `predict_walls.py` fires on
  all 5 picks; brief 199's pick #5 correctly does NOT fire (C-23,
  not P-11). 2073 → 2080 tests. Brain pushed lint fix (broken link
  fragment + line wrapping that started with `#4`).

- **Brain-PR (previous) — matched_functions fix + macOS permuter
  workarounds + housekeeping.** 🎉 **+198 matched_functions recovered.**
  Three-part PR. (1) `objdiff_filter_panic_units.py` was silently
  dropping every `.legacy.c` unit because dsd emits objdiff.json
  entries with bare `.o` paths while mwcc produces `.legacy.o` —
  filter's "missing file" branch swallowed them. New
  `_legacy_suffix_from_source` + `_rewrite_path_for_legacy` helpers
  reconcile the two using `source_path` as the authoritative routing
  signal. `matched_code_percent 1.4102 → 1.7190` (+0.3084), function
  count 1430 → 1628. (2) `tools/permute.py` macOS workarounds folded
  in: `expected_disasm_path` scans the tree-mirroring layout when the
  flat path is absent (was symlink-required); `install_permuter_deps`
  detects PEP 668 externally-managed-environment refusal and auto-
  creates `.venv_permuter/` then patches `sys.path` so the venv's
  deps import in-process (no re-exec). (3) AGENTS.md + state.md
  closing brief 198 + 199, queueing brief 200 + 201. 2073 → 2088
  tests (+15 new objdiff filter tests; +5 permute fixes covering
  flat/mirror/PEP668 cases).
- **PR #648 — decomper / brief 198 permuter wave 0/9 converged.**
  🔬 Strategic finding: permuter isn't the right tool for Cluster
  B + E walls. Phase 1 wrote 9 `.c` stubs (gitignored from delinks
  — artifacts only). Phase 2 ran `permute_batch.py` with
  120s/1800s/4-thread budget — all picks hit budget; best scores
  220 → 590. **5 picks plateaued at 480–500** (E-12/13/14 +
  B-22/B-24 — shared codegen mechanism, brief 200 scope). 3 picks
  at 220-315 (E-07/E-08/B-08 — manual-iteration reach, brief 201
  scope). 1 pick at 590 with 53 variants (B-18 — hardware-register-
  fold per brief 190, deferred). Real-world macOS workarounds
  documented (`.venv_permuter` + disasm path symlinks) — folded
  into this brain-PR as proper fixes.
- **PR #647 — scaffolder / brief 199 C-23 wall closed.** 🎯 Pick #5
  (`func_02096434`, 0x6c) shipped clean as `.legacy.c`. **Key
  insight: C-23 + StyleA "stacked walls" from brief 193 is ONE wall
  with ONE recipe** (sub-sp + Style A epilogue is the natural mwcc
  1.2/sp2p3 shape for this call layout). Classifier expanded with
  4 new C-23 signals beyond brief 086's MMIO range: DTCM kernel,
  duplicate refs, clustered pool, contiguous-pool false-positive
  doc. Surfaced 4 more C-23 candidates for brief 200+ drain
  (`OSi_PostIrqEvent`, `func_02021b38`, `func_02093dc8` + pick #5
  shipped). Constant-folding trap documented: naive `*(int *)
  (base + offset)` folds even at `.legacy.c` tier — keep base +
  offset separate in source. 2068 → 2073 tests.

### Earlier this round (#635 → #646 from previous brain-PR)

- **PR #645 — decomper / brief 197 Track A 13/13 + Track B documented.**
  🎉 **13 of 13 ov011 C-32 picks ship via brief 192's locked recipe**
  (above ≥ 10 target). 5.6 KB `.text` across 13 functions, 30 hand-
  encoded cross-overlay BLs. `/tmp/c32_emit.py` helper automated `.s`
  generation from orig bytes — sidesteps transcription error across
  thousands of instructions. Track B 0/2 lands on brief 193 pick #2
  re-attempt: `.legacy.c` builds cleanly (brief 194's Cluster F fix
  empirically confirmed) but is structurally different from orig;
  `.c` (mwcc 2.0) closest variant is do-while form with 14 residual
  diffs (reg-allocator preference — escalates to brief 198+ permuter).
  Surfaces C-15 prediction caveat: `mvn #0` in orig doesn't always
  mean mwcc 1.2. `complete_units` 1415 → 1428. 3-region SHA1 PASS +
  27/27 OK.
- **PR #644 — scaffolder / brief 196 permuter batch wrapper.** 🎯
  `tools/permute_batch.py` wraps brief 098's single-shot permuter
  for worklist-driven batch use with budgets + threads + structured
  results JSON (match / no_match / timeout / stub_missing /
  import_failed / budget_exhausted). 9-pick worklist for Cluster B +
  E published. Dry-run finding: 9/9 picks `stub_missing` — the actual
  gap is between "skip during decomp wave" and "drive permuter
  against the result," NOT permuter viability. **Brief 198 (decomper)
  closes the gap by writing the stubs.** 2032 → 2068 tests (+36).
- **PR #643 — scaffolder / brief 194 C-33 wall + patcher cap revision.**
  🎯 Brilliant diagnostic move: brief 193's "+64 byte cascade" turned
  out to be a *virtual LCF accounting artifact*, not a physical shift.
  120 TU sections all shifted by the same +64-to-+68 magnitude (modal
  100% consensus on `.text` and `.data`). New `_section_modal_shifts()`
  measures deviation from PER-SECTION modal; absolute cap fires only
  when a TU moves INDEPENDENTLY from its section's bulk. Unblocks ALL
  `.legacy.c` > 0x50 routing — substantial mid-tier work. Honest
  worked-example caveat: fix unblocks the BUILD pipeline but byte-
  matching brief 193's affected picks is Cluster E permuter territory.
  +1150/-15, 2032/2032 tests (+20).
- **PR #642 — decomper / brief 195 recipe drain 8/8 ships.** 🎉
  **100% recipe-locked throughput.** Drained all C-31 + C-32 locked
  picks from briefs 191/192: 4 cluster-A cross-overlay BL picks +
  4 mwldarm interwork picks. `.s` files per recipes. One mwasmarm-
  dialect snag fixed inline (`lsl`/`lsr` aren't standalone mnemonics
  in ARM mode). `complete_units` 1407 → 1415.
- **PR #640 — decomper / brief 193 medium-easy 0/15.** 🔬 Pivot's
  first wash brief but high diagnostic yield. Two new wall clusters
  documented: **Cluster E (mwcc reg-alloc + scheduling drift)** —
  5 picks affected, permuter territory; **Cluster F (`.legacy.c`
  cascade)** — 3 picks affected, forward-progress blocker for ALL
  `.legacy.c` > 0x50 (closed by brief 194). Pick #19 correctly flagged
  as mis-tagged in brief 190's queue.
- **PR #639 — scaffolder / brief 192 C-32 cross-overlay BL wall.**
  🎯 Recipe + classifier + worked example. ov011/ov012/ov013
  functions with `bl <hardcoded VA>` to shared-base-range addresses;
  dsd emits orig bytes with NO `R_ARM_PC24` reloc. Recipe: `.s` with
  hand-encoded BL `.word`. Worked example: `func_ov011_021d2c64.s`
  (40 B). Three shared-base ranges documented. Full ov011 scan found
  12 additional C-32 hits (brief 197 drained them). +763 LOC, 2012
  tests.
- **PR #638 — scaffolder / brief 191 C-31 mwldarm interwork wall.**
  🎯 Recipe + classifier + worked example. `ldr rN, [pc, …]; bx rN;
  .word target` pattern causes multi-KB cascade when source-claimed
  (mwldarm re-emits veneers when its native slots are user-claimed).
  Empirical repro: 158,713 B (59.2%) divergence with 19,693 runs.
  Recipe: `.s` with `.thumb` directive (NOT `.thumb_func`). Three
  shape signatures classified. 100% detection on all 5 brief-188
  affected picks. +588 LOC, 2005 tests.
- **PR #637 — decomper / brief 190 easy-bucket 10/25 ships.** ✅
  `matched_code_percent` +0.0093% (5.5× brief 188's delta). +6
  matched_functions. Four new wall clusters surfaced from skipped
  picks (3 became named walls in briefs 191/192/194; 1 became
  Cluster E for permuter).
- **PR #636 — decomper / brief 188 first code-decomp wave.** 🎉
  **First code-decomp brief in 39 briefs.** 5/12 trivial picks
  ship; matched_code +0.0017%, matched_functions +4 — **first
  positive metric movement since SHA1 PASS at brief 140.** Per-pick
  wall classification surfaced C-31 mwldarm interwork (5 of 7
  skipped) + 2 epilogue orphans.
- **PR #635 — scaffolder / brief 189 wall pre-emption classifier.**
  🎯 `tools/predict_walls.py` (480 LOC) — disasm-based wall
  classifier. Project-wide tally: C-1 3,980 / StyleA 2,074 / C-15 869
  / C-22 286 / P-9 225 / C-24 212 (out of 9,849 scanned). Top-3 wall
  research notes shipped. `next_targets.py:reason` now emits
  `[walls: ...]`. Foundation that briefs 191/192/194 extended.
- **PR #634 — brain / housekeeping for 182-187 pivot capture.**
  AGENTS.md + state.md captured the W7 closure + post-SHA1 scaffold
  done declaration. Fixed `python` → `python3` in Stop hook (silent
  failure on Mac since macOS ships no plain `python`).

### Earlier (PR #629 → #633 from the previous brain-PR — see PR #634 body)

- **PR #633 — scaffolder / brief 187 code-decomp resumption prep.**
  🎉 **Pivot enabler shipped.** Three-part single PR. (1) Diagnosed
  `ninja report` panicking with `index out of bounds` at
  `objdiff-core/src/arch/arm.rs:130:29`; root cause: `.text` sections
  with no `STT_FUNC` symbol coverage OR target `.o` missing (`.legacy`/
  `.legacy_sp3` routing tiers with no C source yet).
  `tools/objdiff_filter_panic_units.py` drops 1,096 / 3,330 affected
  units via direct ELF parsing (no `pyelftools` dep); ninja report
  succeeds in ~0.2 s. **First post-filter metrics:**
  `matched_code_percent = 1.40 %`, `matched_functions = 1,420 / 9,608
  (14.78 %)`, `complete_units = 1,381 / 2,234`. Upstream
  [objdiff#352](https://github.com/encounter/objdiff/issues/352)
  filed with backtrace + 1020-byte base64 ELF reproducer + suggested
  fix direction. (2) `docs/research/code-decomp-resumption-queue.md`
  — 52-pick curated queue (12 trivial + 25 easy + 15 medium-easy),
  ranked easiest-first. (3) `docs/decomp-workflow.md` refreshed with
  the "Code-decomp resumption — the post-scaffold playbook" section:
  routing decision tree, scratch flow, permuter staging, 3-region
  SHA1 PASS as headline gate. Brain pushed MD012 fix (commit 38ec1e2,
  3 spots — triple-blank before bucket tables in the queue doc).
  1973/1973 tests, 3-region SHA1 PASS preserved.
- **PR #632 — decomper / brief 182 W7 chain CLOSED for EUR.**
  🎉 **Both odd-aligned EUR ov004 `.rodata` claims ship via
  brief 173 Variant A.** `data_ov004_021ded69` (8,780 B `.rodata`
  `[0x021ded69..0x021e0fb5)`) + `data_ov004_021e191c` (1,173 B
  `[0x021e191c..0x021e1db1)`), both `__attribute__((aligned(1)))
  const unsigned char[N]`. Total: 9,953 new EUR bytes. n=2 → n=0.
  **W7 chain: 134 → 142 → 146 → 150 → 162 → 164 → 168 → 180 → 183
  → 186 → 182 CLOSED for EUR.** USA + JPN cross-region attempted +
  reverted: extending the USA/JPN claim to absorb the inner
  `data_ov004_021e1b9d` placeholder produces a +36 B `.rodata`
  cascade well over brief 180's `MAX_SHIFT_BYTES = 4` cap, not
  absorbed by the 20-byte `.ctor` pad. Deferred indefinitely per
  pivot discipline. Self-extend survey: 35 odd-aligned ov004 data
  symbols total, 1 shipped, 34 remain. 3-region SHA1 PASS (EUR at
  n=0, USA + JPN baseline preserved) + 27/27 modules + 0
  match-invariants errors.
- **PR #631 — scaffolder / brief 186 patcher gap closure.**
  🎯 **Two parser gaps closed in `tools/patch_ov004_veneers.py`
  from the decomper's brief 182 diagnosis.** Gap A — TU trailing
  range lost when last symbol has size=0: new
  `_MAP_SECTION_BOUNDARY_RE` parses `OV<NN>_<SECTION>_START/END`
  markers; per-TU `built_end_va` extends to next TU's start (or
  section END for trailing TU); defensive `max()` semantic — never
  shrinks. Gap B — `.ctor` shift defaulted to 0 instead of
  inheriting from `.init`: fallback uses most recent `.init` TU's
  shift when own `shift_candidate` is None AND no prior `.ctor`
  TU exists. Real-data confirmed on EUR map: `.ctor` shift now +24
  (was 0), `_dsd_gap@ov004_24.o (.text) built_end_va` now extends
  to next TU start. +256/-0, 4 new tests (1969 → 1973), 3-region
  SHA1 PASS at n=2 baseline.
- **PR #630 — scaffolder / brief 185 cluster B cap raise.**
  🎯 **`max_bundle_bytes` raised 1024 → 4096 + `data_ov006_021ceae4`
  worked example.** Diagnosis: bundle MUST end at a 4-aligned named
  symbol; no intermediate one exists between `0x021ceae4` and
  `0x021cef74` (1168 B away). Tightening predicate (option a)
  structurally infeasible — chose option b: raise cap + new
  `max_inner_symbols = 16` per-cluster guardrail. New
  `render_bundle_s_bytewise` emitter for byte-granular .s with
  `.global` labels at non-4-aligned offsets. Worked example:
  `data_ov006_021ceae4.s` (USA + JPN ov006, byte-identical
  cross-region). 1956 → 1969 tests. Research note at
  `docs/research/cluster-b-bundle-cap-raise.md`. 3-region SHA1
  PASS preserved.
- **PR #629 — scaffolder / brief 184 C / D-1 / D-2 cross-region
  subcommands.** 🎯 **`adjust_chunk_extent` is already cluster-
  agnostic; this brief wires three new subcommands.**
  `cmd_c_strings` (Pattern 3 `.s` via `cluster_c_pattern3_gen.
  generate_chunk`), `cmd_d1_tables` (bespoke `extern char <p>;` +
  `void *<a>[N] = { &p, ... }`), `cmd_d2_tables` (Pattern 3 `.s`
  with `--section data`). Each follows existing `cmd_b_*` shape
  (load region context → enumerate → adjust extent → emit). EUR
  dry-run smoke totals: 1855 emit / 741 skip across the three
  subcommands. 1937 → 1956 tests (+19). Pure tools work — no source
  ships; decomper's brief 188+ owns the apply at scale (deferred
  per pivot — brief 188 is code decomp, not data apply). 3-region
  SHA1 PASS preserved.

### Earlier this round (PRs #622 → #624 from the previous brain-PR)

- **PR #622 — brain / cloud→scaffolder rename + extended
  cleanup.** Two-commit PR: initial in-repo rename (agent
  files, AGENTS.md table, CI labeler, tools docstrings)
  + extended cleanup commit that drops all forward-facing
  `cloud` references in `AGENTS.md`, `docs/state.md`,
  `docs/decomp-workflow.md`, `.claude/agents/scaffolder.md`
  (History section removed), and `tests/test_generate_research_index.py`
  fixtures. Preserved (intentional): 5 factual branch-name
  references to `cloud/patcher-variant-e-2byte-pool-shift`
  (real git artifact), generic `cloud LLM session` in
  brain-runs-locally rationale, `iCloud-share` in
  onboarding. Suite 1904/1904 + EUR SHA1 PASS.
- **PR #621 — scaffolder / brief 179 Variant E
  FALSIFIED.** 🔬 1–3 byte veneer-pool shift model
  disproven via empirical reproduction on EUR
  `data_ov004_021ded69` Variant A. Actual root cause:
  multi-segment `.rodata` layout cascade (+0/+1/+2/+4
  across 4 TU boundaries, absorbed by 16-vs-20 `.ctor`-pad
  delta). Pure pool-shift detection — even with
  `MAX_SHIFT_BYTES = 3` — cannot close SHA1. Ships ONLY
  the research note (`docs/research/ov004-odd-aligned-
  layout-cascade.md`) + brief 180 reformulation spec; no
  patcher / source / delinks changes. 3-region SHA1 PASS
  preserved at n=2.
- **PR #620 — decomper / brief 178 cross-region D-3 at
  scale.** 🎉 **74 cross-region D-3 chunks** shipped (37
  USA + 37 JPN, 247% over ≥30 target). 80,152 bytes of
  new region-specific data (40,076 per region). Per-
  region per-module: 18 main + 6 ov002 + 11 ov006 + 1
  ov007 + 1 ov021. Method: brief 177's
  `cross_region_chunk_extent.py` for extent adjustment +
  **recursive split-around-pre-existing-TUs pass** to
  maximize coverage (13 → 37 per region). 3-region SHA1
  PASS + 27/27 modules preserved. Brain pushed drift-
  check regen fix on rebase.
- **PR #623 — scaffolder / brief 180 patcher Variant E
  proper.** 🎉 **W7 chain extends to brief 180.** Four
  pieces: (1) dropped `veneer_count > 0` gate on load-
  rewrite + ARM-BL re-encode passes; (2) `--map` CLI arg
  plumbed through `rom_config` rule; (3) map-driven per-
  TU layout reconstruction (~558 LOC) with
  `parse_link_map_ov004` + `_layout_reconstruct` (per-TU
  bounds, not per-symbol — sidesteps the ~21 KB gap-
  marker stranding); (4) `MAX_SHIFT_BYTES = 4` cap.
  **Brain caught a routing-order bug** on first verify
  pass: parser raised on shift > 4 BEFORE the
  `_is_orig_shape` idempotence guard ran, breaking n=2
  production. Scaffolder picked Option A (move cap out
  of parser into `_layout_reconstruct`) and shipped the
  fix in commit adc44f6 + 4 new regression tests. Suite
  1930 → 1934. 3-region SHA1 PASS preserved at n=2.
  Brief 182 (decomper path-2 final wave dropping n=2 →
  n=0) now unblocked.
- **PR #624 — decomper / brief 181 cluster B residue +
  cluster D-3 small-residue cleanup.** Bridge wave while
  brief 180 was in flight. Three sub-targets in one PR:
  (1) cluster B size-1/2 + odd-aligned cross-region —
  3 bundles per region × USA + JPN = 6 ships + ov002
  bonus; (2) 3 cluster B value=0 EUR deferred (W6-
  rejected wave-2 rewrite) — 2 main rewrites absorbing
  3 placeholders + bonus cross-region absorbing 6 more
  across USA + JPN; (3) cluster D-3 `data_020e0e70`
  (366 B → 544 B Pattern 3 chunk absorbing
  `data_020e0fde`). Bytes: EUR 556, USA 148, JPN 148.
  3-region SHA1 PASS + 27/27 modules preserved.
  Skipped: `data_ov006_021ceae4` (>1024 B safety cap),
  `data_ov002_022ccc2e` (odd-aligned, needs brief 180
  recipe — now unblocked), `data_020c9694` 14.8 KB
  D-3 mega (separate brief).

- **PR #617 — decomper / brief 176 cluster B residue at
  scale.** ✅ **Brief 174 generator validated at scale.**
  32 cluster B residue claims shipped across USA + JPN
  (16 each); 14 main + 1 ov004 + 1 ov006 per region.
  **🎉 Brief 170 ov006 sub-pool RESOLVED** — brief 170
  reported a 32-byte `.data` ordering shift; brief 172
  didn't resolve; brief 174's more conservative bundle
  extents now ship cleanly (`data_ov006_021ce9e0` lands
  in this wave). Apply funnel: 30 worklist → skip 14
  (size=2/1 + odd-aligned + worked + overlap) → apply
  16. Self-extend both gates met (53% yield, 500+ B per
  region). Residue 16 (size-1/2 + odd-aligned) deferred
  to brief 180+. **3-region SHA1 PASS + 27/27 OK
  preserved.**
- **PR #618 — scaffolder / brief 177 unified chunk-extent
  generator.** 🎉 New `tools/cross_region_chunk_extent.py`
  generalises brief 174's bundle heuristic to multi-symbol
  Pattern 3 chunks. **3-phase algorithm**: Phase A lowers
  start LEFT to absorb predecessor; Phase B raises end
  RIGHT iteratively for inner extents; Phase C validates
  4-aligned + named-symbol + non-zero. **Brief 175's
  headline failure REPRODUCES + ships**: target
  `[0x021cca88, 0x021ccd08)` → adjusted
  `[0x021cca68, 0x021ccf68)` (1280 B). 2 worked examples
  shipped — USA + JPN ov006 (1280 B each) + USA main
  (816 B). 15 new tests; suite 1889 → 1904. Brain pushed
  F401 ruff fix + manual delinks.txt merge conflict
  resolution (both PRs touched same files; additive
  merge).

- **PR #578 — decomper / brief 151 ov004 .rodata wave 2.** ✅
  **28 source-level claims** (40% over ≥ 20 target). Per-shape:
  25 Pattern 1 .c (`.data` strings, brief 141 orphan recovery —
  the .c files were already in the working tree but were never
  wired into delinks.txt), 2 D-1 dispatch tables, and 1 Pattern 3
  mega chunk at `0x02200f18..0x02206738` covering a 22.5 KB
  block with 2 symbols. Total: 23,432 bytes. 3-region SHA1 PASS +
  27/27 OK preserved. **BONUS NOT MET**: couldn't drop ov004's
  veneer count `n` below 9 — investigation showed remaining
  candidates are ARM-code symbols misclassified as `data` in
  `symbols.txt`. Brief 154 (scaffolder, queued) takes the
  reclassification research as the next step.
- **PR #579 — scaffolder / brief 152 cluster B size-1/2 workarounds.**
  ✅ **Workaround #3 PASSES; workaround #2 FALSIFIED with root-
  cause diagnosis.** Empirical finding: `arm9.lcf`'s
  `ALIGNALL(2)` directive (not mwcc) is the alignment-cascade
  culprit — the `.o` reports `Algn 2**0` correctly, but mwldarm
  re-aligns every section to 4 bytes at link time, padding 3
  bytes after a 1-byte section. Workaround #3 (bundle the size-
  1/2 slot + zero-pad neighbours into `unsigned int[N]` covering
  the deduced range to the next named symbol) sidesteps the
  cascade. Worked example shipped: `data_021020b4` (16-int
  bundle, 64 bytes). 3-region SHA1 PASS + 1784/1784 tests.
  Research note at `docs/research/cluster-b-size-1-2-recipe.md`.
  Recipe ready for brief 153 (decomper) to drain.
- **PR #575 — decomper / brief 149 cluster B wave 3.** ✅
  **Cluster B pointer pool fully drained**: 20 of 20 remaining
  candidates shipped via brief 148's locked recipe. 8 data-pointer
  singletons + 4 code-pointer singletons + two 4-element + one
  3-element fn-ptr "table" + one ov004 (bss pointee). **3-region
  SHA1 PASS + 27/27 OK preserved.** Notable empirical correction:
  **REJECTED brief 148's bundling-into-array hand-off** — checked
  `relocs.txt`, found each table slot is referenced by name from
  other code, so bundling would break per-slot symbol identity.
  All 20 shipped as singletons. **Size-1 workaround #1 (.s with
  explicit `.byte`) FALSIFIED** — same 1308 byte / 32-byte
  cascade as brief 148's naive .c attempt; mwasmarm respects the
  same LCF section-alignment cascade as mwcc. Workarounds #2 +
  #3 deferred to brief 152. Self-extend gate: yield 100% PASS,
  bytes-matched FAIL (80 B vs ≥250 B — pointers are 4 B). Brief
  closes after wave 1.
- **PR #576 — scaffolder / brief 150 low-n WITH_TERMINATOR.** Option
  A shipped (recommended): `_fix_ctor_and_pad`'s byte-detection
  is now the authoritative truth source; n-inference is an
  informational hint via stderr note on disagreement, not a
  fatal error. **Patcher accepts any `n ∈ [0, 86]` cleanly.**
  `expected_output_size_for` gains optional `ctor_pad_net`
  parameter that takes precedence over n-inference; `main()`
  passes the byte-detected truth into the YAML `code_size`
  rewrite. 8 new tests (`TestLowNWithTerminator` +
  `TestExpectedOutputSizeForCtorPadNet`) pin brief 147's n=2 +
  n=7 failing cases under brief 150 + assert stderr note
  semantics. **Test suite 1784/1784.** **3-region `ninja sha1`
  PASS preserved bit-for-bit at the historical n=86 case.**
  Cloud honestly documented test-scope limits: end-to-end smoke
  via an arbitrary source claim couldn't drop `n` below 9
  because suppression depends on the slot being an ov002
  cross-overlay pointer target — reverse-lookup tool is brief
  151+ territory. **Brief 134 → 142 → 146 → 150 patcher chain
  complete** — W7 mitigation now fully general.

## In flight (post this brain-PR)

**Open PRs: 0** once this brain-PR lands. **Both agents idle —
no briefs in flight.** Brain to scope next-round kickoffs based
on the candidates listed in *Next-brain TODO* below.

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
[`docs/research/objdiff-fuzzy-vs-complete-metric.md`](docs/research/objdiff-fuzzy-vs-complete-metric.md).

**Current (post #671 + #672 merge):**

| Metric | Value | Notes |
|---|---|---|
| **complete_units** | **1,749 / 2,660** | SHA1-aligned headline. 65.75 %. +46 over post-#668/#669 (1,703 baseline at last round). |
| matched_code_percent | **5.0263 %** | +0.046 pp this round — mostly `.s` ships which are headline-light but complete-units-heavy. |
| matched_functions | **1,786 / 9,801** (18.22 %) | +46 over post-#668/#669 baseline of 1,740. The brief 210 `$d → $a` chain credits `.s` ships cleanly now. |
| fuzzy_match_percent | **5.7246 %** | +0.047 pp this round |
| complete_code_percent | (per-unit) | for individual ships, 100 % means byte-identical at the linker level |
| **easy-tier matched ratio** | **92.9 %** | up from 88.7 %. 79 unmatched easy-tier picks remain, of which 39 are Wall-2-blocked (leaf-no-pool reg-alloc divergence). |

**Resumption queue:** [docs/research/code-decomp-resumption-queue.md](docs/research/code-decomp-resumption-queue.md)
— 52 picks across trivial (12) / easy (25) / medium-easy (15).
Brief 188 is grinding the trivial bucket; brief 190+ picks up
easy + medium-easy once brief 189's wall pre-emption lands.

**Resumption playbook:** [docs/decomp-workflow.md](docs/decomp-workflow.md)
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
