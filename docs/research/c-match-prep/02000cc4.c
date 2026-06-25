/* CAMPAIGN-PREP candidate for func_02000cc4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: store-order field copy 0x3c/0x40/0x44, base held in r5
 *   risk:       store-order: orig interleaves ldr 0x3c, ldr 0x40, str slot+4, ldr 0x44, str slot+8, str slot+0xc; mwcc may emit straight load-load-load-store-store-store. reshape-able if not (split into temps to force interleave), else permuter-class.
 *   confidence: med
 */
/* func_02000cc4: push a 16-byte record onto the stack at data_02105904. Bump the count
 * at +0x80, store func_02000cb4() into the new slot, then copy the 3-word snapshot from
 * data_021040ac[+0x3c..+0x44] into slot[+4..+0xc] in source store-order. (main) class D. */
extern int data_021040ac;
extern int data_02105904;
extern int func_02000cb4(void);

void func_02000cc4(void) {
    int *base = (int *)&data_02105904;
    int n = base[0x80 / 4];
    int *slot = (int *)((char *)base + (n << 4));
    char *src = (char *)&data_021040ac;
    base[0x80 / 4] = n + 1;
    slot[0] = func_02000cb4();
    slot[1] = *(int *)(src + 0x3c);
    slot[2] = *(int *)(src + 0x40);
    slot[3] = *(int *)(src + 0x44);
}
