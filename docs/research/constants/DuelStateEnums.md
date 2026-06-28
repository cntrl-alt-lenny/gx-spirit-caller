[//]: # (markdownlint-disable MD013 MD041)

# Duel State Enums

All enum-like integer sets confirmed from matched C source files and assembly,
covering the duel-phase state machine, per-overlay state machines, and
game-object classification enums.

---

## Duel phase (data_ov002_022d016c.f_cf8)

A 4-value state machine stored at `data_ov002_022d016c + 0xCF8`. Three
independent matched files confirm values 1–3; value 0 is implied as the initial
state.

```c
typedef enum DuelPhase {
    DUEL_PHASE_INIT      = 0,   /* initial / not yet started */
    DUEL_PHASE_MAIN      = 1,   /* main duel phase */
    DUEL_PHASE_RESOLVE   = 2,   /* effect resolution */
    DUEL_PHASE_END       = 3,   /* end phase / cleanup */
} DuelPhase;
```

Comparisons found:
- `f_cf8 != 3` — skip if in end-phase
- `f_cf8 == 2` — proceed only during resolution
- `(unsigned)f_cf8 > 1` — in main or resolution phase

---

## Per-overlay 4-state sub-machine (universal pattern)

Appears in ov006, ov021, and implied in many others. Each overlay's own
task/effect has a sub-state cycle:

```c
typedef enum ObjState {
    OBJ_STATE_WAIT  = 0,   /* waiting for trigger */
    OBJ_STATE_INTRO = 1,   /* playing intro animation */
    OBJ_STATE_LOOP  = 2,   /* main loop / idle */
    OBJ_STATE_DONE  = 3,   /* finished */
} ObjState;
```

Confirmed in `func_ov021_021ab090.c` and `func_ov006_021b6ca0.c`.

---

## Gauge kind enum (ov018)

A sparse 3-value set used in `func_ov018_021aaaf0`, `func_ov018_021aabd8`:

```c
typedef enum GaugeKind {
    GAUGE_KIND_A = 12,   /* 0x0C */
    GAUGE_KIND_C = 14,   /* 0x0E */
    GAUGE_KIND_D = 15,   /* 0x0F */
} GaugeKind;
/* value 13 is absent — gap in the enum */
```

---

## NDS VRAM bank selector (0–9)

Used in `func_0201d530`, `func_0201d4b4`, `Ov015_SelectVramBank`,
`Ov015_SelectVramBankSub`. An 8-way or 10-way switch dispatching to VRAM
bank helpers per engine (main vs sub):

```c
typedef enum VramBank {
    VRAM_BANK_A = 0,
    VRAM_BANK_B = 1,
    VRAM_BANK_C = 2,
    VRAM_BANK_D = 3,
    VRAM_BANK_E = 4,    /* case 4 returns address 0x6400000 in func_0201d530 */
    VRAM_BANK_F = 5,
    VRAM_BANK_G = 6,
    VRAM_BANK_H = 7,
    VRAM_BANK_I = 8,
    VRAM_BANK_J = 9,    /* case 9 returns address 0x6600000 */
} VramBank;
```

---

## Slot-to-cell LUT (ov013)

A fixed 8-entry hardware mapping in `Ov013_SlotToCell.c`:

```c
/* input: slot 0–7; output: cell number */
static const int slot_to_cell[8] = {
    8,    /* slot 0 */
    4,    /* slot 1 */
    3,    /* slot 2 */
    5,    /* slot 3 */
    6,    /* slot 4 */
    0x46, /* slot 5 = 70 (outlier: different OBJ attribute tier) */
    9,    /* slot 6 */
    10,   /* slot 7 */
};
```

---

## Timer / distance thresholds (recurring constants in ov002)

These appear as comparison targets in ov002 C-39-family effect functions:

| Value | Hex | Context |
|-------|-----|---------|
| 1000 | 0x3E8 | `v <= 0x3E8` timer check (51 assembly CMP hits) |
| 1200 | 0x4B0 | Second timer threshold in same family |
| 3000 | 0xBB8 | Timer cap in `func_ov002_02201e74` |
| 5312 | 0x14C0 | Position sentinel: `self->f0 == 0x14C0` |
| 4000 | 0xFA0 | Common loop counter (45 assembly CMP hits) |

---

## Game-loop / mode constants

| Value | Hex | Meaning |
|-------|-----|---------|
| 11 | 0x0B | Mode code 11 — checked against `d016c.f_d64`; also MOV r., #0xb (925 hits) |
| 20 | 0x14 | MOV r., #0x14 — 6th most common MOV constant (1,689 hits); returned by `func_0202de9c` for VRAM bank selection; also a loop/table bound |
| 30 | 0x1E | Sum-of-three-coordinates sentinel → callback trigger in `func_0201c64c` |
| 22 / 23 | 0x16 / 0x17 | Loop skip indices (reserved table entries) in `func_0201c560` |
| 99 | 0x63 | Loop bail-out `i >= 99` in `func_020117ac` |
| 106 | 0x6A | Event code 0x6A — dispatched in ov011, tested via `func_02013a64` |

---

## State-pair handshake values

The two-value handshake used at `data_ov002_022ce288 + 0x5A8`:

```c
#define QUEUE_STATE_DONE   0x7F   /* 127: idle / done */
#define QUEUE_STATE_ACTIVE 0x80   /* 128: action in progress */
```

---

## Card ID sentinel value

```c
#define CARD_ID_NONE   0xFFFF   /* u16 sentinel: "no card" */
/* also: -1 as s16, checked after table lookup with != -1 guard */
```

Appears as a return-value sentinel from 0x1FF-family saturation functions
and as a "slot is empty" marker in card arrays.

---

## Notes for C-matching

1. **The duel phase enum (0–3)** at `d016c.f_cf8` is the most frequently
   tested enum in ov002. Any MED candidate that gates on duel phase needs
   this typedef to match the unsigned vs signed comparison shapes.

2. **Timer thresholds (0x3E8, 0x4B0)** almost always appear together in
   ov002 effect timer functions. If a candidate tests `x <= 0x3E8`, it
   probably also has a `x <= 0x4B0` branch below it.

3. **The 0x14 constant** (20) is anomalously frequent as a `MOV` immediate.
   This is used as a return value for VRAM bank selection AND as a loop
   bound — context disambiguates. Do not conflate the two.
