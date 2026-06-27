/* CAMPAIGN-PREP candidate for func_021b7f6c (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone of e80; 3rd arg -1 (mvn); kind r7=0 all three loops
 *   risk:       asm sets r7(=kind arg, mov r1,r7) to 0 in ALL three loops (mov r7,r4 with r4=0) unlike e80's 1/2/3 — wrote kind=0 throughout; if that's wrong the mov diverges (reshape-able: adjust kind constants). str[sp] flag pos inferred (struct-guessed).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b7f6c (ov006, class C) — MED tier.
 * UNVERIFIED build-free draft. CLONE of 021b7e80 with arg2 = -1 (mvn r6,#0) and kind 1/2/3.
 *   recipe: same three counted loops; 3rd positional arg is -1 not 0.
 * func_021b7240(p, kind, a2=-1, hword, flag=1). */

extern void func_ov006_021b7240(void *p, int kind, int a2, int hword, int flag);

int func_ov006_021b7f6c(char *p) {
    unsigned int i;
    if (*(unsigned int *)(p + 0x1c) != 0) {
        for (i = 0; i < *(unsigned int *)(p + 0x1c); i++)
            func_ov006_021b7240(p, 0, -1, *(unsigned short *)(p + i * 2 + 0x28), 1);
    }
    if (*(unsigned int *)(p + 0x20) != 0) {
        for (i = 0; i < *(unsigned int *)(p + 0x20); i++)
            func_ov006_021b7240(p, 0, -1, *(unsigned short *)(p + i * 2 + 0xc8), 1);
    }
    if (*(unsigned int *)(p + 0x24) != 0) {
        for (i = 0; i < *(unsigned int *)(p + 0x24); i++)
            func_ov006_021b7240(p, 0, -1, *(unsigned short *)(p + i * 2 + 0xe6), 1);
    }
    return 1;
}
