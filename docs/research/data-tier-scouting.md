# Data-tier scouting — top candidates from `data_worklist.py`

_Generated 2026-04-23 by `cloud` after brain asked for a data-tier
first-carve draft. Paired with a new `libs/nitro/include/nitro/os.h`
shipping the OS-subsystem types these symbols most likely bind to._

**Run provenance**: `python tools/data_worklist.py --version eur`
against `config/eur` @ main `7da7f39`. 10,952 total data symbols,
0 matched, 2,021 in the worklist (≥1 reader).

## Why scout before matching

Data-tier matching is riskier than function-tier for cloud to
scaffold because:

1. **A wrong typedef breaks more than one function.** Naming
   `data_X` as `OSHeapInfo` and setting the wrong struct layout
   shifts every offset in every reader. Whereas naming a function
   wrong is localised.
2. **Data identity is often inferred from CONSUMERS, not shape.**
   A 4-byte `u32` datum can be a counter, a pointer, a flag, a
   mask. The reader code's usage pattern is the evidence. Decomper
   needs the reader disassembly; cloud has only the reference
   graph.
3. **Cross-module spread is diagnostic but not definitive.** 14
   modules touching `data_020b4728` strongly suggests an SDK
   fundamental, but WHICH fundamental requires inspection.

So this doc is scouting — narrowing the candidate space. The
decomper does the identification work at match time.

## Top candidates ranked by cross-module spread

| # | Module · Addr | Readers (distinct fns) | Modules | Reader module distribution |
|---|---|---:|---:|---|
| 1 | `main` `0x020b4728` | 27 | **14** | main=2, ov002=3, ov003=1, ov004=2, ov005=1, ov006=3, ov007=1, ov008=1, ov009=1, ov014=1, ov016=3, ov017=4, ov019=2, ov021=2 |
| 2 | `main` `0x020bef80` | 29 | 5 | main=8, ov000=6, ov002=8, ov004=3, ov011=4 |
| 3 | `main` `0x020c3e48` | 24 | 5 | ov002=2, **ov006=16**, ov007=2, ov009=2, ov021=2 |
| 4 | `main` `0x020b4768` | 13 | 5 | main=5, ov002=1, ov006=5, ov017=1, ov021=1 |
| 5 | `main` `0x0210249c` | 44 | 3 | **main=42**, ov010=1, ov015=1 |
| 6 | `dtcm` `0x027e0000` | 12 | 2 | itcm=2, main=10 |
| 7 | `dtcm` `0x027e05a0` | 3 | 2 | itcm=1, main=2 |

## Per-candidate hypotheses

### #1 — `data_020b4728` — the strongest SDK-fundamental signal

14 modules touch this datum, roughly evenly (1-4 readers per
module, never dominant in any). That's the shape of a
system-wide state singleton: a struct that gets poked from many
overlay init paths but nobody "owns" it exclusively.

**Likely candidates (ordered by plausibility)**:

1. **`OSi_IrqCallbackTable`** — NitroSDK's IRQ callback registration
   table (9 entries for the 9 ARM9 IE bits). Every overlay that
   hooks a VBlank / HBlank / timer interrupt registers here via
   `OS_SetIrqFunction`. Fits the "even spread across overlays"
   pattern well.

2. **`OSi_ArenaInfo`** / `OSi_CurArenaInfo` — the `OSArenaInfo`
   table (`void *lo[OS_ARENA_MAX]; void *hi[OS_ARENA_MAX];` — 72
   bytes). Every allocator call indirects through this.

3. **`OSi_MainHeap`** / `OSi_WramHeap` state — heap-handle
   anchors. Less likely because heap state in DS SDK tends to
   live in DTCM, not main code segment.

**Next step for decomper**: pick 2-3 reader functions (one per
representative overlay), disassemble, look for characteristic
patterns:
- `ldr rX, [dataaddr]; ldr rY, [rX, #0]; bl <callback>` → callback
  table
- `ldr rX, [dataaddr + OFFSET]; ...` with offsets matching
  `sizeof(void*) * N` → arena/heap table
- Mov-to-IRQ-enable-register usage → IRQ state

### #2 — `data_020bef80` — game-engine global, not SDK

Heavy main+ov000+ov002 readership. No overlay-wide spread. This
is a GAME global, not NitroSDK. Probably one of:

- `gGameState` / `gMainContext` — root pointer to the game's own
  scene/state hierarchy
- Duel-engine root struct (ov002 is duel logic — 8 readers is a
  lot)

**Skip for the SDK scouting angle**; this belongs to a game-side
naming pass.

### #3 — `data_020c3e48` — ov006-scoped

16 of 24 readers in ov006. Game-module-specific. Likely an ov006
mode state pointer / table. Same "skip for SDK scouting" category
as #2.

### #4 — `data_020b4768` — part of the same structure as #1

Sits **0x40 bytes** after `data_020b4728`. For a struct of size
≥0x40, this is the same struct accessed at a different offset.
Once #1 is identified, #4 falls out for free.

### #5 — `data_0210249c` — main-heavy, not cross-module

42/44 readers in main, plus one each from ov010 and ov015. This
is a main-only table (possibly a string pool or a local dispatch
table). SDK identity is unlikely.

### #6 — `dtcm 0x027e0000` — prime candidate for DTCM SDK state

First DTCM symbol. NitroSDK puts critical low-latency state in
DTCM: the IRQ handler's local state, the scheduler's ready queue,
the DMA bookkeeping. `itcm=2, main=10` is a small reader set but
DTCM-ITCM communication is the classic "critical-path bookkeeping"
shape.

**Likely candidates**:
1. `OSi_CurrentThread` / `OSi_ThreadQueueList` — scheduler state.
2. `OSi_DmaState[4]` — per-channel DMA state (4 channels × some
   per-channel record).
3. IRQ handler's local stack pointer area.

**Strong reason to pick this as the pilot**: DTCM symbols are
load-bearing for brief 015 — once one is named correctly, the
others follow.

### #7 — `dtcm 0x027e05a0` — secondary DTCM pick

Only 3 readers but all from itcm/main. Same DTCM scouting
territory as #6; probably falls out of the same investigation.

## Recommended first carve (pilot)

For brief 015-shaped work (first data match), pick either #1 or
#6. #1 has more consumer diversity (safer hypothesis-narrowing).
#6 is smaller-scope (DTCM is tighter than arbitrary main data).

Paired with this doc, `libs/nitro/include/nitro/os.h` now ships
with `OSArenaId` / `OSHeapHandle` / `OSTick` / `OSIrqMask` /
`OSLockWord` types. If candidate #1 binds to any of those, the
typedef is ready.

## Skip list (for this scouting pass)

- #2, #3, #5 — not SDK-shaped. Game globals; name them when the
  owning overlay's function surface is better understood.
- Anything in the next tranche below 10 cross-module readers —
  likely all game-local. Resume after the top-7 are identified.

## Process for any candidate

1. Decomper picks a candidate + the reader with the most
   distinctive usage (e.g. the one that loads an offset far into
   the struct, revealing its size).
2. Disassembly in objdiff / `find_callsites.py` surfaces the
   usage shape.
3. Grep NitroSDK (`/tmp/NitroSDK` if still cloned, else
   `https://github.com/ntrtwl/NitroSDK`) for structs of matching
   size + field patterns.
4. `tools/rename_symbol.py main 0x020b4728 <MatchedName>`.
5. Re-run `tools/data_worklist.py --version eur` — matched data
   drops out of the worklist automatically via
   `collect_matched_ranges`, so round 2 of scouting surfaces the
   next-highest candidates.

## Pairs with

- `tools/data_worklist.py` (#123) — the ranker this scouting
  doc reads from
- `libs/nitro/include/nitro/os.h` — new this session, provides
  OSArenaId / OSHeapHandle / OSTick / OSLockWord / OSIrqMask
- `libs/nitro/include/nitro/swi.h` — BIOS thunks (brief 011)
- `tools/nitro_dict.py` — NitroSDK function-signature dictionary
  for cross-reference when hypothesising
