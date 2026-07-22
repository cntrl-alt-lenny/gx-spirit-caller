# Brief 631 - drafter match-quality lift

_Scaffolder measurement, 2026-07-20._

This fixed-set experiment measures how close b626's compileable C drafts are
to byte matching and tests a conservative prototype-signature improvement.

## Scope and baseline

This measurement uses the same 12 candidates that were compileable in brief
626's 30-candidate probe. They are a fixed EUR set spanning overlays 001,
007, 013, and 022:

```text
func_ov001_021ca074  func_ov001_021ca144  func_ov001_021ca2d8
func_ov013_021ca15c
func_ov022_021aa4a0  func_ov022_021aa6e0  func_ov022_021ab330
func_ov022_021ab5c8  func_ov022_021ab760  func_ov022_021ab804
func_ov007_021b25a0  func_ov007_021b28c4
```

There is a base-state caveat: brief 626 is still an open PR and its commit
is not in `origin/main` (`c2665209`) at the time of this run. The branch
therefore cherry-picks the b626 drafter fix (`84157c6d`) so that the stated
12 compileable candidates and their scaffolds exist. A literal raw-
`origin/main` re-run cannot produce a comparable match average: it has the
pre-b626 compile failure and the 12 drafts do not score. The baseline below
is explicitly the post-b626 scaffold baseline, not a claim about raw
`origin/main`.

## Baseline score

Each draft was staged into its original gap, compiled with the project MWCC
toolchain, and scored with `tools/fastmatch.py` against the original function.
The average is across all 12 candidates; a compile failure is recorded as
zero for the fixed-set aggregate.

| Function | Match |
| --- | ---: |
| `func_ov001_021ca074` | 3.70% |
| `func_ov001_021ca144` | 1.98% |
| `func_ov001_021ca2d8` | 62.50% |
| `func_ov013_021ca15c` | 0.00% |
| `func_ov022_021aa4a0` | 2.50% |
| `func_ov022_021aa6e0` | 3.33% |
| `func_ov022_021ab330` | 27.08% |
| `func_ov022_021ab5c8` | 0.86% |
| `func_ov022_021ab760` | 4.88% |
| `func_ov022_021ab804` | 4.88% |
| `func_ov007_021b25a0` | 16.22% |
| `func_ov007_021b28c4` | 0.00% |
| **Average** | **10.66%** |

The median is 3.515%. Only three drafts are above 10%; the best is
`func_ov001_021ca2d8` at 62.50%.

## Gap analysis

The near-misses are not one missing typedef away from a match. Their
compileable C is a useful semantic sketch, but the remaining differences are
mostly code-generation decisions that the draft does not encode:

- `func_ov001_021ca2d8` has the clearest shape: three helper calls and a
  constant return. Even after replacing its unknown helper declarations with
  committed prototypes, its 62.50% score did not change. The loss is therefore
  in call-result/use and scheduling details, not only declaration spelling.
- `func_ov022_021ab330` reads several unknown data fields (`unk54`, `unkC`,
  and `unk8`). The generic scaffold gives every unknown member an `int`
  representation. That makes the draft legal C, but cannot recover the
  byte-sized/halfword access width, signedness, or exact address arithmetic.
- `func_ov007_021b25a0` uses field-bearing `void *` values and a switch. The
  synthetic aggregate preserves the access shape but not the bank's missing
  field types, and the compiler is free to choose a different branch/local
  schedule.
- The low-scoring drafts contain raw MMIO/pool-address expressions, unknown
  aggregate offsets, and placeholder call arguments. These can compile while
  still selecting different loads, stores, register classes, literal-pool
  forms, or stack layout.

The b626 taxonomy remains the relevant compile boundary: placeholder types,
unknown aggregate fields, field-bearing `void *`, and malformed raw-address
members. At the match boundary, the dominant cost is under-specified type and
address semantics followed by MWCC register allocation and instruction
scheduling. The struct-bank declarations from brief 613 are not available
for these four modules in a uniform way, and even a structurally richer
declaration would not determine the compiler's exact register decisions.

## Attempted improvement and A/B result

I tested a conservative committed-prototype signature bank in the drafter.
It scans existing C prototypes, votes on a function's return type and
parameter types, and rewrites m2c's unknown call declaration before the
compile probe. The same 12 functions were staged and rescored.

| Measure | b626 scaffold | Prototype-bank experiment |
| --- | ---: | ---: |
| Compileable drafts | 12/12 | 10/12 |
| Average over fixed 12 (compile errors = 0) | 10.66% | 10.38% |
| Average among compileable drafts | 10.66% | 12.46% |
| Median among compileable drafts | 3.515% | 4.29% |

The two new compile failures were `func_ov013_021ca15c` and
`func_ov022_021aa6e0`. The apparent +1.80-point conditional average is
selection bias: two candidates fell out of the scored population, while the
fixed-set aggregate declined by 0.28 points. The prototype-bank change was
therefore rejected and is not retained in the drafter.

## Recommendation

**NO-GO for this mechanical match-quality improvement.** On this locked set,
the b626 compile scaffold reaches a measured ceiling of about **10.66% average
match**. Prototype substitution does not lift the fixed-set score and
regresses compile coverage. The drafter is still useful as a human-assist
starting point, but the remaining work needs human type/width choices and
register-allocation or scheduling adjustments. A future lift experiment should
be driven by a corpus of hand-corrected near-misses rather than broader global
prototype guessing.

No source, assembly, delink, or ROM gate files were changed by this brief.
