[//]: # (markdownlint-disable MD013 MD041)

# Ov002SelfContext (the "self" struct)

The dominant struct in the entire decomp. The pointer variable `self` appears
in **1,206 source files** (1,840 access lines) — nearly every function in
overlay002 takes it as its first argument. This is the battle/duel state
manager for Yu-Gi-Oh! GX Spirit Caller.

**Current status: SHAPE KNOWN, field names NOT YET RECOVERED.**
Each matched C function defines its own windowed typedef for `self` with only
the fields it accesses. Field names use bitfield notation (`b0`, `b18_19`,
`b1_5`, `b4_7`, `b6_11`, `b6_14`, `bit0`, `bit14`, `bit2`, `count`, ...).

## Confidence: MEDIUM (size/purpose KNOWN; layout fragmentary)

The GameSingleton accessed via `func_020498f0()` (see `GameSingleton.md`) is
a strong candidate for being this struct or a sub-object of it. Offsets from
the two assembly functions accessing the getter reach 0x480+. Given that
ov017's functions use `(self + 0x100)` as a sub-object, the full game state
may be even larger (1000+ bytes).

## What is known

- `self` is always the first argument, passed by pointer
- Every ov002 function defines its own small-window typedef: `typedef struct { char pad[N]; <field_type> fieldN; } Self_local_t;`
- Field accesses include densely-packed bitfields (names like `b1_5` = bits 1-5 of a byte at some offset)
- Sub-object at `self + 0x100` observed in ov017 (type: SceneFlags / SubState — a 0xD0+ byte embedded struct)

## Ov017 sub-struct at self+0x100

```c
/* sub-region of self, beginning at byte offset 0x100 */
typedef struct SelfSubContext {
    char           pad[0xD0];    /* +0x100  = self+0x100+0x000 */
    unsigned short fd0;          /* +0x1D0  = self+0x100+0x0D0 */
    unsigned short fd8;          /* +0x1D8  = self+0x100+0x0D8 */
    unsigned short fda;          /* +0x1DA  = self+0x100+0x0DA */
} SelfSubContext;
```

Source: `func_ov017_021b7478` accesses `((SubState *)(self + 0x100))->fd0`
and `func_ov017_021b7230` accesses `((SceneFlags *)(self + 0x100))->fd8` +
`->fda`. Both casts treat `self+0x100` as the base of this sub-struct.

## Ov015 dirty flag at self+0x70

```c
/* accessed in func_ov015_021b228c */
typedef struct { unsigned dirty : 1; } Ov015DirtyFlag;
/* cast: ((Ov015DirtyFlag *)((char *)o + 0x70))->dirty */
```

## Using functions

Virtually every function in `src/jpn/overlay002/` and `src/overlay002/` —
~1,206 files covering the complete battle system.

## Recommendations for C-matching waves

The bitfield-heavy windowed typedefs mean that MED-class candidates need:
1. The correct `char pad[N]` size for the fields they access
2. Correct bit positions and signedness for each bitfield
3. The `count` field (accessed 1840 times) is likely a major bottleneck —
   its offset should be found by cross-referencing the functions that most
   frequently access it

**Priority:** discover the offset and type of the `count` field (likely a
match-count, turn counter, or action queue counter accessed in nearly every
function). This single field probably blocks the largest cluster of MED
candidates.

## Next steps

- Search `c-match-prep/` drafts for functions that use ONLY `self->count`
  to find the offset by elimination
- Cross-reference `func_020498f0()` return value with ov002 `self` pointer —
  if the same, GameSingleton.md captures the full layout
