# Brief 632 - cmatch_loop drafter re-land

_Scaffolder measurement, 2026-07-20._

Re-landed the b626 compile-only m2c scaffold on top of current main after the
conflicting merge was reverted. The fixed 30-candidate probe increased MWCC
compile coverage from 4/30 to 17/30 and made one candidate a 100% fastmatch;
the exact measurements below keep the improvement separate from the later
human C-match step.

## Fixed probe

The probe is the b624-shaped set used by b626: 4 `ov001`, 9 `ov013`, 12
`ov022`, and 5 `ov007`, selected in delinks address order.

```text
func_ov001_021c9f24  func_ov001_021ca074  func_ov001_021ca144
func_ov001_021ca2d8
func_ov013_021c9d60  func_ov013_021c9d74  func_ov013_021ca024
func_ov013_021ca15c  func_ov013_021ca2b8  func_ov013_021ca42c
func_ov013_021ca70c  func_ov013_021ca7cc  func_ov013_021cb674
func_ov022_021aa4a0  func_ov022_021aa680  func_ov022_021aa6e0
func_ov022_021aa758  func_ov022_021aaa34  func_ov022_021aabe8
func_ov022_021aadf0  func_ov022_021ab330  func_ov022_021ab3f0
func_ov022_021ab5c8  func_ov022_021ab760  func_ov022_021ab804
func_ov007_021b22d8  func_ov007_021b25a0  func_ov007_021b2630
func_ov007_021b2694  func_ov007_021b28c4
```

## Measurement

Current `origin/main` already contains b620's narrow return-type placeholder
patch, so its honest re-land baseline is 4/30 compileable rather than the
older pre-b620 0/30 measurement in brief 626. The same source set, temporary
gaps, region, and serialized MWCC/fastmatch path were used in both runs.

| Metric | Current main | Scaffold re-land | Delta |
| --- | ---: | ---: | ---: |
| MWCC compileable | 4/30 (13.3%) | 17/30 (56.7%) | +13 candidates, +43.3 pp |
| Average, compileable drafts only | 2.655% | 16.011% | +13.356 pp |
| Average, fixed set (compile errors = 0) | 0.354% | 9.073% | +8.719 pp |
| 100% fastmatch accepts | 0 | 1 | +1 |

The fixed-set 100% candidate was `func_ov001_021ca2d8`. The 17 post-fix
scores were:

```text
func_ov001_021c9f24 1.19%    func_ov001_021ca074 3.70%
func_ov001_021ca144 2.97%    func_ov001_021ca2d8 100.00%
func_ov013_021ca15c 0.00%   func_ov022_021aa4a0 2.50%
func_ov022_021aa680 8.33%   func_ov022_021aa6e0 3.33%
func_ov022_021ab330 27.08%  func_ov022_021ab5c8 0.86%
func_ov022_021ab760 4.88%   func_ov022_021ab804 4.88%
func_ov007_021b22d8 23.28%  func_ov007_021b25a0 16.22%
func_ov007_021b2630 68.00%   func_ov007_021b2694 4.96%
func_ov007_021b28c4 0.00%
```

For comparison with brief 631's locked 12-candidate quality probe, the
same 12 functions average 13.868% here versus b631's 10.661% b626-scaffold
baseline, a +3.208-point lift. This is a secondary comparison; the primary
compile-rate gate is the fixed 30 above.

## Reconciliation

The b626 transformation is applied only to the compile probe copy. The raw
m2c skeleton remains in the dossier. It synthesizes a named `M2CUnknown`
aggregate for observed `unkNNN` members, converts unknown pointer-shaped
values, rewrites raw-address members, and turns address-taken unknown locals
into aggregate scaffolds. Existing `nitro/types.h` supplies the project's
primitive aliases; the scaffold does not redeclare them. Human source
overrides bypass this transformation.

`fastmatch.summarize_compile_error` now preserves all non-MoltenVK diagnostic
lines by default while retaining an explicit tail limit for callers that need
one. This keeps MWCC categories visible without changing the resolved byte
comparison.

The five-function cmatch canary remained 100% after the final changes. No
source, assembly, delinks, ROM, or gate inputs were changed.
