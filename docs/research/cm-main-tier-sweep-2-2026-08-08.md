# cm-main-tier-sweep-2: does wave 1's rate hold outside the guard-chain seam? — 60/100 shipped, split 32/50 vs 27/50 (2026-08-08)

## Purpose

Wave 1 (`cm-main-tier-sweep-1`, PR #1472) shipped 71/100 on `main`'s
guard-chain tier, 40–128B. Read honestly: that 71% was measured on a
favorable, pre-filtered population — 100/100 wave-1 attempts were
shape=`guard chain`, and that exact size band was already 71.8%
converted project-wide *before* wave 1 started. The open question this
round exists to answer: **does the rate hold outside that seam?**

The tranche was split deliberately: **50 candidates continuing the
guard-chain band** (Pool A — the known-good seam) and **50 drawn from
the worklist's other shape classes** (Pool B — loop / other / small
dispatcher, genuinely untested territory this campaign), both pulled
from the same `docs/research/campaign-analytics/main-small-tier-worklist.md`
selector, `0x02040000+` range. Pool B was deliberately balanced across
its 3 available shapes (17 loop / 17 other / 16 small dispatcher) — a
pure smallest-first cut would have pulled almost entirely from `other`
and `loop` at an even smaller size than wave 1's own band and said
nothing about `small dispatcher`, which has zero members ≤64B.

**One basis for every headline number in this doc** (wave 1 mixed
"71/100" batch-only against "6,720B" which included the canary — this
round keeps the canary reported separately throughout, never folded
into either pool's denominator).

## Result: 60/100 shipped (59 batch + 1 canary), 3,852 bytes

| | Pool A (guard chain) | Pool B (loop/other/small dispatcher) | Combined |
|---|---:|---:|---:|
| Shipped | **32/50 (64%)** | **27/50 (54%)** | 59/100 (59%) |
| Bytes | 3,020 | 2,748 | 5,768 |

Plus the canary (`func_0205d4c0`, small dispatcher, 68B, shipped
100%) — reported separately, not folded into either pool's 50.

**The honest read: a real gap, but far smaller than the framing
worried about, and it varied enormously batch-to-batch.** Per-batch
Pool B rates ranged from 20% to 80% — wider variance than the
Pool A/Pool B split itself:

| Batch | Pool A | Pool B | Notes |
|---|---:|---:|---|
| 1 | 6/10 | **8/10** | Pool B beat Pool A — the round's first surprise |
| 2 | 6/10 | **8/10** | Pool B beat Pool A again, independently |
| 3 | 6/10 | 5/10 | Roughly even |
| 4 | 8/10 | 2/10 | The gap the round's framing expected |
| 5 | 6/10 | 4/10 | Moderate gap |
| **Total** | **32/50** | **27/50** | |

Two of five batches had Pool B **outship** Pool A. This is not noise —
both batch1 and batch2 independently found that several worklist
"guard chain" labels concealed non-guard-chain bodies (softfloat
conversion routines, a variadic-forwarding wrapper) that hit their own
walls, while several "loop"/"other" candidates turned out to be
textbook libc idioms (strcpy, strncmp, wcschr, block-memcpy, retry
loops) that mwcc compiles very predictably once the right idiom is
matched. **Shape label was a weaker predictor of shippability than the
actual disassembly content, in both directions.**

Batch 4 and batch 5 show the opposite: real, wide gaps, both driven
substantially by one wall family (P-36, pure instruction-scheduling
resistance) and one wall family that gets MORE resistant as guard/
dispatch bodies grow more complex (P-31, predication-resistance — see
below). Batch 4's Pool B in particular is where the round's expected
"real floor" shows up most clearly.

## Canary — proves the loop on the unknown half, finds a real lever immediately

`func_0205d4c0` (0x0205d4c0, 68B, "small dispatcher" per the worklist's
mechanical census — 4 conditional branches to one shared fail tail)
ran through the full loop directly in the `decomper` checkout before
any batch worktree was created. First draft (plain tier, sequential
`if (cond) return 0;` guards): 5.0%, 20 words vs target 17. Applying
C-72 (goto to one shared label, matching the target's structure)
improved it to 17.6% but still only 14 words vs 17 — a WORSE-shaped
mismatch than the naive version, in the opposite direction. The real
lever: this is a leaf function (zero push/pop, no prologue signal at
all) and needed `.legacy.c` tier — switching the identical goto-based
C body to `.legacy.c` matched 100% instantly. This directly
generalized wave 1's C-71 finding (leaf functions can silently need
legacy tier) from guard-chain shape to small-dispatcher shape, and
became the seed finding baked into every batch's dispatch prompt —
confirmed independently by all 5 batches, dozens of times over (see
lever findings below).

## Process incidents — both caught and fixed, reported transparently

**I reproduced the exact orphaned-`.s` bug in my own canary commit,
the mistake I was actively warning every batch about in the same
round's dispatch prompts.** The canary's commit staged the new
`.legacy.c` and the `delinks.txt` flip but never staged the `.s`
deletion (`rm` was run on disk but never `git add`ed) — so the
commit's own tree still carried both files. Batch1 discovered and
fixed it independently (their own `ninja`-adjacent tooling surfaced
it, not a full `ninja delink` this round). Fixed on the main
`decomper` checkout, then independently in batches 2, 3, 4, and 5
(all had already branched from the buggy commit and needed their own
fix commit — batch1 had already self-corrected). Zero data loss, but
worth stating plainly: documenting a lesson does not, by itself,
prevent repeating it one round later — this is now the SECOND time
this exact bug has been caught mid-round rather than prevented
up-front (see [MEMORY] cm-main-tier-sweep-1's identical incident).

**A self-inflicted near-race with batch2's own worktree.** While
checking all 5 worktrees for the orphaned-`.s` inheritance (see
above), I ran `git rm`/`git commit` directly in batch2's worktree
*before confirming its dispatch agent had actually finished* — the
completion notification hadn't arrived yet. The fix itself was narrow
(one file, via `git rm` + `git commit`, no broad `add -A`) and
couldn't touch batch2's own unstaged candidate work, but it could have
collided with a concurrent `git` operation batch2's agent was running
at the same instant. No damage occurred (batch2's own commit landed
cleanly on top once it did report), but the sequencing was wrong —
should have waited for all 5 completion notifications before touching
any worktree post-hoc, exactly the "self-inflicted checkout race with
own background job" pattern from a prior round's lesson.

## Ledger — corrected schema this round, backfilled from ground truth

Per the kickoff's explicit instruction, wave 1's 29 parked rows had a
schema drift: the wall descriptor (e.g. `P-20-bf94-result-register`)
was recorded in the `shape` column, where the actual code shape
(`guard chain`) belongs; `park_class` is the column for the wall
descriptor. **Fixed in place** (commit on this branch): all 29 wave-1
parked rows now read `shape=guard chain`, `park_class=<wall
descriptor>`.

`park_one.py` still does not record from batch worktrees (confirmed
broken again this round — every batch's `attempts.tsv` diff was
empty, identical to wave 1; the Codex Scaffolder's structural fix,
mentioned as in-flight during wave 1's completion pass, has still not
landed or does not cover this path). All 101 attempts this round (1
canary + 100 batch: 60 shipped, 41 parked) were reconstructed from the
5 batch result reports, with every byte size recomputed from
`delinks.txt`'s own start/end span. Shape recorded is the worklist's
own mechanical label for that address (matching what "Pool A"/"Pool
B" means structurally), even where a batch's own semantic reading
found the worklist's label was wrong for a specific function (e.g. a
"guard chain"-labeled softfloat routine) — the mechanical label stays
consistent with the selector; the semantic correction lives in this
doc and the lever findings, not the ledger's shape column.

**Four match-percentage values are estimates, flagged here rather than
presented as measured.** Batch 1's four Pool A parks did not state a
numeric match percentage in their own report (only the sibling Pool B
parks did). Three are estimated from the report's own word-count
prose (`func_020a9764`/`func_020a978c`: body byte-identical, 1 of
10–11 words wrong → ~90%; `func_020b3168`: "everything else correct"
except one flag-fusion residual → ~90%); the fourth
(`func_020a1bbc`, a full-function single-register swap) uses
`func_0209d69c`'s independently-measured 66.7% for the same wall
family in the same round as the closest available analogy (~65%).
None of these four affect the round's headline ship/park counts —
only the ledger's diagnostic percentage field.

## Lever and wall findings

**14 new codegen-walls.md entries this round**: C-77 through C-81 (5
new levers) and P-34 through P-37 (4 new wall entries), plus updates
to 3 existing entries (P-31 promoted from tentative to confirmed with
8+ instances; P-32 given a scope caveat; P-33 confirmed bidirectional)
and one new "open questions" section (OQ-1). Full detail in the
catalogue; summary:

- **C-77** — a scan loop's traveling pointer must be the incoming
  parameter itself, mutated in place, not a copy.
- **C-78** — a loop's compound exit condition needs both halves
  physically in the check block the loop's entry jump reaches.
- **C-79** — pure data-flow register pairing (no branches) can hinge
  on declaration order or written operand order alone.
- **C-80** — an explicit double-shift can get peephole-collapsed to
  one instruction, undershooting a target that keeps both separate.
- **C-81** — `pointer + int` always assigns the pointer to the ADD's
  Rn regardless of source order; cast both operands to a plain integer
  type to regain operand-order control.
- **P-34** (tentative) — a stack-alignment pad won't fold into the
  `lr` push from any source form (va_start-style forwarding wrappers).
- **P-35** (tentative) — a variable-assigned shift/subtract amount
  won't get its flags fused into the following branch.
- **P-36** — the round's highest-yield new finding: instruction
  scheduling/selection order that's simply not source-controllable, 6
  distinct sub-shapes, explains roughly a third of this round's parks
  across 3 independent batches with no cross-talk.
- **P-37** (tentative) — a hand-optimized-looking register-reuse trick
  (using freed `lr`/`ip` as scratch after a `pop{pc}` epilogue) that
  ordinary register allocation won't reproduce.
- **P-31 promoted** — no longer tentative; 8 total confirmed instances
  now. The clearest pattern: if-conversion becomes MORE likely to win
  (resist every branch-forcing attempt) as a guard chain's success
  path grows more complex — the canary's own successful recipe
  (bare-return success path) does NOT generalize to a tail-call-with-
  argument-setup success path, confirmed directly by re-testing the
  canary's exact shape at a larger size (`func_0209f904`).
- **P-32 scope caveat** — adjacent equality values are NOT always
  suppression-safe with plain `||` once the OR sits inside a larger
  3+-guard chain, contradicting the original isolated-2-guard finding.
- **P-33 confirmed bidirectional** — the same-register repeated-
  equality wall blocks conversion in BOTH directions (merge-when-
  branches-wanted AND branch-when-merge-wanted), not just one.
- **OQ-1** — a genuinely unexplained open question, not a lever or
  wall: a provably-dead compile-time-constant guard survives in one
  target but gets folded away by the same toolchain under every C
  reproduction tried, even though an analogous call site elsewhere in
  the codebase uses the identical idiom WITHOUT the guard (proving the
  guard is source-real). Flagged for a dedicated research pass.

**Methodology finding: "small dispatcher" is not a reliable signal for
true multi-way jump-table dispatch.** Across all 3 batches that drew
small-dispatcher candidates (12 total), **zero** were genuine jump
tables. Most were either a plain guard chain with 4+ branches (the
canary's own shape) or a genuine sequential 3-way `cmp`/`beq` chain
(switch-compilable via C-67, confirmed working cleanly on the dispatch
portion in every case tried) — but shipping the WHOLE function
remained uncorrelated with the dispatch shape: 2 of 3 real 3-way
dispatches in one batch parked anyway on a completely unrelated wall
elsewhere in the same function. Treat "small dispatcher" as a weak
signal for "4+ branches present," not for dispatch complexity.
