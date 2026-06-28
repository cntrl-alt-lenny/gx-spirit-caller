# Function Map — Index

## Coverage

| Module | Total funcs | Named | Matched(.c) | Ship(.s) | HIGH proposals | MED | LOW |
|--------|-------------|-------|-------------|----------|----------------|-----|-----|
| main_b | 364 | 3 | 175 | 186 | 121 | 79 | 2 |
| overlay002_a | 1881 | 0 | 516 | 1353 | 99 | 1782 | 12 |
| overlay004 | 301 | 1 | 99 | 201 | 85 | 197 | 18 |
| **TOTAL** | **2546** | **4** | **790** | **1740** | **305** | **2058** | **32** |

## Module summaries

**main_b** — The 0x0201xxxx block is the heart of the ARM9 main module, implementing the system-state singleton (`GetSystemWork`, a 0x92c-byte BSS struct), card-database accessors, a duel state machine dispatching on `state[0x920]`, a 3D/matrix subsystem (FX_Mul, sin/cos tables), a match record system with 10-case phase dispatch, NitroSDK NARC/NSBMD block parsing (BGDT/DJBO/PALT magic tags), and task-invocation machinery for duel animations.

**overlay002_a** — The battle engine lower half of ov002, spanning 0x021aa4a0–0x02228fff. Implements the full card-resolution and duel-state pipeline: per-player slot arrays indexed by `(player & 1) * 0x868`, event command queue (event 0x31 sub-codes 0–0xd), an LCG random number generator, 2-D node-table lookups, effect-node list walking, card ability resolution, and flag-bit management via `data_ov002_022cf288`. All 1,881 functions are currently unnamed; 516 have matched `.c` bodies.

**overlay004** — The Trade/Communication UI and wireless networking layer. An ARM cohort (0x021c9d60–0x021dba08) manages a card-trade state machine centred on `data_ov004_0220b500`, covering panel rendering, touch/button input, cursor management, NDS subscreen blending (BLDALPHA), and trade session lifecycle. A Thumb cohort (0x021dbc78–0x021de5fc) is a self-contained crypto/utility library: bswap, strlen, memcpy/memset, RC4 PRGA/KSA, CRC-32, authenticated encryption (RC4+CRC), and a wireless packet builder/dispatcher.

## Files in this directory

- INDEX.md — this file
- NAMES.md — flat name proposals table (all modules), 2383 total proposals
- main_b.md — main 0x0201xxxx (mid game logic, duel state machine, card DB, matrix)
- overlay002_a.md — ov002 battle engine lower half (0x021aa4a0–0x02228fff)
- overlay004.md — ov004 trade UI + wireless networking
- _names_main_b.md — raw name proposals for main_b (source for NAMES.md section)
- _names_overlay002_a.md — raw name proposals for overlay002_a
- _names_overlay004.md — raw name proposals for overlay004
