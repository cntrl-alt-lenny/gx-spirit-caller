[//]: # (markdownlint-disable MD013 MD041)

# Ov002SelfContext (the "self" struct)

**ROUND-2 CORRECTION:** `self` in ov002 is a **small 4-byte card/entity handle**,
not a large game-state singleton. The large battle-state object is the separate
global `data_ov002_022d016c` (see `DuelStateSingleton.md`).

The pointer variable `self` appears in **1,206 source files** — nearly every
function in overlay002 takes it as its first argument. It identifies which card
or slot the function is operating on.

## Confidence: HIGH (corrected in round-2; definition verified from matched C)

## C Definition (byte-verified)

Confirmed from `src/overlay002/ov002_core.h` (matched by 5+ EUR functions):

```c
struct Ov002Self {
    u16 f0;        /* +0x00  card id / entity id (u16) */
    u16 b0 : 1;    /* +0x02  player-side bit (bit 0 only; lsl#31 >> #31) */
};
/* sizeof = 4 bytes */
```

The `b0` field uses **1-bit bitfield extraction** — the matched code emits
`lsl #31` then `lsr #31`, NOT `& 1`. Any C rewrite must use `: 1` bitfield
syntax, not masking, or the compiler will pick a different instruction.

## What `self->f0` holds

`f0` is the card identifier. It is read as a u16 in virtually every accessor:
```c
u16 id = self->f0;
u32 player = self->b0;   /* 0 or 1 — which player's side */
```

## The "count" misconception (corrected)

Round-1 analysis listed `count` as a struct field accessed 1,840 times.
**This was wrong.** The VARNAME statistics counted local variable names, not
struct field accesses. In practice, ov002 counting functions use:

```c
int count = 0;
/* ... loop body ... */
count++;
return count;
```

There is no `count` field on `struct Ov002Self`. The "count" is a loop
accumulator tallying cards in a zone.

## The per-player card count (what the "count" actually is)

The real card-in-zone counter accessed by counting loops is offset 0 of the
per-player region in `data_ov002_022cf16c`:

```c
/* in func_ov002_021c9be8 */
int zone_count = *(int *)((char *)data_ov002_022cf16c + (player & 1) * 0x868);
```

See `PerPlayerRowTable.md` for the full layout of that global.

## The true large duel-state objects (NOT `self`)

The large game-state singletons in ov002 are standalone globals, not `self`:

| Global | Size | Purpose |
|--------|------|---------|
| `data_ov002_022d016c` | ≥ 0xD98 B | Duel-phase state (phase 0–3, guard flags, tick counters) |
| `data_ov002_022ce288` | ≥ 0x688 B | Queue/event management with re-entrancy lock |
| `data_ov002_022cf16c` | 2 × 0x868 B | Per-player row table (card counts, slot array) |

See `DuelStateSingleton.md`, `DuelQueueState.md`, `PerPlayerRowTable.md`.

## Ov017 sub-struct note (offset relative to DIFFERENT base)

The `func_ov017_021b7478` / `func_ov017_021b7230` access pattern uses
`(self + 0x100)` — but in ov017 context, `self` is the ov017 module's own
state pointer, **not** `Ov002Self`. The sub-struct at +0x100 belongs to ov017's
local state object, not to the card handle.

## Recommendations for C-matching waves

To match ov002 MED candidates that take `self`:

1. Include `src/overlay002/ov002_core.h` — it has the byte-verified `Ov002Self`
   definition. **All 125 EUR ov002 .c files already include it.**
2. The match-blocking issue is the **bitfield instruction shape**: `b0 : 1`
   must use the `: 1` syntax so mwcc emits `lsl #31; lsr #31`, not `& 1`.
3. The `char _pad[N]` offsets for windowed typedefs of the large global
   objects (`d016c`, `ce288`, `cf16c`) are the remaining blockers — see their
   dedicated files.

## Using functions

Virtually every function in `src/jpn/overlay002/` and `src/overlay002/` —
~1,206 files covering the complete battle system.
