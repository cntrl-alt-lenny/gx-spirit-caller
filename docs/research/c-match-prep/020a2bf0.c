/* CAMPAIGN-PREP candidate for func_020a2bf0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     declare p,ret first (r6,r5); delta in branch; unsigned cs on call-ret and cc on floor clamp
 *   risk:       permuter-class: r6=p / r5=ret / r4=delta callee-saved assignment order is a decl-order coin-flip; if mwcc orders them differently the movcs/clamp regs rotate.
 *   confidence: med
 */
/* func_020a2bf0 (main, class C) — pick a source pointer (arg / stack-local /
 * literal), then read two fields and floor-clamp the sum.
 *   r0 = arg
 *
 * asm shape:
 *   p = 0; ret_off = 0;
 *   if (arg == 0) {
 *       p = (S*)0x027ffe00;
 *   } else {
 *       int delta = arg->f2c - arg->f24;
 *       if (func_02097f10(arg, &local, 0x60) >= 0x60) p = &local;
 *       func_02097ea4(arg, delta, 0);
 *   }
 *   if (p) {
 *       ret_off = p->f2c + 0x268 + p->f3c;
 *       if (ret_off < 0x10000) ret_off = 0x10000;   // floor
 *   }
 *   return ret_off;
 *
 * NOTE r0 is NOT reloaded before func_02097f10 — arg is still in r0 from entry
 * (movs r7,r0 leaves r0 intact). delta(r4) is computed before the call and held.
 */

typedef struct {
    char _pad00[0x24];
    int  f24;   /* +0x24 */
    char _pad28[0x2c - 0x28];
    int  f2c;   /* +0x2c */
    char _pad30[0x3c - 0x30];
    int  f3c;   /* +0x3c */
} a2bf0_s;

extern unsigned int func_02097f10(a2bf0_s *arg, void *buf, int len); /* len read: cmp uses unsigned cs */
extern void         func_02097ea4(a2bf0_s *arg, int delta, int z);

int func_020a2bf0(a2bf0_s *arg)
{
    a2bf0_s *p;
    int      ret;
    char     local[0x60];

    p = 0;
    ret = 0;

    if (arg != 0) {
        int delta = arg->f2c - arg->f24;
        if (func_02097f10(arg, local, 0x60) >= 0x60)
            p = (a2bf0_s *)local;
        func_02097ea4(arg, delta, 0);
    } else {
        p = (a2bf0_s *)0x027ffe00;
    }

    if (p != 0) {
        ret = p->f2c + 0x268 + p->f3c;
        if ((unsigned int)ret < 0x10000) ret = 0x10000; /* movcc -> unsigned LO */
    }
    return ret;
}
