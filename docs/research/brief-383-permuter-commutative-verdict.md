[//]: # (markdownlint-disable MD013 MD041)

# Brief 383 — permuter on the pure-commutative subclass: the hit-rate verdict

**Brief:** 383 (decomper). Drive the m2c→permuter pipeline (built in 379/381) on
the PURE commutative-operand subclass (363's fastest-cracking class) to bank the
first 3-5 C recoveries, and **report the hit rate** — the number that says
whether the permuter is a productive lane or a niche tool.

## VERDICT: hit rate = 0 — because the catalogued "commutative" tier is MISLABELED

The worklist's TIER-1 "commutative" entries are **not** clean operand-order
swaps. Every live one I examined turned out to be a different, harder shape that
neither the permuter (plateaus) nor clean-C (resists) cracks in a practical
budget. The genuinely-pure-commutative case the permuter cracks cleanly
(`020195b8`, 363's shipped example) appears **rare** — the labeled backlog is
mostly mixed reg-alloc/structure/scheduling cases.

| target | worklist label | actual shape (from the diff) | result |
|---|---|---|---|
| `0208c9d4` | commutative | **branch-order coin-flip** — mwcc predicates `eq` (clear) first + early `bxeq`; target predicates `ne` (set) first, both paths, single `bx lr` | permuter plateau **505** (~16k it); 2 clean-C forms = identical bytes |
| `0207d37c` | peephole/commutative | **base-reg binding + u16 cast** — mwcc folds my `arg0+0x24` base into the offset; target keeps `add ip,r0,#0x24` separate, plus a `lsl#16;lsr#16` return cast | clean-C near-miss |
| `021ceffc` (381) | peephole-split | **peephole-split + scheduling interleave** — mwcc fuses `(y>>0x1C)<<0x1C`→`and #0xf0000000` and schedules the `bic` early | permuter plateau **425** (~49k it) |

So across briefs 381+383: **2 functions permuted → 0 cracked (both plateaued);
4 clean-C forms tried → 0 matched.** None of the failing carves ship (they fail
`ninja sha1`); all reverted, EUR sha1 green.

## What this means (productive vs niche)

- **The pipeline works** (m2c vendored + producing correct drafts; permuter runs
  `-j` on WSL fork). The machinery is not the problem.
- **The target supply is the problem.** The catalogue's "commutative/peephole"
  TIER-1 labels — distilled from 363's 3-function pilot — do not reflect the
  actual shapes. The real functions carry reg-alloc/branch/scheduling components
  that put them in the permuter's *plateau* regime (358's evidence), not its
  *crack* regime.
- **Net: the permuter is a NICHE tool for this project, not a volume lane.** It
  cracks the rare genuinely-clean commutative/peephole wall (363 found 3, all
  shipped) but plateaus on the mislabeled bulk. The productive volume paths
  remain **`.s`** (reg-alloc tier — the scaffolder's lane, 48+ ships) and
  **clean-C** (the genuinely-clean funcs).

## Recommendation

1. **Do not invest more permuter effort against the catalogued "commutative/
   peephole" TIER-1** — it is mislabeled and plateau-prone. Three briefs (379/
   381/383) of permuter focus have produced 0 shipped recoveries.
2. **If the permuter is to be productive, the catalogue needs re-characterization**
   — enumerate functions whose *only* diff from a clean-C compile is a single
   commutative operand-order swap (what `asm_escape --c` is built to detect).
   That genuine subset is the permuter's wheelhouse; it appears small.
3. **m2c is independently useful** — it produced correct C drafts for every
   target (a strong comprehension/clean-C accelerator), even where the final
   codegen match was the hard part. Keep it vendored; pair it with clean-C
   reshape, not only the permuter.
4. **Volume comes from `.s` + clean-C.** The permuter stays available as a
   precision tool for the occasional confirmed pure-commutative wall.

## Housekeeping

Regenerated `docs/tools-index.md` (the brief-381 `m2c_bootstrap.py` add had left
it drifted; 83 tools now indexed).
