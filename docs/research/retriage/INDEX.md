[//]: # (markdownlint-disable MD013 MD041)

# Hard-Tier Re-triage Index

Re-assessment of the 2,188 E/F class `.s` functions that were originally
classified as "intractable" — before the struct/data/constants KB existed.
Now that the KB explains struct offsets and data table layouts, many of these
were re-examined to find newly plausible matches.

> Branch: `kb/retriage-round5`
> Do NOT regenerate — the brain handles the index at merge.

---

## Files

| File | Module(s) | Newly tractable | KB gaps found |
|------|-----------|-----------------|--------------|
| [Ov002EFRetriage.md](Ov002EFRetriage.md) | ov002 (980 E/F, 413 examined < 400 B) | **297** (72% of examined) | `id_lo13` bitfield=158, PPT=120, DQS=59, DSS=58 |
| [MainEFRetriage.md](MainEFRetriage.md) | main (755 E/F) | 8 definite + 2 conditional | data_02102c7c beyond 0x03B, GameSingleton +0x348/+0x464 |
| [OverlayEFRetriage.md](OverlayEFRetriage.md) | all other overlays (453 E/F) | **23** definite | ov006 stride constants, ov011 actor struct |
| [R5SupplementaryRetriage.md](R5SupplementaryRetriage.md) | main (2) + ov002 dispatch (3) | **5** (conditional → confirmed tractable) | — (gaps now closed) |
| [Ov002EFRetriagedLarge.md](Ov002EFRetriagedLarge.md) | ov002 (400–1200 B tier, 25 examined) | **TBD** (R5 agent result) | TBD |

---

## Grand Total: Newly Tractable Funcs

| Tier | Count | Notes |
|------|-------|-------|
| **ov002** (< 400 B, from R4) | **297** | 413 examined, 72% |
| **main** (R4 definite) | **8** | |
| **main** (R4 conditional → R5 confirmed) | **+2** | GS+0x348/464 gaps now filled |
| **Overlays** (R4 definite) | **23** | |
| **ov002 dispatch** (R5 conditional → confirmed) | **+3** | DSS D1C/D2C gaps now filled |
| **ov002** (400–1200 B, R5 large-tier) | **TBD** | agent result pending |
| **Running total (ex large-tier)** | **~335** | |

> **R4 total was ~330; R5 gap-fills confirmed 5 of the conditional pool.**
> Update this table after `Ov002EFRetriagedLarge.md` is reviewed.

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
- **2 conditionals** (GameSingleton gap fields at `+0x348`, `+0x1a8`, `+0x464`, `+0x468`).

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
| `GameSingleton+0x348`, `+0x1A8`, `+0x464`, `+0x468` | ✅ **FILLED (R5)** | GameSingleton.md | 2 main E/F funcs |
| `data_ov002_022cdc78+0xC` (int counter) | already counted | — | CardHandlerTable callers |
| `GlobalData02102c7c` beyond `+0x03B` | ⚠️ open | — | ~5 main E/F funcs |

---

## What This Means for the Campaign

R4 + R5 together have moved **~335 E/F funcs** from "intractable" to "candidate
pool" — plus whatever the R5 large-tier agent finds.

Key message:
- The conditional/gap bucket is now largely drained — most blocked funcs have
  their KB dependencies filled.
- The remaining E/F intractable tier is **genuinely hard**: multiple-blx
  callbacks, float CPSR, large loop bodies with real scheduling entropy.
- New tractable funcs are class C/D difficulty — they need reg-reuse and
  decl-order levers, but they **can** be matched in principle.

**Remaining open KB gap:** `GlobalData02102c7c` beyond +0x03B — fills ~5 more
main E/F funcs. Low priority vs the 335+ already identified.
