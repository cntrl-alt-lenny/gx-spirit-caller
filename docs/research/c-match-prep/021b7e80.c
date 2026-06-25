/* CAMPAIGN-PREP candidate for func_021b7e80 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     three counted loops, count at p[0x1c/0x20/0x24]; hword arg; stacked flag=1
 *   risk:       the str [sp] 5th arg (flag=1) — its exact param position/type is inferred; if func_021b7240 takes flag elsewhere the stack-store offset shifts (struct-guessed). Loop reloads count each iter (matches bcc r0).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b7e80 (ov006, class C) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe: three near-identical counted loops, counts at p[0x1c]/[0x20]/[0x24], halfword arg from p+i*2+{0x28,0xc8,0xe6}, spill const via stack arg.
 * func_021b7240(p, kind, arg2, hword) with a 5th(?) arg pushed via str [sp]; here str r6/r8 = 1 onto stack each iter. */

extern void func_ov006_021b7240(void *p, int kind, int a2, int hword, int flag);

int func_ov006_021b7e80(char *p) {
    unsigned int i;
    if (*(unsigned int *)(p + 0x1c) != 0) {
        for (i = 0; i < *(unsigned int *)(p + 0x1c); i++)
            func_ov006_021b7240(p, 1, 0, *(unsigned short *)(p + i * 2 + 0x28), 1);
    }
    if (*(unsigned int *)(p + 0x20) != 0) {
        for (i = 0; i < *(unsigned int *)(p + 0x20); i++)
            func_ov006_021b7240(p, 2, 0, *(unsigned short *)(p + i * 2 + 0xc8), 1);
    }
    if (*(unsigned int *)(p + 0x24) != 0) {
        for (i = 0; i < *(unsigned int *)(p + 0x24); i++)
            func_ov006_021b7240(p, 3, 0, *(unsigned short *)(p + i * 2 + 0xe6), 1);
    }
    return 1;
}
