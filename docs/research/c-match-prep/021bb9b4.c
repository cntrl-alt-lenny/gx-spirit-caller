/* CAMPAIGN-PREP candidate for func_021bb9b4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     base+0x64 start; bind e+=20; k>0 then k==want (cmp ble / cmp bne); flag-mask raw
 *   risk:       orig adds #0x64 to the mla result to start at slot 5 while i runs 5..10; if mwcc instead folds the *20 into a slot-0 base and offsets by i, the add/base constant diverges. reshape-able (already encoded +0x64 + i from 5).
 *   confidence: med
 */
/* func_ov002_021bb9b4 (ov002, class C): counted loop slot 5..10, flag-mask
 * body, second predicate call; counts. */
extern unsigned char data_ov002_022cf16c[]; /* entry table, stride 20 */
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021b9d34(int a, int b);

int func_ov002_021bb9b4(int self, int want) {
    int i;
    int count = 0;
    /* base + (self&1)*0x868 + 5*20 (start at slot 5); +0x64 = 100 = 5*20 */
    unsigned char *e = (unsigned char *)data_ov002_022cf16c + (self & 1) * 0x868 + 0x64;
    for (i = 5; i <= 10; i++, e += 20) {
        int k = func_ov002_021b9ecc(self, i);
        if (k > 0 && k == want) {
            unsigned int f = *(unsigned int *)(e + 0x40);
            unsigned int h = *(unsigned short *)(e + 0x38);
            if ((h & ~((f >> 6) & 1)) & ~(((f >> 2) | (f >> 1)) & 1)) {
                if (func_ov002_021b9d34(self, i))
                    count++;
            }
        }
    }
    return count;
}
