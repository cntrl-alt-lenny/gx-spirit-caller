# Brief 198 — permuter wave outcomes (Cluster B + E)

**Brief:** 198 (decomper). Phase 1 wrote stubs for the 9 picks
brief 196 wired into `tools/permute_batch.py`. Phase 2 ran the
batch wrapper with the brief's `--per-pick-seconds 120
--total-seconds 1800 --threads 4` budget. Phase 3 (manual
coercion of low-score residuals) skipped — see § *Why no manual
coercion* below.

## Headline

**0 of 9 picks converged.** Permuter explored hundreds to
thousands of variants per pick over 120 s wall each, dropped
best scores substantially in some cases (B-18 705 → 590,
B-22 540 → 500), but **none reached score 0** (= byte-match).

Per the brief's "realistic expectation":

> 0 means permuter isn't the right tool here and we need a
> different mechanism (decomp.me + hand-iterated source shapes).

So that's the directional finding this brief returns: **Cluster
B/E walls are not amenable to source-shape iteration via mwcc-
agnostic random perturbation**. Future picks in these clusters
should route through decomp.me + manual coercion, or wait for
scaffolder-side mwcc 2.0 reg-allocator hint research.

## Per-pick outcomes

| Pick | Module | Addr | Size | Best score | Outputs found | Elapsed |
|---|---|---|---:|---:|---:|---:|
| **E-07** | main | 0x02023f7c | 112 | **220** | 1 | 120.9 s |
| **E-08** | main | 0x02026fd8 | 112 | **230** | 2 | 120.9 s |
| **B-08** | main | 0x0205da2c | 28 | 315 | 2 | 120.7 s |
| **E-12** | main | 0x02024574 | 116 | 480 | 3 | 121.0 s |
| **E-13** | main | 0x020270d0 | 116 | 485 | 3 | 121.5 s |
| **E-14** | main | 0x02028790 | 116 | 485 | 1 | 120.8 s |
| **B-24** | ov011 | 0x021d2ca8 | 92 | 490 | 4 | 120.8 s |
| **B-22** | main | 0x0200b0c8 | 92 | 500 | 5 | 120.7 s |
| **B-18** | itcm | 0x01ff8770 | 80 | 590 | 53 | 121.3 s |

(Lower score = closer to byte-match. 0 = perfect match. The
"output dirs found" count is the number of variants permuter
considered improvements over previous best.)

## What the scores mean

E-07 and E-08 (Task_PostLocked wrapper clones) bottomed out at
220 / 230. **These are the most likely to yield to decomp.me +
manual coercion** — the residual is in the 220-byte range out of
112-byte functions (the score weights both byte diff and
structural divergence, so it's not a 1:1 byte count).

B-08 (long-long-return wrapper) at 315 is the next-tier. The
mid-cluster (E-12/E-13/E-14, B-22, B-24) all sit in 480–500 —
permuter found the same plateau across this group, suggesting
a shared wall.

B-18 (ITCM DMA channel programmer) at 590 with 53 variant
outputs suggests permuter explored a lot but couldn't find
fundamental progress. Likely structural — mwcc 1.2 vs 2.0 or
the hardware-register address-folding wall (Cluster B brief
190 documentation).

## Why no manual coercion (Phase 3 skipped)

Brief 198 § "Phase 3 (optional self-extend)" allowed up to 30
min per pick on residual diff coercion if a pick was close. The
two closest (E-07 at 220, E-08 at 230) **are still 6 ×–10 ×
larger than what's typically closable by hand** — for context,
brief 197 pick #2's manual `.c` retry got to 14 diffs after
multiple variants and STILL didn't close. The mwcc 2.0 reg-
allocator's residual divergence at the 200+ score level isn't
the kind of thing a 30-min stare-at-objdiff session resolves.

Cleaner path: ship the stubs as artifacts + this note, let
brain decide whether to scope decomp.me iteration or scaffolder
research as the next move.

## Compile.sh `&&` issue (latent)

The stdout tails from each pick contain:

```
mwccarm.exe: Specified file '&&' not found
Errors caused tool to abort.
```

This is the brief 096 `&&`-strip issue (`strip_compile_sh_ampersand`).
The stripping logic IS in `tools/permute.py` but **isn't applied
to the post-permuter best-source compile**. The strip currently
handles the per-permutation compile loop (where permuter writes
its own `compile.sh` from `ninja -t commands`) but the post-loop
verification compile uses a different path that doesn't strip.

**Effect on this brief:** none — permuter still ran the search
loop correctly (that's where the stripping IS applied), and the
"no score 0 reached" finding doesn't depend on the verification
compile. But it's a confusing tail in the result JSON, worth a
brief 200+ scaffolder note to silence.

## Permuter setup notes (macOS Apple Silicon)

Two non-obvious setup steps needed on this machine:

1. **venv with permuter deps**. Homebrew's externally-managed
   Python protection blocks `pip install toml Levenshtein`.
   Created `.venv_permuter/` (gitignored) and invoked
   `permute_batch.py` via `.venv_permuter/bin/python` instead
   of system `python3.13`.

2. **Symlinks for `expected_disasm_path` mismatch**. `permute.py`
   expects per-function disasm at `build/<region>/disasm/<module>_<addr>.s`,
   but `dsd dis` actually produces files at `build/<region>/disasm/src/<path>/func_<addr>.s`
   (mirroring the source tree). Worked around by creating
   symlinks like `build/eur/disasm/main_0205da2c.s →
   src/main/func_0205da2c.s`. These symlinks are gitignored
   (they're under `build/`), so they don't ship — future
   permuter runs need to recreate them. Worth a brief 200+
   scaffolder fix to either teach `expected_disasm_path` the
   tree-mirroring layout, or add an `ln -sf` step to the
   batch wrapper.

## Stubs shipped as artifacts

Even though none converged, the 9 `.c` stubs are preserved at
their resolved paths (per brief 196's stub_path convention):

| Stub path | Pick |
|---|---|
| `src/main/func_0205da2c.c` | B-08 |
| `src/main/itcm/func_01ff8770.c` | B-18 |
| `src/main/func_0200b0c8.c` | B-22 |
| `src/overlay011/func_021d2ca8.c` | B-24 |
| `src/main/func_02023f7c.c` | E-07 |
| `src/main/func_02026fd8.c` | E-08 |
| `src/main/func_02024574.c` | E-12 |
| `src/main/func_020270d0.c` | E-13 |
| `src/main/func_02028790.c` | E-14 |

**They are NOT wired into delinks.txt** — wiring them would
break 3-region SHA1 PASS because their compiled bytes diverge
from orig. They're staged for future iteration via decomp.me
or via a scaffolder-driven recipe. The brief 196 batch wrapper
will pick them up automatically on a re-run (no `stub_missing`
state to clear).

## Recommendation for brief 200+

1. **Decomp.me path for E-07 + E-08** (the two lowest-score
   picks). The `_vendor/decomp-permuter/nonmatchings/func_020*/`
   directories contain the best variants permuter found — use
   their `source.c` as a starting point in decomp.me, hand-
   iterate the residual.

2. **Scaffolder investigation for the 480–500 plateau**
   (E-12/E-13/E-14 + B-22 + B-24). All five picks bottomed out
   in the same range, suggesting a shared codegen wall. A
   targeted regression-style codegen sweep — write a known-good
   match for ONE function and try to identify which mwcc 2.0
   pass diverges on the others — would unlock the cluster.

3. **B-18 ITCM DMA programmer** has a known hardware-register-
   fold wall from brief 190. Defer until that wall's recipe is
   researched (separate scaffolder track).

4. **Tooling polish**: fix `expected_disasm_path` (or add an
   `ln -sf` step), silence the post-permuter `&&` compile
   error tail. Both small one-shot scaffolder tasks.

## Cross-references

- `docs/research/cluster-b-e-permuter-targets.json` — brief 196
  worklist (the 9 picks)
- `tools/permute_batch.py` — brief 196 batch wrapper
- `tools/permute.py` — brief 063 / 096 single-pick wrapper
- `build/eur/analysis/brief_198_results.json` — full results dump
  (gitignored)
- Brief 190 PR #637 (Cluster B walls) — the original mwcc-elide
  findings for B-08/B-18/B-22/B-24
- Brief 193 PR #640 (Cluster E walls) — the reg-alloc-drift
  findings for E-07/E-08/E-12/E-13/E-14
- Brief 197 PR #645 — pick #2 manual `.c` retry (14-diff
  residual, similar wall class)
