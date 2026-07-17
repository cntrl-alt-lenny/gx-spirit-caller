# Brief 602: permuter campaign

This was a measurement-only campaign on the two Brief 593 ov002
reg-alloc plateaus. No source, delink, or configuration file was promoted
to the game build, and neither target reached a byte match.

## Harness

Both drafts compiled successfully with the exact project CodeWarrior flags
from `build.ninja`, with the tier selected from the draft suffix:

| Target | Draft/tier | Initial raw score | Brief 593 plateau |
|---|---|---:|---:|
| `func_ov002_022461d8` | `.legacy.c.txt` / `mwccarm 1.2/sp2p3` | 4125 | 69.0% |
| `func_ov002_021b4684` | `.c.txt` / `mwccarm 2.0/sp1p5` | 2990 | 74.7% |

`compile.sh` was run on each unmodified `base.c` before the permuter
launch. The resulting ARM relocatable objects were accepted and scored by
the permuter. Scoring uses the permuter's raw lower-is-better diff penalty;
the percentages above are the normalized plateau figures from Brief 593.

## Campaign results

| Target | Wall-clock run | Iterations | Best raw score | Result |
|---|---:|---:|---:|---|
| `func_ov002_022461d8` | 5400 s | 23,370 | 3405 | No match; park as a permuter negative |
| `func_ov002_021b4684` | >5400 s | 14,682 | 2750 | No match; park as a permuter negative |

The first run ended at the Python wrapper's 5400-second cap. The second
run's multiprocessing child remained alive past the cap despite the wrapper
timeout, so it was terminated after exceeding 90 minutes. Its complete log
and output set were retained before cleanup. The required lane check was
performed before each permuter launch; the second launch waited for the
busy-lane checks to clear.

No output directory named `output-0-*` was produced. The best scores are
improvements over their starting scores, but neither is close enough to
justify source promotion or a gate attempt. No target reached 100%, so there
is no winning match to hand to the Claude Code Decomper for verification.

## Best permutation evidence

The best permutation source for each target is committed verbatim:

- [dispatcher best source](brief-602-best/func_ov002_022461d8.best.c)
- [predicate best source](brief-602-best/func_ov002_021b4684.best.c)

The complete unified diffs against the unmodified drafts are committed here
and are the requested pasteable evidence:

- [dispatcher diff](brief-602-best/func_ov002_022461d8.diff)
- [predicate diff](brief-602-best/func_ov002_021b4684.diff)

The dispatcher best is `output-3405-1`; the predicate best is
`output-2750-1`. These are evidence artifacts only and are not source ships.
