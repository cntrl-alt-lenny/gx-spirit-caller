[//]: # (markdownlint-disable MD013 MD041)

# Duel State Enums

All enum-like integer sets confirmed from matched C source files and assembly,
covering the duel-phase state machine, per-overlay state machines, and
game-object classification enums.

---

## Duel phase (data_ov002_022d016c.f_cf8)

**Confidence: LOW on closure, MED on the individual observed values
(corrected 2026-08-04, `cm-f-cf8-reopen` — supersedes the 2026-08-03
"0-4" correction, which was the same class of error at one value
higher).** This is **not** a closed N-value enum. It is an **open
observed-value set**:

```
confirmed values include 0, 1, 2, 3, 4, 5 and 7;
complete range and semantic names are not yet established.
```

Do not write this as "a 5-value state machine," "a 0-4 range," or any
other phrasing that asserts closure. The 2026-08-03 correction upgraded
an assumed `0-3` to an assumed `0-4` by taking the highest value a
dossier search happened to turn up and declaring *that* the ceiling —
identical in kind to the original bug it was fixing, just one value
later. "Highest value seen" is not "upper bound."

**Producer sweep** (method: every `str` instruction targeting `+0xcf8`
in `src/overlay002/*.s` and `src/overlay002/*.c`, traced back to the
immediate that fed the stored register — EUR only; not yet repeated for
`src/usa/` or `src/jpn/`, whose per-region files are independently
addressed/renamed and were not re-traced this round):

| stored value | store sites found | example |
|---|---|---|
| 0 | 4 | `func_ov002_022b809c.s:139` |
| 1 | 1 | `func_ov002_021aec04.s:149` |
| 2 | 1 | `func_ov002_021aec04.s:157` |
| 3 | 2 | `func_ov002_021aec04.s:166`, `func_ov002_021cacf0.s:129` |
| 5 | 1 | `func_ov002_021aec04.s:176` |
| 7 | 3 | `func_ov002_021af5a0.s:229`, `func_ov002_021d109c.s:32`, `func_ov002_021ae7b8.s:60` |

**4 is not among them.** Every occurrence of `4` against this field is a
*consumer*-side comparison (`cmpeq r1, #0x4` in 4 independent dossiers —
a 4th, `02299c9c.md`, found beyond the 3 the item was originally filed
with); no `str` anywhere in the EUR `.s`/`.c` corpus assigns the literal
4 to this field. Kept in the observed-value set anyway, because 3 of
those 4 dossiers branch on `f_cf8 == 4` as a first-class success case
(a distinct output state, or an "either 2 or 4" gate, or a real
sub-state transition) rather than a defensive guard — real, live code
expects to reach that comparison and take the equal branch, which means
some producer sets it to 4 somewhere this sweep didn't reach.

**Producers and consumers disagree about which values matter, and that
disagreement is the actual finding here** — not just for `f_cf8` alone.
Two more producer channels make a *literal*-only sweep structurally
incomplete on its own, independent of how many files get checked:

- **Argument forwarding**: `func_ov002_021d1158.s:31` — `mov r4, r0`
  (the function's own incoming argument) `... str r4, [r0, #0xcf8]`.
  This site sets the field to *whatever the caller passes*, not a fixed
  literal — its contribution to the true value set depends on tracing
  `func_ov002_021d1158`'s own callers, which this sweep did not do.
- **Save/restore**: `func_ov002_021cacf0.s` reads the field's current
  value to a stack slot, temporarily forces it to `3`, does other work,
  then restores the saved value (`ldr r0, [sp, #0x4]; str r0, [r1,
  #0xcf8]`). That restore is not a new literal producer — it's whatever
  the field already held — and was initially misflagged as
  "unresolved" by the sweep script before manual inspection explained
  it; recorded here so a future automated version of this method
  doesn't double-count it as evidence of a distinct value.

**Minor open discrepancy, stated rather than silently resolved**: an
independent brain-side trace (also EUR, also literal-`str`-based)
reported 2 store sites for value 1 and 2 for value 7; this sweep found 1
and 3 respectively. Both sweeps agree exactly on the cited example sites
for 5 and 7 (same file, same line numbers), and agree that 4 is never a
literal producer. The count difference on 1 and 7 is unresolved — could
be a USA/JPN-only site neither sweep has separated out, or a
methodological difference in what counts as a "site" (e.g. a
conditional store counted once vs. twice). Not chased further this
round; flagged rather than picking one number and presenting it as
settled, which is exactly the failure mode this item exists to avoid.

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

1. **The duel phase field (`d016c.f_cf8`) is an open observed-value set
   — {0,1,2,3,4,5,7} confirmed so far, not a closed range** (see
   correction above). It is the most frequently tested enum in ov002.
   Any candidate that gates on duel phase needs a typedef matching the
   unsigned vs signed comparison shapes, and must not assume any
   particular value is the maximum: at least one live pattern
   (`== 2 || == 4`) treats 4 as a normal, reachable phase, not an error
   case, and there is no producer-side evidence yet closing off values
   above 7.

2. **Timer thresholds (0x3E8, 0x4B0)** almost always appear together in
   ov002 effect timer functions. If a candidate tests `x <= 0x3E8`, it
   probably also has a `x <= 0x4B0` branch below it.

3. **The 0x14 constant** (20) is anomalously frequent as a `MOV` immediate.
   This is used as a return value for VRAM bank selection AND as a loop
   bound — context disambiguates. Do not conflate the two.
