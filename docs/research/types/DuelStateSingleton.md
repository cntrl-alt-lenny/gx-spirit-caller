[//]: # (markdownlint-disable MD013 MD041)

# DuelStateSingleton (data_ov002_022d016c)

The primary duel-phase state singleton in overlay002. A large BSS global that
holds the current turn/phase index, guard flags, event tick counters, and
card-list indices for the ongoing duel. Accessed directly by most ov002 state
functions — NOT via a getter (unlike the main-arm9 GameSingleton).

## Confidence: MEDIUM-HIGH (≥12 independent matched C files, consistent offsets)

Base address: `0x022D016C` (ov002 BSS)

## C Definition (partial — layout confirmed to ≥ 0xD98 bytes)

```c
typedef struct DuelStateSingleton {
    /* +0x000 – +0xCE3  gap (card-list data region — large) */
    unsigned int   f_ce4;         /* +0xCE4  packed u16 pair (lo-half / hi-half) */
    /* +0xCE8 – +0xCEB  gap */
    int            f_cec;         /* +0xCEC  card-list slot index → data_ov002_022cd744[] lookup */
    /* +0xCF0 – +0xCF7  gap */
    int            f_cf8;         /* +0xCF8  DUEL PHASE: 0/1/2/3 (most-tested field) */
    /* +0xCFC – +0xD07  gap */
    int            f_d0c;         /* +0xD0C  gate flag (== 0 check blocks main loop) */
    /* +0xD10 – +0xD17  gap */
    void          (*f_d18)(void); /* +0xD18  state-machine dispatch fn ptr */
    /* +0xD1C – +0xD37  gap */
    int            f_d38;         /* +0xD38  compared to 6 (phase sub-state) */
    /* +0xD3C – +0xD47  gap */
    int            f_d48;         /* +0xD48  clearable counter/flag */
    int            f_d4c;         /* +0xD4C  guard flag (nonzero = skip) */
    int            f_d50;         /* +0xD50  guard flag (nonzero = skip) */
    /* +0xD54 – +0xD63  gap */
    int            f_d64;         /* +0xD64  assigned arg+0xd; compared to 0xb (mode code) */
    /* +0xD68 – +0xD93  gap */
    int            f_d94;         /* +0xD94  compared to arg (upper bound check) */
    /* struct continues beyond +0xD98 */
} DuelStateSingleton;

extern DuelStateSingleton data_ov002_022d016c;
```

## Layout evidence

| Offset | Type | R/W | Source files |
|--------|------|-----|--------------|
| +0xCE4 | `unsigned int` | read | `func_ov002_021e286c.c` — packed as lo/hi u16 halves |
| +0xCEC | `int` | read | `func_ov002_021e2b3c.c`, `021e2c5c.c` — index into `data_ov002_022cd744[]` |
| +0xCF8 | `int` | r/w | `func_ov002_021ff9a8.c` (`!= 3`), `022028ac.c` (`== 2`), `02287618.c` (`> 1`) |
| +0xD0C | `int` | read | `func_ov002_021e2b3c.c`, `021e2c5c.c` — gate (`== 0` ⇒ proceed) |
| +0xD18 | `fn ptr` | read | vtable dispatch in `func_ov002_021b08a8.s` — `blx r0` via `[r0, #0xd18]` |
| +0xD38 | `int` | read | `func_ov002_02266650.c` — `== 6` check |
| +0xD48 | `int` | r/w | `func_ov002_0225929c.c`, `022598d0.c`, `02259834.c` — clearable |
| +0xD4C | `int` | read | `func_ov002_0225929c.c` — nonzero guard |
| +0xD50 | `int` | read | `func_ov002_022593f4.c` — nonzero guard |
| +0xD64 | `int` | r/w | `022598d0.c`, `022593f4.c`, `02259834.c` — `arg + 0xd`; `== 0xb` |
| +0xD94 | `int` | read | `func_ov002_0226bad0.c` — upper-bound check against arg |

## The duel-phase field (+0xCF8)

The most frequently tested field in the entire singleton. Three independent
matched files confirm its semantics:

```c
/* func_ov002_021ff9a8.c */
if (data_ov002_022d016c.f_cf8 != 3) { ... }

/* func_ov002_022028ac.c */
if (data_ov002_022d016c.f_cf8 == 2) { ... }

/* func_ov002_02287618.c — unsigned comparison */
if ((unsigned int)data_ov002_022d016c.f_cf8 > 1) { ... }
```

The field is stored as `int` but read unsigned for the `> 1` check — mwcc
emits `movhi` for unsigned greater-than. The values 0–3 correspond to duel
phases (setup / main / resolution / cleanup or similar).

## State-machine dispatch (+0xD18)

The singleton holds a function pointer at offset +0xD18 used for per-state
dispatching, identical to the per-overlay pattern seen in the main arm9
(`data_021040ac+0xb6c`). Each duel phase installs a different handler here.

```s
; func_ov002_021b08a8.s
ldr r0, _LIT0              ; r0 = &data_ov002_022d016c
ldr r0, [r0, #0xd18]       ; r0 = d016c->f_d18  (fn ptr)
cmp r0, #0x0
beq .L_skip
blx r0
```

## Relationship to other ov002 globals

| Global | Role |
|--------|------|
| `data_ov002_022d016c` (this) | Duel-phase state + dispatch fn ptr |
| `data_ov002_022d008c` | Second large singleton with dispatch at +0xD1C |
| `data_ov002_022ce288` | Queue/event state, re-entrancy lock |
| `data_ov002_022cf16c` | Per-player row table (card counts, slot array) |

## Relationship to GameSingleton (main arm9)

`GameSingleton` (see `GameSingleton.md`) is returned by `func_020498f0()` and
lives in the main arm9 BSS — it is a **different object** from this one.
`data_ov002_022d016c` lives in the ov002 overlay BSS (0x022Dxxxx) and is
accessed directly without a getter.

## Using functions (sample)

- `func_ov002_021e286c` — reads +0xCE4 packed u16 pair
- `func_ov002_021e2b3c`, `021e2c5c` — reads +0xCEC (card-list index) and +0xD0C (gate)
- `func_ov002_021ff9a8`, `022028ac`, `02287618` — tests +0xCF8 (duel phase)
- `func_ov002_02266650` — tests +0xD38 against 6
- `func_ov002_0225929c`, `022598d0`, `02259834`, `022593f4` — reads +0xD48/D4C/D50/D64
- `func_ov002_0226b204` — uses +0xCEC as arg
- `func_ov002_0226bad0` — uses +0xD94 as bound
- `func_ov002_021b08a8` — dispatches via fn ptr at +0xD18
