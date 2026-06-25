/* CAMPAIGN-PREP candidate for func_02000d4c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: store-order writeback interleaved with count store, return slot[0]
 *   risk:       store-order: orig sequences str dst+0x3c, str count, str dst+0x40, ldr return, str dst+0x44; the count-store and the return-load sit BETWEEN the field stores. mwcc may move them. reshape-able by reordering the C statements exactly.
 *   confidence: med
 */
/* func_02000d4c: pop the top 16-byte record from the data_02105904 stack. If count==0
 * return -1. Else copy slot[+4..+0xc] back into data_021040ac[+0x3c..+0x44] (interleaved
 * with the count decrement) and return slot[0]. (main) class D, store-order. */
extern int data_021040ac;
extern int data_02105904;

int func_02000d4c(void) {
    int *base = (int *)&data_02105904;
    int n = base[0x80 / 4];
    int idx;
    int *slot;
    char *dst = (char *)&data_021040ac;
    if (n == 0)
        return -1;
    idx = n - 1;
    slot = (int *)((char *)base + (idx << 4));
    *(int *)(dst + 0x3c) = slot[1];
    base[0x80 / 4] = idx;
    *(int *)(dst + 0x40) = slot[2];
    *(int *)(dst + 0x44) = slot[3];
    return base[idx << 2];
}
