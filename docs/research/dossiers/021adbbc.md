# 021adbbc — func_ov008_021adbbc (ov008, class D, 136B)

## Recipe + Risk
**Recipe:** D: u8 read as :8 bitfield (lsl#24;lsr#24); &t out-ptr; bind base
**Risk:** permuter-class: mwcc peepholes (hw<<24)>>24 to `and #0xff` (orig keeps lsl;lsr) and may reorder the f8 movlt/ldrge clamp vs the cmp — documented byte-combine peephole-split wall (ov008_core.h).

## Prep draft

```c
/* CAMPAIGN-PREP candidate for func_021adbbc (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: u8 read as :8 bitfield (lsl#24;lsr#24); &t out-ptr; bind o, re-read f4
 *   risk:       permuter-class: mwcc peepholes (hw<<24)>>24 to `and #0xff` (orig keeps lsl;lsr) and may reorder the f8 movlt/ldrge clamp vs the cmp — documented byte-combine peephole-split wall (ov008_core.h).
 *   confidence: low
 */
/* func_ov008_021adbbc — clamp + bitfield-insert store (class D byte-combine).
 * data_ov008_021b2dc8 is a u16-field struct; +4 and +6 hold u8-packed values
 * read as (hw<<24)>>24 => unsigned :8 bitfield members. */
#include "ov008_core.h"

extern void func_ov008_021ac06c(int x, int *out, int a2);

typedef struct {
    unsigned short pad0;        /* +0 */
    unsigned short pad2;        /* +2 */
    unsigned int f4 : 8;        /* +4 byte0 (the (hw<<24)>>24 field) */
    unsigned int f4_hi : 8;
    unsigned int f4_rest : 16;
    unsigned int f6 : 8;        /* +6 byte0 */
    unsigned int f6_hi : 8;
    unsigned int f6_rest : 16;
    unsigned short f8;          /* +8 store target */
} Obj021b2dc8;

void func_ov008_021adbbc(int a0) {
    Obj021b2dc8 *o = (Obj021b2dc8 *)data_ov008_021b2dc8;
    int t = o->f4;                       /* str r3,[sp] before the call */
    func_ov008_021ac06c(a0, &t, o->f6 - 2);
    if (t == o->f4) return;              /* ldmeqia sp!,{r3,pc} */
    o->f8 = (o->f4 < t) ? 4 : 0xfffc;    /* movlt #4 / ldrge 0xfffc */
    o->f4 = (o->f4 & ~0xff) | (t & 0xff);/* bic+orr+strh re-pack +4 */
}
```

## Struct context

The inline `Obj021b2dc8` typedef captures the ov008 packed-state word at `data_ov008_021b2dc8` (ov008_core.h extern). Key fields:

| field | offset | type | purpose |
|-------|--------|------|---------|
| `f4` | +4 byte0 | `unsigned int :8` | current position/index; read via lsl#24;lsr#24 |
| `f6` | +6 byte0 | `unsigned int :8` | span/limit parameter; `f6 - 2` feeds the clamp call |
| `f8` | +8 | `unsigned short` | direction output: 4 (upward) or 0xfffc (downward/neg) |

This is the sibling of `021ac06c` (the `func_ov008_021ac06c` callee that implements the 3-branch clamp) — `021adbbc` wraps it with a before/after compare and writes back.

## Closest matched example

**Path:** `src/overlay008/func_ov008_021ac06c.c` (relative to C:/Users/leona/Dev/gx-spirit-caller/kb-map)
**Why similar:** `021ac06c` is the CALLEE of this function — its `int *out` parameter receives `&t`, and `a2` receives `o->f6 - 2`. The argument layout of this call is directly confirmed by `021ac06c`'s signature.
**Key lesson from that file:** The clamp call's third arg `a2 + 1` in `021ac06c` corresponds to the span value; here `o->f6 - 2` must be computed inline in the call site (not bound to a temp before the call) so mwcc does not add an extra load.

## Try this

1. The `(hw<<24)>>24` peephole wall is the same as `021acfa0` and `021acdd0` (ov008_core.h §brief-403). Try replacing the `unsigned int f4 : 8` bitfield read with `(unsigned int)(*(unsigned short *)(data_ov008_021b2dc8 + 4) << 24) >> 24` inline, using variable-shift form `int s = 24; (hw << s) >> s;` to prevent copy-propagation.
2. In objdiff check the `f8` store: `(o->f4 < t) ? 4 : 0xfffc` should produce `movlt r?,#4 / ldrge r?,pool(0xfffc)` — if mwcc emits a branch instead of the conditional moves, try separating into `if (o->f4 < t) o->f8 = 4; else o->f8 = 0xfffc;`.
3. The `o->f4` re-read after the `func_ov008_021ac06c` call (in the `if (t == o->f4)` and `o->f8 = (o->f4 < t)`) must be fresh loads from the struct (not cached). If mwcc caches `f4` in a register, add a volatile cast or restructure to force reloads. Escalate to permuter if the `movlt/ldrge` scheduling doesn't close.
