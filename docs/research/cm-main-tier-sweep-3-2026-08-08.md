# cm-main-tier-sweep-3: the worklist's shape labels, mechanically re-derived — 57/100 shipped, per-shape yield does NOT carry over between rounds (2026-08-08)

## Purpose

Sweep-2 found the worklist's own `shape` column unreliable — several
"guard chain" rows concealed non-guard-chain bodies. That column is
also the basis for wave 1's "100/100 guard chain" homogeneity claim
and every subsequent round's per-shape prioritization. This round
stopped trusting it: every one of the 100 dispatched candidates had
its shape **mechanically re-derived directly from its own `.s` body**
— applying the worklist's own stated rule (trivial stub / tail-call
forwarder / loop-has-a-backward-branch / small-dispatcher-has-4+-
branches / guard-chain-has-1-3-conditional-branches / other) fresh
against the live source, not read from the stored column — and both
labels were recorded together so the disagreement rate itself becomes
measurable, reproducible data rather than a one-off qualitative
finding.

## The measurement tool, and a real bug caught during its own validation

The re-derivation tool was built and validated BEFORE any candidate
was pulled. Three real bugs were caught and fixed during validation,
each by cross-checking against known ground truth (a documented
function with an already-understood true shape) rather than trusting
the tool's own first output:

1. **Counting the function's own mandatory epilogue return
   (`bx lr`, or `pop`/`ldm` with `pc`) as a "branch instruction"** —
   this pushed every 3-guard "guard chain" over the 4-branch
   "small dispatcher" threshold spuriously, since a guard chain with
   multiple tail blocks has multiple unconditional returns. Fixed by
   excluding unconditional exits from the branch count entirely
   (conditional exits, e.g. `bxeq lr`, still count — they're real
   guards).
2. **A `startswith("bl")` exclusion meant for filtering out `bl`/`blx`
   calls also ate `bls`/`ble`/`blt`/`blo`** — real conditional branch
   mnemonics that happen to start with the same two letters. This
   silently broke ALL backward-branch (loop) detection project-wide
   until caught by validating against a known loop function whose
   `blt` back-edge went undetected.
3. **A directive-skip check (`line.startswith(".")`) ran before the
   label check**, but every label in this codebase is written
   dot-prefixed (`.L_xxx:`) — so every label was silently treated as
   a directive and skipped, leaving the label-position table always
   empty. This meant NO backward branch could ever be detected by
   ANY function, for any reason, until the check order was fixed.

After all three fixes, validation against the full population of 975
still-unattempted D-range candidates showed **1.7% mechanical
disagreement** (17/975) between the worklist's stored label and the
tool's fresh re-derivation — concentrated entirely in two patterns:
`small dispatcher → guard chain` (dispatcher-labeled functions with
only 1-3 real conditional branches) and `guard chain → other`
(guard-chain-labeled functions with ZERO branches at all — pure
straight-line code).

**This 1.7% figure answers a narrower question than sweep-2's
qualitative finding, deliberately.** It measures "does the .s content
match the worklist's OWN stated mechanical rule" — not "is the label a
good semantic predictor of difficulty." Sweep-2's softfloat-routine
and variadic-wrapper mislabelings were often mechanically CORRECT
(a softfloat routine's leading null-check really is 1-3 conditional
branches, genuinely guard-chain-shaped by the letter of the rule)
while being semantically misleading. Both kinds of mislabeling matter;
this round tracked them separately (see below).

## Result: 57/100 shipped, 5,112 bytes (58 including the canary, on one basis throughout)

**Pool design.** A pure yield-priority sort (lead with sweep-2's
best-shipping shape) degenerates to 100% loop candidates — loop had
297 of 866 eligible candidates and zero mechanical disagreements, so
a strict sort would have tested nothing else. Instead: a weighted
quota (loop 40, guard chain 30, other 18, small dispatcher 12) still
led with loop, while guaranteeing every one of the pool's 12 known
mechanical disagreements got tested this round (all 12 forced into
their shape's quota ahead of agreeing candidates).

| Derived shape | Shipped | Total | Rate | Sweep-2's rate (for comparison) |
|---|---:|---:|---:|---:|
| loop | 18 | 40 | **45.0%** | 88.2% |
| guard chain | 15 | 30 | **50.0%** | 64.0% |
| other | 15 | 18 | **83.3%** | 41.2% |
| small dispatcher | 9 | 12 | **75.0%** | 31.2% |
| **Total** | **57** | **100** | **57.0%** | 59.0% |

**The headline finding: per-shape yield did NOT carry over from
sweep-2 to this round — for two shapes it inverted outright.** Loop
went from the campaign's best-shipping shape (88.2%) to roughly
average (45.0%); other and small dispatcher went from the WORST-
shipping shapes (41.2%, 31.2%) to the BEST this round (83.3%, 75.0%).
The "lead with what shipped best last time" prioritization strategy
this round was explicitly asked to use produced a WORSE overall rate
(57.0%) than sweep-2's less-targeted split (59.0%). Read honestly:
per-shape yield is not a stable property of the shape category itself
— it is at least as sensitive to which specific instances a given
100-candidate pull happens to contain, and possibly to which
batches/agents draw them, as sweep-2's own "batch composition matters
more than the tier" finding already suggested. A single round's
per-shape rate should not be treated as a forecast for the next round
without much larger samples.

**A structural contributor, not just noise: one batch's entire pool
turned out to be a resurfaced pre-diagnosed backlog.** All 20 of
batch 4's candidates carried a pre-existing "GLOBAL_ASM endgame
(brief 302/294)" header — meaning they were already-confirmed
permanent register-allocation walls from an EARLIER campaign era,
shipped verbatim as `.s`, with zero `attempts.tsv` history (that
marking predates the ledger and used a different tracking mechanism
entirely, invisible to this round's `attempts.tsv`-based exclusion
filter). Batch 4 still shipped 13/20 (65%) of them — real evidence
the lever catalogue has grown enough that many "permanent" walls from
that era are no longer permanent — but this also means the pool
wasn't as clean a sample as intended, and the broader GLOBAL_ASM-
stamped backlog (of unknown size) may be worth a dedicated future
sweep with its own selector.

## Disagreement outcomes — the round's actual deliverable

**Mechanical disagreement rate in the dispatched 100: 11%** (11/100,
plus the canary makes 12 of the pool's 12 known disagreements tested
this round — full coverage of the eligible pool's disagreement
population, deliberately oversampled relative to its 1.7% natural
frequency).

The two disagreement TYPES behaved very differently:

| Disagreement type | Shipped | Total | Rate |
|---|---:|---:|---:|
| `small dispatcher → guard chain` | 3 | 8 | 37.5% |
| `guard chain → other` (incl. canary) | 4 | 4 | **100%** |

Every `guard chain → other` candidate shipped. These are functions
the worklist called "guard chain" that mechanically have ZERO
branches — pure straight-line init/allocator code once you actually
read the `.s`. Every single one, once correctly tier-routed, matched
cleanly; the "guard chain" label was simply wrong, not a proxy for
hidden difficulty. The `small dispatcher → guard chain` cases were
harder: mechanically real guard chains (1-3 conditional branches, no
true dispatch), but several carried genuine register-allocation walls
(3-register permutations, whole-function allocation cascades) that
resisted the same 4-8 restructuring attempts the round's lever set
usually resolves.

**A second, distinct kind of mislabeling recurred: semantically wrong
even where mechanically consistent.** `func_020b007c` (worklist=small
dispatcher, derived=guard chain, both technically defensible readings
of a 2-3-branch body) is neither — it's an IEEE-754 `frexp()`-style
softfloat decomposition routine (confirmed by its Inf/NaN bit masks,
the 2^54 subnormal-normalization constant, and the classic
[0.5, 1.0) mantissa-exponent split), parked at 39.6%. This is now the
SECOND confirmed instance this campaign of a function whose mechanical
branch-count shape is technically correct but whose real difficulty
comes from a completely different source (arithmetic/bit-level
routine, not control flow) — sweep-2 found the first with a matched
pair of int-to-double conversion routines. Mechanical re-derivation
closes the "wrong branch count" gap; it cannot and does not catch this
kind — no automated shape check will, short of disassembling for
known bit-manipulation idioms directly.

## Canary

`func_02096728` (100B, worklist=guard chain, derived=other — a
disagreement case, per the round's own instruction to canary-test
exactly this) is a doubly-linked-list node unlink plus field reset,
wrapped in `OS_DisableIrq`/`OS_RestoreIrq`, zero branches. Routed to
`.legacy.c` from the 2-step `pop{regs,lr}`+`bx lr` epilogue signature
(no `sub sp` visible at all) and shipped 100% on the first attempt —
direct offset-cast reconstruction, no named struct needed. A
`self->f0 = 0; self->f4 = self->f0;` re-read-after-store pattern,
written as two independent raw dereference expressions rather than
through a cached local variable, did NOT need the C-73 `volatile`
treatment — a useful negative data point refining C-73's scope
(the CSE risk C-73 warns about appears specific to reads through a
cached local, not to two independent direct-dereference expressions
of the same address).

## Process notes

**`park_one.py`'s structural ledger fix (PRs #1467/#1479) is confirmed
working, for the first time this campaign.** All 5 batches
independently verified a real row landed in `attempts.tsv` after their
first park and used the tool normally thereafter — no manual backfill
was needed or performed this round, a first. One partial gap: batch 2
omitted the optional `--shape`/`--match-pct`/`--park-class`/`--brief`
flags on all 11 of its park calls (not just the single instance batch
5 separately self-disclosed), leaving those rows' diagnostic fields as
literal `unknown` — the address/size/tier/result fields were still
correct. Fixed in place post-merge using batch 2's own detailed
report (which had the real percentages and wall descriptions in
prose, just not passed to the tool) — corrected where the report
stated a number, left honestly as `unknown` where it didn't rather
than inventing one.

**No repeat of the orphaned-`.s` bug this round** — the canary's own
commit staged the `.s` deletion and `.c` addition together explicitly
after two consecutive rounds of catching this same mistake after the
fact.

**No repeat of the worktree-touching near-race** — this round's
kickoff explicitly asked me to wait for each batch's own completion
notification before touching its worktree, following last round's
self-disclosed close call. All 5 batches were merged only after all 5
had independently reported back.

**A genuine mwcc codegen finding, not just a match gap**: batch 5
found that mwcc 2.0 silently truncates an out-of-range 12-bit `STR`
immediate offset instead of splitting it into a separate address
computation, producing a wrong effective address — a real codegen
correctness edge case (on a parked, unshipped candidate, so no
correctness risk to the built ROM), worth a dedicated look if it
recurs.

## Lever and wall findings

New material this round (full detail in `docs/research/codegen-walls.md`):
a C-44 worked-example correction (careful re-counting of the raw
branch-list beats a remembered paraphrase — an off-by-one here
compiles fine, just to the wrong jump table), a new C-44 extension
(keeping a `case N:`/`default:` pair with textually-identical bodies
as SEPARATE case labels, not merged, prevents mwcc from merging their
jump targets), a strong new C-72 shared-exit-block confirmation
(two candidates went from single-digit percentages to 91-100% on this
fix alone), further P-36 sub-shape 1/2/3 confirmations including a
new "paired post-increment loads/stores resist true post-increment
addressing" refinement of sub-shape 3, and several new candidate wall
observations (sibling-constant arithmetic reuse between two different
local variables, AND-to-shift-pair collapse resisting every caching
hint, a possible P-37 scope-broadening beyond fused-epilogue functions
to separate-`bx-lr` Style A epilogues too) flagged for future
confirmation rather than force-fit into existing numbered entries.
