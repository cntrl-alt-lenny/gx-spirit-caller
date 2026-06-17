[//]: # (markdownlint-disable MD013 MD041)

# Brief 427 — region port, wave 3 (USA + JPN)

**Brief:** 427 (decomper). Continue the turnkey USA/JPN region-port lane (briefs
421 scout/pilot, 423 + 425 each 80). Mechanism, tooling, hazards, scout: see
[`brief-423-region-port-scale.md`](brief-423-region-port-scale.md).

## Result

- **50 USA + 30 JPN `.c` ports** (80 this wave), each into `src/<region>/main/`,
  HIGH-confidence / byte-sim 1.000, gated byte-identical.
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`** (EUR unchanged).

## Method (turnkey)

Reused the cached portability scan + validated batch porter
(`build/_region_port.py usa 50` / `jpn 30`). Both region delinks
`sort_delinks.py`-canonicalised (1 inversion each — this wave's appends). Static
collision scan: **no multiply-defined symbols** in either region.

**Porter fix this wave:** the named-extern undefined-symbol filter now skips C
type keywords (`void`, `int`, `struct`, …). Last wave it over-rejected 2 USA
candidates whose `extern` declared a function pointer (`extern void (*fp)(…)`),
mis-reading `void` as an undefined symbol. Fixed — this wave's rejects are purely
the real `Fill32` / `OS_RestoreIrq` SDK-name cases (USA 27, JPN 24) + sibling
mismatches (USA 3, JPN 3); no spurious `void`.

## Running totals (region-port lane: 421 + 423 + 425 + 427)

| Region | This wave | Lane total | Byte-portable `.c` | Still available (unported) |
|--------|----------:|-----------:|-------------------:|---------------------------:|
| USA | 50 | 160 | 877 | 233 |
| JPN | 30 | 90 | 877 | 303 |

Deep runway remains on `main` alone (minus the ~6% `Fill32`/`OS_RestoreIrq`
SDK-blocked residue), before overlays.

## Parked (unchanged)

The `Fill32` / `OS_RestoreIrq` SDK-name referencers, duplicate-shape sibling
mismatches, and brief 421's divergent residue (`main` `-244`/0xf4 drift band +
overlay-swap group `{ov000, ov002, ov005, ov008}`).

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
