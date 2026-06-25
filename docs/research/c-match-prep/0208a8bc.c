/* CAMPAIGN-PREP candidate for func_0208a8bc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     conditional store-through-ptr + RELOAD bic chain, store order
 *   risk:       movne/strne predication may not regenerate from the if-block; field offsets guessed against real struct
 *   confidence: med
 */
/* func_0208a8bc — conditional clear of an owned sub-object pointer
 * (+0x14c) then clear three flag bits (0x1, 0x4, 0x2) in the flags
 * word at +0x110, reloading the word before each bic.
 *
 *   ldr r2,[r0,#0x14c]; cmp r2,#0; movne r1,#0; strne r1,[r2];
 *   strne r1,[r0,#0x14c]
 *   ldr r1,[r0,#0x110]; bic r1,r1,#1;  str r1,[r0,#0x110]
 *   ldr r1,[r0,#0x110]; bic r1,r1,#4;  str r1,[r0,#0x110]
 *   ldr r1,[r0,#0x110]; bic r1,r1,#2;  str r1,[r0,#0x110]
 *   bx lr
 *
 * The flags word is reloaded between each bic (RELOAD recipe), so the
 * three clears are written as three separate read-modify-write
 * statements rather than one fused expression. Bit clear order 1,4,2
 * follows source order. The conditional store-through-pointer maps to
 * `if (p->f14c) { *p->f14c = 0; p->f14c = 0; }`.
 */
#include <nitro/types.h>

typedef struct Obj_0208a8bc {
    u8  _pad0[0x110];
    u32 flags;          /* +0x110 */
    u8  _pad114[0x14c - 0x114];
    u32 *owned;         /* +0x14c */
} Obj_0208a8bc;

void func_0208a8bc(Obj_0208a8bc *p) {
    if (p->owned != 0) {
        *p->owned = 0;
        p->owned = 0;
    }
    p->flags &= ~0x1;
    p->flags &= ~0x4;
    p->flags &= ~0x2;
}
