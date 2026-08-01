# cm-ov002-unknown-sweep-11: the dominant-wall mini-item, done directly (2026-07-31)

## Purpose

Same shape as sweep-10 (plain, module-agnostic selection across
149-512B), plus the round's real focus: the coordinating process asked
for "one round of direct attention" on the P-4/P-11/P-12/P-15/P-17
register-allocation family — now confirmed across 3 consecutive rounds
as the campaign's dominant open problem — with three specific
questions to answer: does it have one mechanism or several wearing the
same signature, is it sensitive to declaration order or call-site
liveness, and is there any C-level construct that steers register-
letter assignment at all.

## Result: 27/100 shipped, plus a real answer to the mini-item

| Batch | Shipped | Notes |
|---|---|---|
| 1 (C-61 priority) | 2/20 | 1 more C-61 application (3rd total); 6 more cohort members reached 69.8%–94.1% but not 100% |
| 2 | 9/20 | 7 of 9 shipped via explicit tier routing — direct evidence the corrected verbatim routing text worked |
| 3 | 7/20 | 9 of 13 parks hit the register-preference wall — dominant pattern confirmed independently |
| 4 | 3/20 | Found 3 more C-61-shape instances *without being told* — strongest independent confirmation this round |
| 5 | 6/20 | More register-rotation instances; one genuinely different address-computation-strategy mismatch |

## The mini-item: answered, not fully solved — and that's the honest, correct outcome

Investigated directly via standalone `mwccarm 2.0/sp1p5` compilation
against real parked residuals (not delegated), continuing directly
from work already underway before this round's dispatch. Result:
**C-61** in `codegen-walls.md` — a real, mechanistically-understood,
positive lever for one specific sub-shape (a loop needing a 3-way
correct register assignment across a shared row-base, walking cursor,
and loop index): declare the index and cursor **before** the guard-
clause locals, in their eventual-use relative order. Confirmed
instruction-for-instruction on the first 2 real targets before this
round's dispatch even began, then **reconfirmed 4 more times during
the dispatch itself** — once more via the priority cohort applying the
documented recipe, and three times independently by a worker who
wasn't told which functions were cohort members and recognized the
shape on sight.

**Answering the three questions directly:**

1. **Several mechanisms wearing the same signature, not one.** Within
   a single function, one sub-piece (the loop-body triangle) is
   genuinely steerable from C; a directly adjacent sub-piece (an early
   `and`+`mul` scratch computation) is not, and matches an
   already-exhaustively-falsified pattern from years-old P-11
   falsification work (brief 254's 5-variant matrix). This round
   surfaced a *third* mechanism in the same neighborhood: a
   `rowBase+0x120+idx*4` addressing residual (3 instances,
   `func_ov002_02221348`/`0224f4a0`/`02236bbc`) that resists both of
   C-60's addressing-family phrasings identically — related territory,
   distinct constants, not yet investigated. And a *fourth*: two
   workers independently found that an early guard's condition code
   (`LS` vs `EQ`) depends on `goto`-branch vs. predicated-inline-return
   phrasing, unresolved, recurring on 3 functions.
2. **Yes, declaration order is sometimes the lever — a specific form
   of it, not naive reordering.** The working recipe requires loop-
   scope locals hoisted ahead of *and* in relative-use-order to
   guard-clause locals; every other reordering variant tested (multiple
   workers, multiple functions) reproduces the wrong triangle
   assignment. This is consistent with, and adds real mechanistic
   detail to, the existing C-56 finding.
3. **Yes — this is the headline result.** There is at least one real,
   reproducible, generalizable C-level construct that steers register-
   letter assignment for this wall family, where 3+ rounds of
   accumulated evidence (and, further back, this project's own
   multi-hundred-variant falsification history across P-4/P-11/P-12/
   P-13/P-15) had trended toward "permanent." It doesn't close the
   whole family — most of this round's parks are still blocked by the
   adjacent, unsteerable sub-pieces — but "there is no construct that
   moves this" is no longer true as a blanket statement about the
   family.

**The scale of confirmation this round is itself the strongest
evidence.** Batch 4's independent discovery of 3 more instances in
ordinary plain-selection candidates — without any hint they were part
of the cohort — is a stronger validation than the original 2-target
test could provide alone: the shape is common enough in this codebase
that a worker doing unrelated work runs into it and recognizes it on
sight from the documentation.

## New lever: C-62

A concrete, separate finding: signed `%` and `/` by the same power-of-2
constant compile to visually-similar but genuinely distinct
`lsr`/`rsb`/`ror`-family instruction sequences. A worker misidentified
one for the other from disassembly alone on first attempt (an easy,
recurring transcription risk given the two forms' surface similarity),
caught and confirmed via standalone compilation before shipping.

## Process fixes, both validated

**`ninja delink` in setup:** ran cleanly and in parallel across all 5
worktrees, matching last round's finding that it's compiler-free and
safe alongside `configure.py`. No worker reported a stale-`.s`-rule
symptom this round.

**Verbatim tier-routing text, copied from source this time:** batch 2
shipped 7 of its 9 functions through explicit `.legacy.c`/
`.legacy_sp3.c` routing, applied on the first attempt rather than
discovered mid-session. This is the clearest direct evidence yet that
stating project knowledge verbatim from its source document — rather
than paraphrasing from memory — actually prevents the rediscovery
pattern that recurred 3 times before this fix.

**C-32 screening held:** 2 more genuine instances caught pre-dispatch
this round (8 total across 3 rounds), 0 escaped to a worker's drafting
time.

## Verification

- `check_activation_invariant.py 12f62dbf6..HEAD`: OK — 27 `.c` added
  == 27 `.s` deleted == 27 delinks activations.
- `check_delink_dupes.py`: OK — 81 `delinks.txt`, no duplicate `.text`
  addresses.
- `gate3.py --scope all --clean`: run ONCE on this consolidated branch
  — all three regions SHA1 PASS.
- Research index regenerated before push.
- Each batch independently verified `git status`, per-function
  `delinks.txt` lines, and `fastmatch.py` before committing — several
  batches explicitly noted trusting the tool's resolved comparison
  over their own eyeball reading of `.s` text, per this round's
  explicit instruction (itself prompted by the process error caught
  during the mini-item's own investigation).

## What this suggests for future targeting

Two clear next dedicated-investigation candidates, both narrower and
higher-volume than the general P-4/P-11/P-12/P-15 plateau, following
the same pattern that produced C-60 and C-61: the `rowBase+0x120+idx*4`
addressing residual (3 confirmed instances, likely more), and the
`goto`-vs-predicated condition-code question (3 confirmed instances
across 2 workers). Both look tractable with the same standalone-
compilation method rather than delegated blind — this round's
strongest lesson is that the method itself works; applying it again to
the next-narrowest sub-pattern is the natural continuation, not a new
kind of task.
