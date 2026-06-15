[//]: # (markdownlint-disable MD013 MD041)

# Brief 416 — ov002 `.s` wave 23: 67 ships, capability edge found at ~0x1040–0x109c

**Brief:** 416 (scaffolder). ov002 `.s` wave 23. Start with 8 wave-22 probe
leftovers; push past 0x90 and keep climbing size tiers until byte-identity
breaks; report the capability edge. Target ~12–20 ships.

## Headline — 67 ships, capability edge is intermediate pools (~0x1040–0x109c)

67 whole-function `.s` ships in a systematic size-tier ladder from 0x74 (wave-22
leftovers) through 0x1040 (the largest confirmed byte-identical func at 4160
bytes / 1040 words). **The capability edge is NOT a fixed size** — it's
**intermediate pool presence**: when mwcc inserts a mid-function literal pool
to keep LDR offsets within the ±4KB ARM range, the disassembler emits the pool
bytes as `....` (4 bytes each), which mwasmarm rejects as "Undefined macro or
opcode". Functions WITHOUT intermediate pools assemble byte-identically
regardless of size.

## Edge characterization

| size | example | result |
|------|---------|--------|
| 0x1040 (1040 words) | `func_ov002_022b9da4` | ✅ byte-identical |
| 0x109c (1060 words) | `func_ov002_021e797c` | ❌ `Undefined macro or opcode: ....` |
| 0x1294 (1189 words) | `func_ov002_02281d78` | ❌ same |
| 0x12b8 (1198 words) | `func_ov002_021b6600` | ❌ same |

There are no uncarved ov002 funcs between 0x1040 and 0x109c, so the exact byte
threshold is unknown but bounded. The root cause: mwcc inserts an intermediate
literal pool every time the function body exceeds ~4096 bytes of code since the
last pool (ARM LDR literal offset field = 12 bits = ±4096). Functions that fit
their entire pool at the end (or use backward `ldr r0, [pc, #-N]` reads off an
earlier pool segment) are detectable but unhandled by `emit_asm`.

**This sizes the pending scaffolder Thumb-emitter / multi-pool tooling brief**:
intermediate-pool support in `asm_escape` would unlock all the functions above
this edge (potentially hundreds of very large funcs across ov002 + other
overlays). The fix would need to: (a) detect `....` pool-word bytes in
`parse_objdump`; (b) emit them as `.word N` inline in the instruction stream at
the correct position; (c) handle backward pc-relative loads (`[pc, #-N]`) that
reference already-emitted pool words.

## Ships — size ladder

The wave swept from 0x74 (leftovers) up through 0x1040 systematically. All 67
byte-identical first attempt; all classify-data clean (0 REFUSE).

| tier | count | notable |
|------|-------|---------|
| 0x74–0x90 (wave-22 leftovers) | 8 | confirmed cleared |
| 0x94–0xa0 | 16 | 8×0x94 + 4×0x98 + 4×0xa0 |
| 0xa4–0xc0 | 20 | 4×0xa4 + 4×0xa8 + 2 each 0xac–0xc0 |
| 0xc4–0x1a0 | 10 | size probes: 0xc4/0xd0/0xe0/0xf0/0x100/0x120/0x140/0x160/0x180/0x1a0 |
| 0x1c0–0x1040 | 13 | 0x1c0/0x300/0x5f4/0x7f0/0x8ec/0xa00/0xaf4/0xc04/0xd04/0xdfc/0xe48/0xf64/0x1040 |

**Total this wave: 67.** Scaffolder `.s` total: **≈275** (was ≈208 post-wave-22).

## Pool state after wave 23

- **Upper half ≤0x6c**: unchanged, still ~107 uncarved (~13 waves at 8/wave)
- **0x70–0x1040 tier**: ladder probed; bulk picking continues — ~50 per tier
  at 0x94–0xc0 remain, hundreds above 0xc0 all the way to 0x1040
- **Blocked (intermediate pools)**: first instance at 0x109c; the `....`
  intermediate pool class is the new park verdict
- **0 kind:data REFUSEs** across all 67 picks

## Verification

| gate | result |
|---|---|
| `asm_escape --whole-function` | 67/67 byte-identical (first attempt) |
| EUR `ninja sha1` (per-batch + final) | **OK** |
| overlap audit | 0 overlaps across 1363 `.text` intervals (1285 → 1363 = +78 counting all carve ranges) |
| kind:data preflight | 0 REFUSE across all 67 |
| edge falsification | 5 funcs probed at 0x109c–0x1398 all fail with "Undefined macro or opcode: ...." |

🤖 Generated with [Claude Code](https://claude.com/claude-code)
