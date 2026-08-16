# Shape-rate reconciliation

Date: 2026-08-10. This report reconciles the bulk reference pass from `q-main-shape-reclassify` (PR #1486) with the deliberately selected 100-candidate pool from `cm-main-tier-sweep-3` (PR #1483).

## Result

Both rates are correct because they describe different populations:

| Measurement | Population | Bodies used | Disagreements | Rate |
|---|---:|---:|---:|---:|
| Bulk reclassification, as reported by #1486 | 1,247 live rows | 1,247 current `.s` bodies | 29 | **2.33%** |
| Sweep-3 exact dispatched pool, re-read here | 100 selected rows | 57 historical pre-conversion `.s` bodies + 43 current `.s` bodies | 11 | **11.00%** |
| Sweep-3 wider unattempted D-range, as reported by #1483 | 975 rows | 975 bodies at sweep-3 sampling time | 17 | **1.74%** |

The 2.33% figure is the broad live-body rate for the 1,640-row worklist snapshot. The 11.00% figure is the rate in sweep-3's filtered, quota-filled dispatch; its pool deliberately included all known disagreement candidates, so it was not a random estimate of the bulk population. The 1.74% figure is the wider unattempted-D-range baseline. None of these numbers should be substituted for another.

## Classifier correction addendum

The first version of this reconciliation used a live classifier bug: `branch_kind()` treated predicated `bic` instructions such as `bicne` as conditional branches. The corrected rule strips a trailing ARM condition code and then decides from the base mnemonic, so `bic`, `bics`, `bicne`, and `bicsne` remain data-processing operations while `bne`, `blne`, `blxeq`, and `bxne` remain branches.

On the current 1,640-row worklist, the before/after tool output is:

| Run | Rows | Live `.s` bodies | Disagreements among live bodies |
|---|---:|---:|---:|
| Before predicate fix | 1,640 | 1,108 | 28 / 1,108 = 2.53% |
| After predicate fix | 1,640 | 1,108 | 30 / 1,108 = 2.71% |

Exactly 2 of 1,640 rows changed derived label, both from `guard chain` to `other`: `0x02033864` and `0x0203671c`. That is 0.12% of all rows and a 0.18 percentage-point increase in the current live-body disagreement rate. `0x0209e628` is not a current `.s` row, so it changes the historical sweep-3 replay rather than this current-tree 1,640-row count.

## Same-population reconstruction

The exact sweep-3 population was reconstructed mechanically by address:

| Source | Rows | Body source |
|---|---:|---|
| Five sweep-3 batch commits (`4ee955643`, `20e52fae9`, `010616b65`, `8ba11fe4f`, `814e92b3c`) | 57 | `git show <commit>^:src/main/func_<address>.s` |
| `attempts.tsv` rows whose brief starts `cm-main-tier-sweep-3` | 43 | Current `src/main/func_<address>.s` |
| **Exact sweep-3 dispatched population** | **100** | **100 bodies; no denominator omission** |

The five shipped commits contribute 12, 9, 13, 13, and 10 function `.s` deletions respectively. The 43 parked rows' recorded derived-shape values agree with the re-read result for every row. The 57 shipped rows no longer have a live `.s` at the current tip, so their pre-conversion body was read from the parent of the shipping commit. This is the apples-to-apples comparison; classifying only the current tree would silently lose those 57 rows.

## Per-address disagreements in the exact 100

With the corrected predicate rule, these are the 12 rows where the preserved worklist label differs from the richer re-derived label. `historical` means the body was read from the parent of the listed ship commit; `current` means it remains an `.s` in the current tree.

| Address | Worklist label | Re-derived label | Body source | Mechanical evidence |
|---|---|---|---|---|
| `0x0207d914` | guard chain | other | historical: `20e52fae9^` | no qualifying 1–3-conditional guard-chain shape after the body scan |
| `0x020897fc` | guard chain | other | historical: `4ee955643^` | no qualifying 1–3-conditional guard-chain shape after the body scan |
| `0x02089938` | guard chain | other | historical: `010616b65^` | no qualifying 1–3-conditional guard-chain shape after the body scan |
| `0x0208cfa4` | small dispatcher | guard chain | current `.s` | conditional-branch ladder, no jump-table/PC dispatch and no backward edge |
| `0x0208d030` | small dispatcher | guard chain | current `.s` | conditional-branch ladder, no jump-table/PC dispatch and no backward edge |
| `0x0209e628` | small dispatcher | guard chain | historical: `010616b65^` | `bicne` is data-processing; the body has three real conditional exits, not four |
| `0x02090868` | guard chain | softfloat/CLZ | historical: `814e92b3c^` | body contains two `clz` instructions; this is the richer taxonomy's intentional split |
| `0x02096358` | small dispatcher | guard chain | historical: `814e92b3c^` | 1–3 conditional branches, with no dispatcher shape or backward edge |
| `0x020971b8` | small dispatcher | guard chain | historical: `4ee955643^` | 1–3 conditional branches, with no dispatcher shape or backward edge |
| `0x0209cc90` | small dispatcher | guard chain | current `.s` | 1–3 conditional branches, with no dispatcher shape or backward edge |
| `0x0209d018` | small dispatcher | guard chain | current `.s` | 1–3 conditional branches, with no dispatcher shape or backward edge |
| `0x020b007c` | small dispatcher | guard chain | current `.s` | 2–3 conditional branches; its IEEE-754 `frexp`-style arithmetic is semantically softfloat, but mechanically it is a guard chain |

The body evidence supports the re-derived control-flow labels for the three `guard chain → other` and eight `small dispatcher → guard chain` rows. `0x0209e628` is the implementation bug's canary: its historical body has only the three real conditional exits named in the sweep-3 brief once `bicne` is excluded from branch counting. `0x02090868` is a taxonomy difference: sweep-3's rule set had no separate CLZ bucket and could truthfully describe its two conditional exits as a guard chain, while the endgame reference taxonomy records the direct `clz` operations. `0x020b007c` is the converse warning: its bit-level floating-point idiom is semantically recognizable, but without a direct CLZ or helper call it remains mechanically `guard chain` under the classifier. The two taxonomies must not be treated as semantic and mechanical synonyms.

Sweep-3's published subtype table says 8 `small dispatcher → guard chain` and 4 `guard chain → other` including the separate canary, or 8 and 3 within the dispatched 100. This corrected reconciliation produces 8, 3, and 1 `guard chain → softfloat/CLZ` within the exact 100. The sweep-3 total remains 11 under its branch-only taxonomy; the richer endgame taxonomy reports 12 because it separately marks `0x02090868` as CLZ. The five batch commit messages did record named disagreement identities and derived-shape explanations for shipped rows, even though they did not normalize all 57 shipped candidates into `attempts.tsv`. In particular, `010616b65` names `0x0209e628` as a `DISAGREE` candidate; its historical body and the three real conditional exits adjudicate the shape here. The earlier claim that no per-candidate evidence existed for shipped rows was too strong.

The two named implementation adjudications are now explicit. `0x020b007c` is mechanically a guard chain but semantically an IEEE-754 `frexp`-style routine, so the branch-shape label is not a semantic family label. `0x0209e628` is a genuine classifier error: the source's `bicne` is a predicated data-processing instruction, and the corrected classifier returns `guard chain`, matching sweep-3's pull-time derivation rather than the old false `small dispatcher` result.

## The missing-body denominator check

The 1,640-row worklist used by #1486 had 393 rows without a current `.s` at that snapshot. Those 393 rows were emitted as `unclassified` and excluded from the 2.33% denominator: 29 / 1,247, not 29 / 1,640. They were therefore not silently counted as disagreements.

For sweep-3, the same 57 rows that are now missing were not excluded: their bodies were read from the parent commit that still contained the `.s`. The other 43 rows were read from their current `.s`. Thus sweep-3's denominator is 100 / 100 bodies, and the 393-row bulk omission and the 57 historical reads are different, explicit treatments of missing current files.

Since #1486, additional conversions have changed the live tree again; that moving state is not used to rewrite either published rate. The rates above are tied to their stated snapshots and populations.

## Scope statement

The bulk rate answers: “Among the 1,247 rows that still had a live `.s` in the #1486 worklist snapshot, how often did the stored label disagree with the mechanical reclassification?” Sweep-3 answers: “Among the 100 candidates deliberately selected and dispatched after forcing the known disagreement cases into the pool, how often did the stored label disagree?” Both are reproducible and both are useful, but only the first is a broad-population rate. Shape should remain a reference field, not a yield predictor, consistent with sweep-3's finding that per-shape yield did not carry over between rounds.
