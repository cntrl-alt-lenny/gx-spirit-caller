[//]: # (markdownlint-disable MD013 MD041)

# Hard-Tier Re-triage Index

Re-assessment of the 2,188 E/F class `.s` functions that were originally
classified as "intractable" — before the struct/data/constants KB existed.
Now that the KB explains struct offsets and data table layouts, many of these
were re-examined to find newly plausible matches.

> Branch: `kb/retriage-extend` (R6 extension — 16 new overlays, 53 newly tractable)
> Do NOT regenerate — the brain handles the index at merge.

---

## Files

| File | Module(s) | Newly tractable | KB gaps found |
|------|-----------|-----------------|--------------|
| [Ov002EFRetriage.md](Ov002EFRetriage.md) | ov002 (980 E/F, 413 examined < 400 B) | **297** (72% of examined) | `id_lo13` bitfield=158, PPT=120, DQS=59, DSS=58 |
| [MainEFRetriage.md](MainEFRetriage.md) | main (755 E/F) | 8 definite + 2 conditional | data_02102c7c beyond 0x03B, GameSingleton +0x348/+0x464 |
| [OverlayEFRetriage.md](OverlayEFRetriage.md) | all other overlays (453 E/F) | **23** definite | ov006 stride constants, ov011 actor struct |
| [R5SupplementaryRetriage.md](R5SupplementaryRetriage.md) | main (2) + ov002 dispatch (3) | **5** (conditional → confirmed tractable) | — (gaps now closed) |
| [Ov002EFRetriagedLarge.md](Ov002EFRetriagedLarge.md) | ov002 (400–1200 B tier, 25 examined) | **25** (100% of examined) | DSS+0xD84/D6C/D58/D98 gap fields (init-only, tractable without names) |
| [Ov008Ov010Retriage.md](Ov008Ov010Retriage.md) | ov008 (35 E/F), ov010 (24 E/F) | **9** | ov008 slot-array, ov010 VRAM-bank tables (→ OverlayDataGlobs.md) |
| [SmallOverlaysRetriage.md](SmallOverlaysRetriage.md) | ov003/005/009/012/014 (112 total .s, all examined) | **10** | dispatch-table-advance pattern; sub-display MMIO clear pattern |
| [Ov016Ov020Ov015Retriage.md](Ov016Ov020Ov015Retriage.md) | ov016 (44), ov020 (33), ov015 (32) — 56 examined | **13** | new data globals in OverlayDataGlobs.md |
| [Ov004Ov006Deep.md](Ov004Ov006Deep.md) | ov004 (20 new files), ov006 (24 new files) | **15** | 3 new ov006 globals; smull ÷10 pattern |

---

## Grand Total: Newly Tractable Funcs

| Tier | Count | Notes |
|------|-------|-------|
| **ov002** (< 400 B, from R4) | **297** | 413 examined, 72% |
| **main** (R4 definite) | **8** | |
| **main** (R4 conditional → R5 confirmed) | **+2** | GS+0x348/464 gaps now filled |
| **Overlays** (R4 definite) | **23** | |
| **ov002 dispatch** (R5 conditional → confirmed) | **+3** | DSS D1C/D2C gaps now filled |
| **main** (R5: GS+0x464 also unblocks `0204c120` + `02050054`) | **+2** | same gap as R5 supplementary; 4 main total |
| **ov002** (400–1200 B, R5 large-tier) | **+25** | 25/25 (100%); agent result |
| **R6: ov008 + ov010** | **+9** | Ov008Ov010Retriage.md |
| **R6: ov003/005/009/012/014 (small)** | **+10** | SmallOverlaysRetriage.md |
| **R6: ov016 + ov020 + ov015** | **+13** | Ov016Ov020Ov015Retriage.md |
| **R6: ov004 deep + ov006 deep** | **+15** | Ov004Ov006Deep.md |
| **R6: main E/F unblocked by GlobalData02102c7c extension** | **+6** | GlobalData02102c7c.md (+0x03B→+0x0B4) |
| **Grand total** | **~415** | R4 ~330 + R5 +32 + R6 +53 |

> **R6 count: +53 newly tractable (47 from retriage docs + 6 main unblocked by KB extension).**
> Running total: **~415** confirmed tractable funcs across R4 + R5 + R6.
> 16 overlays examined for the first time in R6; ov004/ov006 got a deep second pass.

> **Final R5 count: 362 funcs confirmed tractable across R4 + R5.**
> The large-tier 400–1200 B band ran 100% tractable (25/25) — even higher than
> the <400 B tier's 72% — because larger functions have more struct anchors per
> instruction, making classification unambiguous.

---

## Key Findings by Module

### ov002 (see [Ov002EFRetriage.md](Ov002EFRetriage.md))

- **747 of 980** E/F funcs access ≥1 known struct (DSS / PPT / DQS / tables).
- The original "scheduling coin-flip" label was often a misdiagnosis: funcs with
  `ldr r?, =0x022d016c` + documented offset had *no* scheduling ambiguity —
  the offset was simply unknown, not unresolvable.
- **CardHandlerTable dispatch** (2 funcs, 92–96 B): fully tractable today.
- **DSS fn-ptr dispatch via `f_d2c`** (~10 funcs): tractable once two new DSS
  fields (+0xD2C/+0xD30) are added to `DuelStateSingleton.md`.
- **PerPlayerRowTable PPT-A scans** (~30–40 funcs, < 250 B, single blx):
  tractable with `Ov002Slot.id_lo13 : 13` bitfield shape and documented stride.
- **~900 ov002 E/F funcs remain intractable**: nested loops + multiple blx
  callbacks where the scheduling coin-flip is genuine, not a KB gap.

### main (see [MainEFRetriage.md](MainEFRetriage.md))

- **2 vtable-slot dispatch funcs** (28 B each, `func_020a71e4/720a724c`):
  now tractable — `data_02102958` is a matched C file.
- **3 SDK FX math funcs** (`020b1e4c`, `020b1e0c`, `020b319c`): NitroSDK
  `FX32_Normalize` / float-round patterns; deterministic mwcc output.
- **3 GlobalAudioState accessor funcs**: unlocked by documented `GlobalAudioState.f3c`
  offset and audio array stride.
- **4 conditionals → tractable (R5)**: `func_0204bf44`, `func_0204ca70` (R5 supplementary doc),
  `func_0204c120`, `func_02050054` (same GS+0x464/0x468 gap, now filled).

### R6 Overlays (see retriage docs above)

- **ov004 wins (6 new, beyond R4's 4):** VRAM-clear/palette-DMA split-at-0xd0 pair, toast dispatcher, 9-case tear-down/reconnect, panel-open/close wrappers.
- **ov006 wins (9 new, beyond R4's 8):** 5th and 6th init-family members, stride-copy variant, 4-way seed+loop, Fill/Copy 5-way dispatch pair, trivial count accessor, state setter.
- **ov008 wins (5):** dispatch driver, full-init VRAM, sprite draw, sub-display MMIO, slot-clear.
- **ov010 wins (4):** 3-path boolean switch, 3-way rect setter, 8-way VRAM bank-base + bank-size dispatch pair.
- **ov016 wins (5):** OV006-pattern full-init, state dispatcher, touch hit-test pair, dual-task-creation.
- **ov020 wins (4):** OBJ tilemap init, OBJ tile fill pair, SE dispatch.
- **ov015 wins (4):** predicate, coord layout setter, tilemap writer, sprite factory.
- **Small overlays (10):** ov003 no-op stubs (2), ov005 BG-scroll MMIO + dispatch-advance, ov009 MMIO-clear + hit-test + dispatch-advance, ov012 tile-mode lookup, ov014 bitfield-packer + MMIO-clear.
- **Recurring patterns found:** dispatch-table-advance (ov005/ov009), sub-display MMIO clear (ov009/ov014), OV006-pattern VRAM full-init (ov016/ov020), smull ÷10 magic constant (ov006).

### Overlays (see [OverlayEFRetriage.md](OverlayEFRetriage.md))

- **ov006 wins (8):** `OV006_STRIDE_SLOT_COUNT=5` / `OV006_STRIDE_COL_COUNT=7`
  constants unlock 4 stride-init family funcs; VRAM full-init + stride bitmask
  pattern add 4 more.
- **ov011 wins (4):** Actor-slot `lsl #0x17 / lsr #0x1c` 4-bit extract + tile
  dispatch table.
- **ov000 wins (4):** `0x40000000` deferred-task bit + smull magic constants.
- **ov004 wins (4):** Post-BLX register rotation confirmed tractable once the
  indirect call chain resolves to `data_ov004_` rodata constants.
- **ov013 (2)** + **ov021 (1)**: BLDALPHA layout / sparse-LUT scan.

---

## KB Gaps: Status After R5

| Gap | Status | Doc updated | Funcs unblocked |
|-----|--------|-------------|-----------------|
| `DuelStateSingleton+0xD1C/D20/D24/D28` | ✅ **FILLED (R5)** | DuelStateSingleton.md | ~20 dispatch funcs |
| `DuelStateSingleton+0xD2C/D30/D34` | ✅ **FILLED (R5)** | DuelStateSingleton.md | ~10 dispatch funcs |
| `DuelStateSingleton+0xD44/D54/D9C` | ✅ **FILLED (R5)** | DuelStateSingleton.md | supporting fields |
| `data_ov002_022cb96c` (fn-ptr table) | ✅ **DOCUMENTED (R5)** | FunctionPointerTables.md §9 | dispatch callers |
| `data_ov002_022ca998` (fn-ptr table) | ✅ **DOCUMENTED (R5)** | FunctionPointerTables.md §8 | dispatch callers |
| `GameSingleton+0x348`, `+0x1A8`, `+0x464`, `+0x468` | ✅ **FILLED (R5)** | GameSingleton.md | 4 main E/F funcs (`0204bf44`, `0204ca70`, `0204c120`, `02050054`) |
| `data_ov002_022cdc78+0xC` (int counter) | already counted | — | CardHandlerTable callers |
| `GlobalData02102c7c` beyond `+0x03B` | ✅ **FILLED (R6)** | GlobalData02102c7c.md (+0x03C→+0x0B4, ptr table + task handle) | 6 main E/F funcs |
| `data_ov008_021b2780` (entry pool), `021b2c80` (control hdr) | ✅ **DOCUMENTED (R6)** | OverlayDataGlobs.md | ov008 slot-clear + sprite funcs |
| `data_ov010_021b9260` (card-list singleton, 12 fields) | ✅ **DOCUMENTED (R6)** | OverlayDataGlobs.md | ov010 VRAM-bank dispatch pair |
| `data_ov016_021b8f80` (fn-ptr dispatch table, 32 slots) | ✅ **DOCUMENTED (R6)** | OverlayDataGlobs.md | ov016 state dispatcher |
| smull reciprocals 0x1b4e81b5 (÷150), 0x55555556 (÷3) | ✅ **DOCUMENTED (R6)** | OverlayConstantsExtended.md | ov008, ov016 magic-divide funcs |

---

## What This Means for the Campaign

R4 + R5 together have moved **~362 E/F funcs** from "intractable" to "candidate
pool" — the large-tier result (25/25 = 100%) pushed the final count well past
the R4 estimate.

Key message:
- The conditional/gap bucket is now largely drained — most blocked funcs have
  their KB dependencies filled.
- The remaining E/F intractable tier is **genuinely hard**: multiple-blx
  callbacks, float CPSR, large loop bodies with real scheduling entropy.
- New tractable funcs are class C/D difficulty — they need reg-reuse and
  decl-order levers, but they **can** be matched in principle.

**All tracked KB gaps now filled.** `GlobalData02102c7c` beyond +0x03B is
documented in `GlobalData02102c7c.md` (+0x088..+0x0B4, switch-pointer table,
task handle), unblocking ~5 main E/F funcs. Overlay globals and constants for
ov008/ov010/ov016 are documented in `docs/research/data/OverlayDataGlobs.md`
and `docs/research/constants/OverlayConstantsExtended.md`.

**New gap (low-priority):** DSS+0xD84/+0xD6C/+0xD58/+0xD98 — observed in R5
large-tier init funcs; the funcs are tractable without the field names (pure
write sequence, no scheduling), but naming them would improve KB completeness.
