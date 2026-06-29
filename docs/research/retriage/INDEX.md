[//]: # (markdownlint-disable MD013 MD041)

# Hard-Tier Re-triage Index

Re-assessment of the 2,188 E/F class `.s` functions that were originally
classified as "intractable" — before the struct/data/constants KB existed.
Now that the KB explains struct offsets and data table layouts, many of these
were re-examined to find newly plausible matches.

> Branch: `kb/retriage`
> Do NOT regenerate — the brain handles the index at merge.

---

## Files

| File | Module(s) | Newly tractable | KB gaps found |
|------|-----------|-----------------|--------------|
| [Ov002EFRetriage.md](Ov002EFRetriage.md) | ov002 (980 E/F) | ~18 definite + ~60 conditional | DSS+0xD2C/D30, data_022cb96c |
| [MainEFRetriage.md](MainEFRetriage.md) | main (755 E/F) | 8 definite + 2 conditional | data_02102c7c beyond 0x03B, data_02102958 |
| [OverlayEFRetriage.md](OverlayEFRetriage.md) | all other overlays (453 E/F) | 23 definite | ov006 stride constants, ov011 actor struct |

---

## Grand Total: Newly Tractable Funcs

| Tier | Count |
|------|-------|
| **Definite new tractable** (KB sufficient today) | **~49** |
| **Conditional** (requires filling 1–2 KB gaps) | **~62** |
| **Total new candidate pool** | **~111** |

These 111 funcs join the existing MED pool as additional campaign targets.
The "conditional" bucket unblocks as soon as `DuelStateSingleton.md` is
updated with the `+0xD2C` / `+0xD30` offsets and `data_ov002_022cb96c` is
catalogued.

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

## KB Gaps Discovered (action items)

These gaps, if filled, unlock the ~62 "conditional" funcs:

| Gap | Found in | Funcs unblocked |
|-----|---------|----------------|
| `DuelStateSingleton+0xD2C` (int index) | `func_ov002_022627ac` | ~10 DSS dispatch funcs |
| `DuelStateSingleton+0xD30` (int flag) | `func_ov002_022627ac` | same group |
| `DuelStateSingleton+0xD1C`, `+0xD28` | various ov002 E/F | ~20 more dispatch funcs |
| `data_ov002_022cb96c` (fn-ptr array, size unknown) | `func_ov002_022627ac` | ~5–10 |
| `data_ov002_022cdc78+0xC` (int counter) | `func_ov002_0225368c/e8` | already counted |
| `GlobalData02102c7c` beyond offset `+0x03B` | main E/F funcs at `+0x088–+0x0A8` | ~5 |
| `GameSingleton+0x348`, `+0x1A8`, `+0x464`, `+0x468` | main E/F | 2 |

---

## What This Means for the Campaign

The ~111 newly-tractable funcs come from the E/F tier that was previously
written off as a "scheduling wall." They are NOT easy:
- Many still require reg-reuse / decl-order levers (class C/D difficulty).
- The "conditional" group needs KB gap-filling first.

But they are **genuinely matchable in principle**, unlike the remaining ~2,000
E/F funcs (large bodies, recursive, float-CPSR, or multiple-blx) which stay `.s`.

**Recommended action:** Add DSS `+0xD2C`/`+0xD30` fields to
`DuelStateSingleton.md` and document `data_ov002_022cb96c` — this alone
unblocks ~60 conditional funcs.
