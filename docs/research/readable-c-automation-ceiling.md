# Readable-C Automation Ceiling

_Decision record for briefs 624, 626, 631, and 632._

## Decision

The m2c-based readable-C lane is a **draft assistant**, not an automatic
match-and-ship system. It can turn assembly into a useful starting point and
can sometimes compile that draft, but the measured path does not reliably
produce close byte matches. Human C-match judgment remains required for
register allocation, scheduling, declaration shape, and compiler-sensitive
expression choices.

Future work should use `cmatch_loop` to prepare and classify drafts for CC
agents. It should not be expanded into an auto-ship path or treated as a
replacement for human review.

## Evidence

### Brief 624: classification sweep

The first ten-module sweep classified 135 matched-but-still-`.s` functions:

| Result | Count |
| --- | ---: |
| Accept | 0 |
| Iterate | 135 |
| Park | 0 |

All 135 iterations were generated-draft compile failures. The loop had not
yet demonstrated that a compiling draft was a useful match candidate.

### Brief 626: compileability recovery

The fixed 30-function probe measured a real drafter improvement: compileability
rose from **0/30 (0%) to 12/30 (40%)**. The failure taxonomy identified
placeholder expressions, unknown pointer/field shapes, and address-taken
unknown locals as the dominant mechanical blockers. The compile-only scaffold
was therefore worthwhile as a human-assist improvement.

Compileability was not matchability. A compiler accepting a draft only means
that a byte comparison can be attempted; it does not mean the draft expresses
the original register roles or scheduling constraints.

### Briefs 631 and 632: match quality

The b631 quality probe reported an average match of approximately **10.66%**
for its twelve-function b626 set. Attempts to enrich the draft with mined
struct-bank information did not establish a reliable lift; the struct-bank
injection was rejected as an adoption path.

The b632 re-land kept the compile-only scaffold and measured the same fixed
30-candidate shape on current main:

| Metric | Current main | Scaffold re-land |
| --- | ---: | ---: |
| Compileable drafts | 4/30 (13.3%) | 17/30 (56.7%) |
| Average, compileable drafts | 2.655% | 16.011% |
| Average, fixed set (compile errors = 0) | 0.354% | 9.073% |
| 100% fastmatch accepts | 0 | 1 |

The re-land was a genuine compile-rate and average-score improvement, with
`func_ov001_021ca2d8` reaching 100% in the fixed probe. It is still not an
automatic lane: the fixed-set average remained 9.073%, most drafts were far
from matching, and the isolated 100% result does not establish generality.

The larger b632 classify-only rest sweep covered 6,011 candidates and found
two fastmatch accepts, 6,009 iterations, and no parks. Those accepts were
restored without shipping. This is useful triage output, not evidence that
the drafter can safely author production C unaided.

## What The Tool Is Good For

- Render a readable first draft from assembly.
- Surface compiler errors and obvious unknown-type scaffolding problems.
- Provide a CC agent with a dossier, sibling examples, and a candidate source
  to edit.
- Classify a large queue cheaply enough to identify where human attention may
  pay off.

## What Still Needs A Human

- Choosing declarations and field types that reproduce the original ABI.
- Recovering register roles and resolving register-allocation differences.
- Controlling MWCC scheduling, expression lowering, and branch shape.
- Reviewing every byte-identical result before a real gate and ship.

## Future-Round Rule

Measure compile rate and match percentage separately. A compile-rate lift is
a successful tooling result even when match quality does not move. Do not
describe a draft as “close” without a fixed, reproducible fastmatch sample;
do not auto-ship any draft produced solely by `m2c_feed` or `cmatch_loop`.
