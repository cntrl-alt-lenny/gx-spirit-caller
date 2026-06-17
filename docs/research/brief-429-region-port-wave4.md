[//]: # (markdownlint-disable MD013 MD041)

# Brief 429 — region port, wave 4 (USA + JPN)

**Brief:** 429 (decomper). Wave 4 of the turnkey USA/JPN region-port lane (briefs
421 scout/pilot, 423 + 425 + 427 each 80). Mechanism, tooling, hazards, scout:
see [`brief-423-region-port-scale.md`](brief-423-region-port-scale.md).

## Result

- **49 USA + 30 JPN `.c` ports** (79 this wave — 1 USA candidate dropped on a
  compile error, see below), each into `src/<region>/main/`, HIGH-confidence /
  byte-sim 1.000, gated byte-identical.
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`** (EUR unchanged).

## Method (turnkey)

Reused the cached portability scan + validated batch porter
(`build/_region_port.py usa 50` / `jpn 30`). The porter's filters parked the usual
residue: `Fill32`/`OS_RestoreIrq` SDK-name refs (USA 28, JPN 24) and sibling
mismatches (USA 4, JPN 3) — no spurious `void` rejects (brief-427 type-keyword fix
holds). Both region delinks `sort_delinks.py`-canonicalised (1 inversion each).
Static collision scan: **no multiply-defined symbols** in either region.

Pre-pushed a proactive MD018 sweep of `docs/` (the repo markdownlint CI lints the
whole tree, so a stray `#`-started prose line anywhere fails the PR's Markdown
check — brief 427 fixed one). Tree is clean of the trap this wave.

**Third hazard class seen this wave (1 port, dropped):** `func_020821e0.c`
failed to *compile* — `port_to_region`'s rewrite redeclared the data symbol
`data_021a17d8` with two conflicting `struct` shapes and referenced a field not
in it. This is a bad-rewrite case the link-level filters (namesake / named-extern)
can't see; the 3-region gate catches it as a compile error. Rate ~1 in 210 ports
so far. Dropped and parked. (A per-port compile-check in the porter would catch it
pre-gate; for now the gate is the backstop.)

## Running totals (region-port lane: 421 + 423 + 425 + 427 + 429)

| Region | This wave | Lane total | Byte-portable `.c` | Still available (unported) |
|--------|----------:|-----------:|-------------------:|---------------------------:|
| USA | 49 | 209 | 877 | 184 |
| JPN | 30 | 120 | 877 | 273 |

Still multi-wave runway on `main` alone (minus the ~6% `Fill32`/`OS_RestoreIrq`
SDK-blocked residue), before overlays. USA is ~78% through its portable `.c`
lane; JPN ~69%.

## Parked (unchanged)

The `Fill32` / `OS_RestoreIrq` SDK-name referencers, duplicate-shape sibling
mismatches, and brief 421's divergent residue (`main` `-244`/0xf4 drift band +
overlay-swap group `{ov000, ov002, ov005, ov008}`).

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
