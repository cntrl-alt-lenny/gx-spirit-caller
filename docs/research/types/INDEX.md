[//]: # (markdownlint-disable MD013 MD041)

# Struct / Type Recovery Index

Auto-generated index of all recovered struct definitions in this directory.
Confidence ratings: **HIGH** = multiple independent sources agree;
**MED** = one confirmed source or two partial; **LOW** = assembly-only inference.

> Maintained at: `docs/research/types/INDEX.md`
> Branch: `kb/types-recovery`
> Do NOT regenerate the research index — the brain handles that at merge.

---

## Geometry / UI structs

| Struct | File | Confidence | sizeof | Purpose |
|--------|------|------------|--------|---------|
| `Rect` | [Rect.md](Rect.md) | **HIGH** | 0x06 | Screen bounding box (x/y u16, w/h u8); 5+ matched files in ov014/017/019 |
| `HitRect` | [HitRect.md](HitRect.md) | **HIGH** | 0x0C | Extends Rect + 4B pad + u16 attr; ov014 hit-testing |
| `Box` | [Box.md](Box.md) | **HIGH** | 0x0C | 6×u16 bounding box; ov017 geometry ops |

## Graphics / OAM structs

| Struct | File | Confidence | sizeof | Purpose |
|--------|------|------------|--------|---------|
| `Cell` | [Cell.md](Cell.md) | **HIGH** | 0x08 | OAM sprite cell (int attr + u16 flags + u16 pad); ov018 |
| `OamCtl` | [OamCtl.md](OamCtl.md) | **HIGH** | 0x02 | Single-bit render-enable flag cast onto OAM region at fixed offsets; ov018 |
| `BgCfg` | [BgCfg.md](BgCfg.md) | **HIGH** | 0x28 | NDS background-layer config (f0/f14/f18); ov018 + ov020; extended variant adds fc/f10 |

## Math structs

| Struct | File | Confidence | sizeof | Purpose |
|--------|------|------------|--------|---------|
| `Matrix3x4` | [Matrix3x4.md](Matrix3x4.md) | **HIGH** | 0x30 | 3×4 fixed-point transform matrix; all 12 elements confirmed in func_020115e0 |

## Data-structure structs

| Struct | File | Confidence | sizeof | Purpose |
|--------|------|------------|--------|---------|
| `LinkedListNode` | [LinkedListNode.md](LinkedListNode.md) | **HIGH** | 0x0C | Singly-linked list node (next+pad+key); doubly-linked and dispatch-node variants documented |
| `TaskList` | [TaskList.md](TaskList.md) | **HIGH** | 0x08 | Flat task list (count + void** tasks); func_0200b06c |

## Large game-state structs

| Struct | File | Confidence | sizeof | Purpose |
|--------|------|------------|--------|---------|
| `EntityStruct0x284` | [EntityStruct0x284.md](EntityStruct0x284.md) | **MED-HIGH** | 0x284 | Player/enemy entity; array-iterable with stride 0x284; sub-array of 0x58-byte sub-objects at +0x000 |
| `GameSingleton` | [GameSingleton.md](GameSingleton.md) | **MED-HIGH** | ≥ 0x484 | Main game/duel manager; returned by `func_020498f0()`; 50+ confirmed offsets; likely = Ov002 `self` |
| `BytecodeVMState` | [BytecodeVMState.md](BytecodeVMState.md) | **MED** | ≥ 0x19C | Embedded scripting VM state; register file at +0xAC (stride 0x2C); sub-region at +0x100 |
| `Ov002SelfContext` | [Ov002SelfContext.md](Ov002SelfContext.md) | **MED** | unknown (≥0x484) | The `self` arg in 1,206 ov002 source files = battle/duel state; field layout fragmentary |

## Global singleton structs

| Struct | File | Confidence | sizeof | Purpose |
|--------|------|------------|--------|---------|
| `GlobalAudioState` | [GlobalAudioState.md](GlobalAudioState.md) | **MED-HIGH** | ≥ 0xC4C | `data_021040ac` BSS; audio/scheduler state; fields confirmed 0x000–0xC48 across 4 files |
| `GlobalData02104bac` | [GlobalData02104bac.md](GlobalData02104bac.md) | **HIGH** | ≥ 0x56 | System flags: u16 at +0x54; 3 matched files |
| `GlobalData02104e6c` | [GlobalData02104e6c.md](GlobalData02104e6c.md) | **HIGH** | ≥ 0x08 | System page/channel selector: 3-bit `chan` at word+0x04; 6 matched files |
| `GlobalData02104f1c` | [GlobalData02104f1c.md](GlobalData02104f1c.md) | **MED-HIGH** | ≥ 0x20 | System params: f0/f4/f10/f14/f18/f1c; 3 files |
| `GlobalData02102c7c` | [GlobalData02102c7c.md](GlobalData02102c7c.md) | **MED-HIGH** | ≥ 0x3C | Bitfield state: 4-bit subfields at +0x24 and +0x38; 2 files |

## Array stride evidence (no field names yet)

| File | Description |
|------|-------------|
| [DataArrayStrides.md](DataArrayStrides.md) | Stride-analysis of symbols.txt: 11 candidate struct sizes (0x08–0x34), large BSS instances, and the 0x1800-byte 5-slot array |

---

## Priority for C-matching wave yield

Highest-leverage structs for unblocking MED-class candidates:

1. **`Ov002SelfContext` / `GameSingleton`** — used in 1,206 files; recovering
   the `count` field offset alone likely unlocks a large cluster
2. **`EntityStruct0x284`** — iteration-heavy struct; fixing sub-object layout
   at +0x000 (stride 0x58) unblocks loop-body matches
3. **`BytecodeVMState`** — register file at +0xAC (stride 0x2C); each
   register entry has 5 typed fields; fixing these unblocks all VM-dispatch
   candidates
4. **`GlobalAudioState`** — 4 matched files provide good coverage; recovering
   field names at 0xB84–0xC48 removes ad-hoc padding in audio functions
5. **`BgCfg`** — two layout variants (standard / extended); unifying them
   into one typedef with conditional fields removes copy-paste pad blocks

---

## Methodology note

Recovery sources (in priority order):
1. Already-matched C source files (`src/**/*.c`) — highest confidence
2. Assembly `.s` ships (`src/**/*.s`) — offset/width confirmed, type inferred
3. `config/*/symbols.txt` stride analysis — size constraints only, no names
4. `docs/research/c-match-prep/` m2c drafts — medium confidence (m2c's
   type inference sometimes wrong; cross-check against assembly)
