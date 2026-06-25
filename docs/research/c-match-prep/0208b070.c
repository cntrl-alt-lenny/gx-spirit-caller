/* CAMPAIGN-PREP candidate for func_0208b070 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     signed guard early-return, commutative sub/mul order, tail-call add
 *   risk:       r4-saved base across the call and the (end-base) operand order may flip reg-alloc; field offsets assumed
 *   confidence: med
 */
/* func_0208b070 — linear interpolation lookup. If the position
 * (+0x8) has reached/passed the end (+0xc), return the end value
 * (+0x4); otherwise interpolate: base=+0x0, span=(+0x4 - +0x0),
 * scaled by position via func_020b3870, returned as base + scaled.
 *
 *   ldr r1,[r0,#0xc]; ldr r2,[r0,#8]; cmp r2,r1
 *   ldrge r0,[r0,#4]; ldmgeia sp!,{r4,pc}      ; pos>=end -> p->f4
 *   r4=[r0]; r0=[r0,#4]; r0=r0-r4; r0=r2*r0     ; (f4-f0)*pos
 *   bl func_020b3870; r0=r4+r0; ldmia sp!,{r4,pc}
 *
 * cmp r2,r1 with `ge` is a SIGNED compare (early-return guard). The
 * subtraction (f4 - f0) is written end-minus-base to match
 * `sub r0,r0,r4`; the multiply `r2*r0` is pos*(span). func_020b3870 is
 * presumably a fixed-point normaliser (e.g. >>shift).
 */
#include <nitro/types.h>

typedef struct Interp_0208b070 {
    s32 base;   /* +0x00 */
    s32 end;    /* +0x04 */
    s32 pos;    /* +0x08 */
    s32 max;    /* +0x0c */
} Interp_0208b070;

extern int func_020b3870(int x);

int func_0208b070(Interp_0208b070 *p) {
    int base;
    if (p->pos >= p->max) return p->end;
    base = p->base;
    return base + func_020b3870(p->pos * (p->end - base));
}
