[//]: # (markdownlint-disable MD013 MD041)

# DuelStateSingleton (data_ov002_022d016c)

The primary duel-phase state singleton in overlay002. A large BSS global that
holds the current turn/phase index, guard flags, event tick counters, and
card-list indices for the ongoing duel. Accessed directly by most ov002 state
functions — NOT via a getter (unlike the main-arm9 GameSingleton).

## Confidence: MEDIUM-HIGH (≥12 independent matched C files, consistent offsets)

Base address: `0x022D016C` (ov002 BSS)

## C Definition (partial — layout confirmed to ≥ 0xDA0 bytes)

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
    void          (*f_d18)(void); /* +0xD18  state-machine dispatch fn ptr (directly installed) */
    int            f_d1c;         /* +0xD1C  dispatch-table-2 index → data_022ca998[f_d1c] handler */
    int            f_d20;         /* +0xD20  sub-state switch index (0–8 in inner machine, 0–0x1E in outer); reset to 0 when f_d1c advances */
    int            f_d24;         /* +0xD24  secondary sub-state counter */
    int            f_d28;         /* +0xD28  slot-iteration counter (0–10; drives 10-slot loop) */
    int            f_d2c;         /* +0xD2C  dispatch-table-3 index → data_022cb96c[f_d2c]; init=6, max checked=9 */
    int            f_d30;         /* +0xD30  dispatch active flag (1=new phase started, 0=complete) */
    int            f_d34;         /* +0xD34  guard flag (cleared to 0 when f_d2c is reset) */
    int            f_d38;         /* +0xD38  compared to 6 (phase sub-state) */
    /* +0xD3C – +0xD43  gap */
    int            f_d44;         /* +0xD44  action result code (3=yield, 5=advance) */
    int            f_d48;         /* +0xD48  clearable counter/flag */
    int            f_d4c;         /* +0xD4C  guard flag (nonzero = skip) */
    int            f_d50;         /* +0xD50  guard flag (nonzero = skip) */
    int            f_d54;         /* +0xD54  guard flag (set 1 in blocking states, checked at loop entry) */
    /* +0xD58 – +0xD63  gap */
    int            f_d64;         /* +0xD64  assigned arg+0xd; compared to 0xb (mode code) */
    /* +0xD68 – +0xD93  gap */
    int            f_d94;         /* +0xD94  compared to arg (upper bound check) */
    /* +0xD98 – +0xD9B  gap */
    int            f_d9c;         /* +0xD9C  sub-state for func_02262804 dispatch (0/1, incremented) */
    /* struct continues beyond +0xDA0 */
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
| +0xD18 | `fn ptr` | read | `func_ov002_021b08a8.s` — installed fn ptr, `blx r0` via `[r0, #0xd18]` |
| +0xD1C | `int` | r/w | `func_ov002_021b08a8.s` — dispatch-table-2 index; `func_ov002_021aec04.s` sets it; incremented on handler success; `func_ov002_021d109c.s`, `021ca6f8.s` also access |
| +0xD20 | `int` | r/w | `func_ov002_02262994.s` (switch 0–8); `func_ov002_021b08a8.s` (reset to 0 on advance); `func_ov002_02265d24.s` (switch 0–0x1E); incremented by 1–3 per state |
| +0xD24 | `int` | r/w | `func_ov002_022651c4.s` (heavy r/w, counter); `func_ov002_02267f90.s`, `02267fd4.s` (read/increment) |
| +0xD28 | `int` | r/w | `func_ov002_022641a8.s`, `022630b0.s` — slot-iteration counter; compared to 0xA, incremented each slot |
| +0xD2C | `int` | r/w | `func_ov002_022627ac.s` (index into data_022cb96c; incremented on success); `func_ov002_02262804.s` (initialized to 6; checked `>= 9`) |
| +0xD30 | `int` | r/w | `func_ov002_022627ac.s` (cleared to 0 when handler returns nonzero); `func_ov002_02262804.s` (set to 1 on new dispatch) |
| +0xD34 | `int` | r/w | `func_ov002_02265d24.s` — cleared to 0 when f_d2c is reset; acts as inter-dispatch guard |
| +0xD38 | `int` | read | `func_ov002_02266650.c` — `== 6` check |
| +0xD44 | `int` | r/w | `func_ov002_02265d24.s` — set to 3 or 5 (action code); compared in yield/advance logic |
| +0xD48 | `int` | r/w | `func_ov002_0225929c.c`, `022598d0.c`, `02259834.c` — clearable |
| +0xD4C | `int` | read | `func_ov002_0225929c.c` — nonzero guard |
| +0xD50 | `int` | read | `func_ov002_022593f4.c`, `02262994.s`, `02265d24.s` — nonzero guard |
| +0xD54 | `int` | r/w | `func_ov002_02265d24.s` (set to 1 in blocking state); `02262994.s` (read) |
| +0xD64 | `int` | r/w | `022598d0.c`, `022593f4.c`, `02259834.c` — `arg + 0xd`; `== 0xb`; also `- 0xd` compared to 3/5 in `02265d24.s` |
| +0xD94 | `int` | read | `func_ov002_0226bad0.c` — upper-bound check against arg |
| +0xD9C | `int` | r/w | `func_ov002_02262804.s` — sub-state counter; compared to 0 and 1; incremented when advancing |

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

## Dispatch subsystem 2: f_d1c + data_022ca998

A parallel dispatch mechanism runs alongside the direct fn-ptr at +0xD18.
`f_d1c` (integer index) selects a handler from `data_ov002_022ca998` (BSS fn-ptr
array, word-indexed). The inner sub-state is tracked by `f_d20` (switch 0–8 in
the inner machine, up to 0–0x1E in the outer).

```c
/* func_ov002_021b08a8 — driver for dispatch system 2 */
int func_ov002_021b08a8(void) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    fn_t handler = data_ov002_022ca998[dss->f_d1c];
    if (!handler) return 1;   /* no handler → signal done */
    if (handler()) {
        dss->f_d20 = 0;       /* reset sub-state */
        dss->f_d1c++;         /* advance to next handler */
    }
    return 0;
}
```

`f_d1c` is initialized to specific values by `func_ov002_021aec04` (a large
dispatch-init function that handles many event-type codes). The index sequence
drives a multi-step duel sub-phase (e.g. draw, resolve, cleanup).

## Dispatch subsystem 3: f_d2c + data_022cb96c

A third dispatch mechanism uses `f_d2c` (integer index) into
`data_ov002_022cb96c` (BSS fn-ptr array, word-indexed, at least 10 entries).

```c
/* func_ov002_022627ac — driver for dispatch system 3 */
int func_ov002_022627ac(void) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    fn_t handler = data_ov002_022cb96c[dss->f_d2c];
    if (!handler) return 1;
    if (handler()) {
        dss->f_d30 = 0;   /* mark complete */
        dss->f_d2c++;     /* advance */
    }
    return 0;
}
```

`func_ov002_02262804` initializes `f_d2c = 6` and `f_d30 = 1` at the start of
a new dispatch phase; it checks `f_d2c >= 9` as a completion condition (table has
10 entries, indices 0–9, phase starts at slot 6). `f_d34` acts as an inter-phase
guard cleared when `f_d2c` is reset.

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
