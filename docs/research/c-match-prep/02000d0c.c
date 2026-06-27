/* CAMPAIGN-PREP candidate for func_02000d0c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: store-order field copy, base r5, count read-only (no +1)
 *   risk:       store-order: same interleave (ldr 0x3c, ldr 0x40, str +4, ldr 0x44, str +8, str +0xc) as 02000cc4; mwcc may straight-line it. reshape-able via temps to force the interleave, else permuter-class.
 *   confidence: med
 */
/* func_02000d0c: like 02000cc4 but WITHOUT bumping the count — store func_02000cb4()
 * into slot[count], then copy the data_021040ac[+0x3c..+0x44] snapshot into slot[+4..+0xc]
 * in source store-order. (main) class D. */
extern int data_021040ac;
extern int data_02105904;
extern int func_02000cb4(void);

void func_02000d0c(void) {
    int *base = (int *)&data_02105904;
    int n = base[0x80 / 4];
    int *slot = (int *)((char *)base + (n << 4));
    char *src = (char *)&data_021040ac;
    slot[0] = func_02000cb4();
    slot[1] = *(int *)(src + 0x3c);
    slot[2] = *(int *)(src + 0x40);
    slot[3] = *(int *)(src + 0x44);
}
