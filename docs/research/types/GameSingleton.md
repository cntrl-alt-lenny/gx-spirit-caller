[//]: # (markdownlint-disable MD013 MD041)

# GameSingleton

The main game-state singleton accessed via the getter `func_020498f0()`.
This is almost certainly the central game/duel manager — the `self` pointer
dominant in overlay002 functions (1,206 source files, 1,840 access lines).
Minimum size ≥ 0x484 bytes; likely larger (largest observed offset is 0x480).

## Confidence: MEDIUM-HIGH

Pure assembly inference from `func_0204d97c` and `func_020507b4`. Both reload
the singleton pointer from `func_020498f0()` and access 50+ distinct offsets.
Exact field types for dense-byte cluster (0x0D–0x1A) need C-match confirmation.

## C Definition (partial — gaps filled with `char` pad)

```c
typedef struct GameSingleton {
    /* +0x000  [unknown / possibly vtable or id] */
    int            f4;          /* +0x004 */
    /* +0x008..+0x00C  gap */
    unsigned char  fd;          /* +0x00D */
    /* +0x00E..+0x00F  gap */
    int            f10;         /* +0x010 */
    unsigned char  f14;         /* +0x014 */
    unsigned char  f15;         /* +0x015 */
    unsigned char  f16;         /* +0x016  (store) */
    unsigned char  f17;         /* +0x017 */
    /* +0x018..+0x01F  gap */
    int            f20;         /* +0x020 */
    int            f24;         /* +0x024 */
    /* +0x028..+0x0A3  gap */
    unsigned short fa4;         /* +0x0A4  (load/store) */
    /* +0x0A6..+0x0E3  gap */
    int            fe4;         /* +0x0E4 */
    int            fe8;         /* +0x0E8  (load/store) */
    int            fec;         /* +0x0EC */
    int            ff0;         /* +0x0F0 */
    int            ff4;         /* +0x0F4 */
    int            ff8;         /* +0x0F8 */
    /* +0x0FC..+0x183  gap */
    int            f184;        /* +0x184 */
    int            f188;        /* +0x188 */
    int            f18c;        /* +0x18C  (load/store) */
    int            f190;        /* +0x190  (load/store) */
    unsigned char  f194;        /* +0x194  (store) */
    /* +0x195  gap */
    unsigned short fa4_alias;   /* duplicate — see 0x0A4 note */
    int            f19c;        /* +0x19C  (load/store) */
    int            f1a0;        /* +0x1A0  (heavy use: load) */
    unsigned char  f1a4;        /* +0x1A4  (load/store) */
    unsigned char  f1a6;        /* +0x1A6 */
    unsigned char  f1a7;        /* +0x1A7  (load/store) */
    /* +0x1A8..+0x1A9  gap */
    unsigned char  f1aa;        /* +0x1AA  (load/store) */
    /* +0x1AB..+0x1AC  gap */
    unsigned char  f1ad;        /* +0x1AD  (load/store) */
    unsigned char  f1ae;        /* +0x1AE  (load/store) */
    /* +0x1AF..+0x1B7  gap */
    int            f1b8;        /* +0x1B8  (store) */
    int            f1bc;        /* +0x1BC */
    int            f1c0;        /* +0x1C0 */
    int            f1c4;        /* +0x1C4 */
    int            f1c8;        /* +0x1C8  (load/store) */
    int            f1cc;        /* +0x1CC */
    int            f1d0;        /* +0x1D0 */
    /* +0x1D4..+0x1DB  gap */
    int            f1dc;        /* +0x1DC  (load/store) */
    /* +0x1E0..+0x1EF  gap */
    int            f1f0;        /* +0x1F0 */
    int            f1f4;        /* +0x1F4 */
    int            f1f8;        /* +0x1F8  (load/store) */
    int            f1fc;        /* +0x1FC  (load/store) */
    int            f200;        /* +0x200 */
    int            f204;        /* +0x204 */
    int            f208;        /* +0x208  (load/store) */
    int            f20c;        /* +0x20C  (store) */
    /* +0x210..+0x2CF  gap */
    unsigned char  f2d0;        /* +0x2D0  (store) */
    /* +0x2D1..+0x3CB  gap */
    unsigned char  f3cc;        /* +0x3CC */
    unsigned char  f3cd;        /* +0x3CD  (load/store) */
    unsigned short f3ce;        /* +0x3CE  (load — sub-obj at +0x300?) */
    int            f3d0;        /* +0x3D0 */
    /* +0x3D4..+0x453  gap */
    int            f454;        /* +0x454 */
    int            f458;        /* +0x458 */
    int            f45c;        /* +0x45C */
    int            f460;        /* +0x460 */
    /* +0x464..+0x46B  gap */
    int            f46c;        /* +0x46C */
    int            f470;        /* +0x470 */
    /* +0x474..+0x47B  gap */
    int            f47c;        /* +0x47C */
    int            f480;        /* +0x480 */
} GameSingleton;               /* sizeof >= 0x484 */
```

## Layout evidence

| Offset range | Width | R/W | Confirmed by |
|--------------|-------|-----|--------------|
| 0x004 | s32 | load | func_0204d97c, func_020507b4 |
| 0x00D | u8  | load | func_0204d97c |
| 0x010 | s32 | load | func_020507b4 |
| 0x014–0x017 | u8×4 | r/w | func_020507b4 |
| 0x020, 0x024 | s32×2 | load | func_0204d97c |
| 0x0A4 | u16 | r/w | func_020507b4 |
| 0x0E4–0x0F8 | s32×6 | load | func_0204d97c, func_020507b4 |
| 0x184–0x1FC | mixed | r/w | func_0204d97c, func_020507b4 |
| 0x200–0x20C | s32×4 | r/w | func_020507b4 |
| 0x2D0 | u8  | store | func_020507b4 |
| 0x3CC–0x3D0 | u8+u16+s32 | r/w | func_0204d97c |
| 0x454–0x480 | s32×8 | load | func_0204d97c |

## Getter function

```c
GameSingleton *func_020498f0(void); /* returns the singleton pointer */
```

Both `func_0204d97c` and `func_020507b4` call this getter at the start of
each block; neither caches the pointer across calls.

## Using functions

- `func_0204d97c` — uses ~40+ offsets; heavy read of 0x1a0, 0xe8, 0xf4
- `func_020507b4` — uses ~35+ offsets; heavy write to 0x16, 0x194, 0x2d0
- `func_02056d1c` — uses offset 0x430 as `load/store` (via sl); also
  accesses 0x1ac–0x1c8 as 4 ptr/len pairs (see note on sub-struct F)

## Sub-struct at +0x300

Observed access `[base+0x3CE]` loaded as u16 combined with a +0x300 alias
suggests there is a 0xCE-word sub-object embedded at offset 0x300 within
GameSingleton. Needs further function analysis to characterize.

## Notes

The `f1a0` field is accessed most heavily (as a bare `load` with no offset
from the field itself), suggesting it is either a status register or a
frequently-polled game-phase counter. The dense byte cluster at 0x1A4–0x1AE
contains small flags/counters (turn counters, phase flags, life-point
deltas?) that are the most likely match-blockers for MED-class candidates.
