[//]: # (markdownlint-disable MD013 MD041)

# Brief 425 — region port, wave 2 (USA + JPN)

**Brief:** 425 (decomper). Continue the USA/JPN region-port lane (brief 421 scout
+ pilot, brief 423 scaled to 80). Same mechanism, tooling, and validation filters
as brief 423 — see [`brief-423-region-port-scale.md`](brief-423-region-port-scale.md)
for the full writeup of the lane, the two hazards, and the scout. Gate each region
on `ninja sha1` byte-identical; park the divergent residue.

## Result

- **50 USA `.c` ports** + **30 JPN `.c` ports** (80 this wave), each into
  `src/<region>/main/`, HIGH-confidence / byte-sim 1.000, gated byte-identical.
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`** (EUR unchanged).

## Method (unchanged from brief 423)

Reused the cached portability scan (EUR-source portability doesn't change between
waves; only "already ported" does, which the porter checks live on disk). Ran the
validated batch porter (`build/_region_port.py`) for each region — it ports
HIGH / byte-sim-1.000 candidates and rejects the two known hazards:

1. **sibling-resolution mismatch** (file named for one duplicate-shape twin, body
   defines another) — rejected if the port doesn't define its own namesake. USA 3,
   JPN 2 this wave.
2. **EUR SDK names absent from the region** (`Fill32`, `OS_RestoreIrq`) — rejected
   if a named extern is absent from the region `symbols.txt`. USA 24, JPN 23.

Both region delinks `sort_delinks.py`-canonicalised (1 inversion each — just this
wave's appends; the bulk canonicalisation happened in brief 423). A static
collision scan confirms **no multiply-defined symbols** in either region.

(Minor: the named-extern filter over-rejected 2 USA candidates whose `extern`
declaration's first token was a type keyword `void` — a harmless conservative
miss; the porter simply attempted 2 more candidates to reach 50. Worth refining
the regex to skip C type keywords next wave.)

## Running totals (region-port lane: briefs 421 + 423 + 425)

| Region | This wave | Lane total (421/423/425) | Byte-portable `.c` | Still available (unported) |
|--------|----------:|-------------------------:|-------------------:|---------------------------:|
| USA | 50 | 110 | 877 | 283 |
| JPN | 30 | 60 | 877 | 333 |

Still a deep multi-wave runway on `main` alone (minus the ~6% `Fill32` /
`OS_RestoreIrq` SDK-blocked residue), before overlays.

## Parked (unchanged from brief 423)

The `Fill32` / `OS_RestoreIrq` SDK-name referencers, the duplicate-shape sibling
mismatches, and brief 421's mapped divergent residue (`main` `-244`/0xf4 drift
band + overlay-swap group `{ov000, ov002, ov005, ov008}`).

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
