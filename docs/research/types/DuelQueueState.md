[//]: # (markdownlint-disable MD013 MD041)

# DuelQueueState (data_ov002_022ce288)

An ov002 BSS global that manages the duel event queue and action dispatcher.
Contains a re-entrancy lock, a card-handle pointer, a state flag (`0x80` =
active), and a cluster of tick-counter / edge-trigger fields used to sequence
multi-step duel actions.

## Confidence: MEDIUM-HIGH (confirmed across 10+ independent matched C files)

Base address: `0x022CE288` (ov002 BSS)

## C Definition (partial)

```c
typedef struct DuelQueueState {
    /* +0x000 – +0x48B  gap */
    void          *f_48c;          /* +0x48C  pointer to card handle (Ov002Self**) */
    /* +0x490 – +0x5A7  gap */
    int            f_5a8;          /* +0x5A8  queue state: 0x80 = active, 0x7f = done */
    void          *f_5ac;          /* +0x5AC  secondary pointer */
    /* +0x5B0 – +0x5B3  gap */
    int            f_5b4;          /* +0x5B4  pending-action flag */
    /* +0x5B8 – +0x5BF  gap */
    int            f_5c0;          /* +0x5C0  re-entrancy lock (0 = free, 1 = busy) */
    /* +0x5C4 – +0x5C7  gap */
    int            f_5c8;          /* +0x5C8  compared to 0 (general status) */
    int            f_5cc;          /* +0x5CC  tick counter (count-up / count-down) */
    int            f_5d0;          /* +0x5D0  edge-bump: incremented on 0→1 transition */
    int            f_5d4;          /* +0x5D4  cleared on 0→1 edge */
    int            f_5d8;          /* +0x5D8  guard flag: nonzero ⇒ skip tick processing */
    /* +0x5DC – +0x687  gap (172 bytes) */
    int            f_688;          /* +0x688  cleared on 0→1 edge (companion to f_5d4) */
    /* struct continues beyond +0x68C */
} DuelQueueState;

extern DuelQueueState data_ov002_022ce288;
```

## Layout evidence

| Offset | Type | R/W | Source files |
|--------|------|-----|--------------|
| +0x48C | `void *` | r/w | `func_ov002_022477a0.c`, `022477d8.c` — card handle pointer |
| +0x5A8 | `int` | read | `func_ov002_0222b2e0.c`, `0223483c.c` — `0x7f` / `0x80` state |
| +0x5AC | `void *` | r/w | `func_ov002_022477d8.c` — secondary pointer |
| +0x5B4 | `int` | r/w | `func_ov002_021f85f8.c` — pending-action flag |
| +0x5C0 | `int` | r/w | `func_ov002_0225764c.c` — re-entrancy lock |
| +0x5C8 | `int` | read | `func_ov002_02202bd0.c` — `== 0` check |
| +0x5CC | `int` | r/w | `func_ov002_021e2b3c.c`, `021e2c5c.c` — tick counter |
| +0x5D0 | `int` | r/w | `func_ov002_021e2b3c.c` — bumped on edge |
| +0x5D4 | `int` | r/w | `func_ov002_021e2b3c.c` — cleared on edge |
| +0x5D8 | `int` | read | both tick files — skip guard |
| +0x688 | `int` | r/w | `func_ov002_021e2b3c.c` — cleared on edge |

## The state pair: 0x7F / 0x80

`+0x5A8` uses a two-value handshake pattern:

```c
/* func_ov002_0222b2e0.c — "waiting" side */
if (data_ov002_022ce288.f_5a8 == 0x7f) { ... }

/* func_ov002_0223483c.c — "active" side */
if (data_ov002_022ce288.f_5a8 == 0x80) { ... }
```

127 (`0x7f`) = idle / done; 128 (`0x80`) = action in progress.

## The re-entrancy lock (+0x5C0)

The `f_5c0` field guards against recursive dispatch:

```c
/* func_ov002_0225764c.c */
if (data_ov002_022ce288.f_5c0) return;   /* already processing */
data_ov002_022ce288.f_5c0 = 1;
/* ... dispatch action ... */
data_ov002_022ce288.f_5c0 = 0;
```

## Tick counter cluster (+0x5CC – +0x5D8 and +0x688)

Four fields form a tick-counter state machine:

```c
/* func_ov002_021e2b3c.c — simplified */
if (data_ov002_022ce288.f_5d8) goto skip;   /* guard */
data_ov002_022ce288.f_5cc++;                 /* count up */
if (f_5cc crosses threshold) {
    data_ov002_022ce288.f_5d0++;             /* bump edge counter */
    data_ov002_022ce288.f_5d4 = 0;           /* clear on edge */
    data_ov002_022ce288.f_688 = 0;           /* clear companion */
}
skip:
```

## Using functions (sample)

- `func_ov002_022477a0` — stores card handle into +0x48C
- `func_ov002_0222b2e0`, `0223483c` — state pair tests at +0x5A8
- `func_ov002_021f85f8` — pending flag at +0x5B4
- `func_ov002_0225764c` — re-entrancy lock at +0x5C0
- `func_ov002_02202bd0` — status check at +0x5C8
- `func_ov002_021e2b3c`, `021e2c5c` — tick counter / edge logic at +0x5CC–+0x688
