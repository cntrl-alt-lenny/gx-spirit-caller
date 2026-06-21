# Brief 465 — Main No-Sibling Investigation Verdict

**Date:** 2026-06-21  
**Branch:** `decomper/main-nosibling-w1`  
**PR:** TBD

## Question

After b463 exhausted the mechanical region-port lane (0 new clean overlay ports;
20 main ports), main had 256 functions parked as "no-sibling" by
`find_region_siblings`. The brief asked: are any of those **recoverable** (USA/JPN
has the code but dsd never named the sibling), and does the answer keep
region-port alive as a lane?

## Methodology

For each of the 256 no-sibling EUR main `.c` files:

1. Check if USA has a **named function at the same address** (a case where
   `find_siblings` missed the match despite the function being in the symbol table).
2. If not named: byte-compare the EUR function bytes against USA binary at the same
   address (ARM 4-byte word windows, ignoring reloc offsets) — the "unnamed-but-present"
   test.

Note: EUR and USA main functions share the same base (`0x02000000`); the 859 already-ported
main functions all have shift=0 (verified from `config/usa/arm9/delinks.txt`). So
same-address byte comparison is the correct test.

## Results

| Category | Count | Meaning |
|---|---|---|
| Named at same addr (find_siblings miss) | 17 | USA symbol exists at same address, size differs |
| Unnamed-but-present (byte-match) | **0** | |
| Divergent (bytes differ) | **239** | Real per-region differences |
| Out of range | 0 | All addrs fit in both binaries |

### The 17 "named at same addr" cases

`find_siblings` did not return HIGH confidence because the sizes differ between EUR and
USA (different code at that address). Byte-comparison confirms: **16/17 are non-identical**.

The one exception is `func_02000c44` (EUR sz=8, USA sz=8, no relocs, bytes identical — a trivial
`return 1` stub). `find_siblings` missed it because with `reloc_sig=()` and size=8 there are
many matching candidates; ambiguity prevents HIGH confidence. **Ported in this brief.**

## Verdict

**Recoverable count: 1** (the `func_02000c44` stub).

The remaining 255 are genuinely divergent — different code between EUR and USA/JPN at
those addresses. There are no "dsd-unnamed-but-present" functions to recover; the byte
scan found zero unnamed matches.

**Conclusion: the main no-sibling lane is exhausted. Pivot to EUR clean-C RE next round.**

## Deliverables

1. **1 port**: `func_02000c44` (EUR `return 1` stub) → USA + JPN  
   (`src/usa/main/func_02000c44.c`, `src/jpn/main/func_02000c44.c`, delinks updated)

2. **2 pre-existing extern-decl bugs fixed** (b459 hidden defect, exposed by fresh build):
   - `src/usa/overlay010/ov010_core.h` + `src/jpn/overlay010/ov010_core.h`:
     added `extern char data_ov010_021b9790[]` and `extern char data_ov010_021b9160[]`
   - Both symbols are defined in the USA/JPN ov010 BSS `.s` file; the region `.c` files
     reference them without a declaration in the core header. EUR build doesn't compile
     these region-only files, so EUR sha1 was always passing while USA/JPN would fail on
     a fresh build (the b459 gate succeeded only due to stale `.o` artifacts).

3. **3-region `ninja sha1` gate**: EUR ✓, USA ✓, JPN ✓

## Lane Status After b465

| Lane | Status |
|---|---|
| ARM overlay ports (all 22 overlays) | **TAPPED** (b463: 0 new) |
| Thumb overlay ports (ov004 only overlay) | **TAPPED** (b461: 33+33 drained) |
| Main ports — clean siblings | **TAPPED** (b463+b465: last 1 ported) |
| Main no-sibling — recoverable | **TAPPED** (b465: 1 recovered, 255 divergent) |
| Main no-sibling — divergent | Per-region RE required |

**Next briefs should focus on EUR clean-C RE** (new EUR `.c` files from
scaffolder/decomper work that will unlock fresh USA/JPN ports later).
