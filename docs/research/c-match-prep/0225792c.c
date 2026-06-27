/* CAMPAIGN-PREP candidate for func_0225792c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base bound once; separate i and count; skip-test >>2&1; blx via fn-ptr param
 *   risk:       orig keeps base in r6 as induction (r6+=0x14) and i in r5 separate from count r4; if mwcc recomputes base+i*0x14 each iter or fuses i/count the loop reg-alloc diverges. permuter-class.
 *   confidence: med
 */
/* func_ov002_0225792c (ov002, class C) — single counted loop, mla base, blx param.
 * base = cf16c + (b&1)*0x868; clear flag; for i=0..10: skip if (base[i].f40>>2)&1
 * else count += cb(a,b,i)!=0.
 */
extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];

int func_ov002_0225792c(int a, int b, int (*cb)(int, int, int)) {
    char *base = data_ov002_022cf16c + (b & 1) * 0x868;
    int count = 0;
    int i;
    *(int *)(data_ov002_022ce288 + 0x5C0) = 0;
    for (i = 0; i <= 10; i++) {
        if (((*(int *)(base + i * 0x14 + 0x40)) >> 2 & 1) == 0) {
            if (cb(a, b, i) != 0)
                count++;
        }
    }
    return count;
}
