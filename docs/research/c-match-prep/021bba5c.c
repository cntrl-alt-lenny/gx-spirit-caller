/* CAMPAIGN-PREP candidate for func_021bba5c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign lo/hi (movne/moveq pairs); guard lo<=hi; mla e=base+lo*20; +=20; flag-mask
 *   risk:       orig sets r5/r4 via movne/moveq from one cmp r0,#0, then mla r7,r5,#0x14,base. mwcc must pick the SAME movcc pair order and fold lo*20 into the mla; an if/else (branch) instead of conditional-moves would diverge. reshape-able (kept as plain if/else assign).
 *   confidence: med
 */
/* func_ov002_021bba5c (ov002, class C): conditional loop bounds, flag-mask
 * body, field(+0x3c)==arg compare; counts. */
extern unsigned char data_ov002_022cf16c[]; /* entry table, stride 20 */
extern int func_0202e234(int a);
extern int func_ov002_021b9ecc(int a, int b);

int func_ov002_021bba5c(int self, int want, int arg2) {
    int count = 0;
    int lo, hi;
    if (func_0202e234(want)) { lo = 0;  hi = 4; }
    else                     { lo = 5;  hi = 10; }
    if (lo <= hi) {
        int i;
        unsigned char *e =
            (unsigned char *)data_ov002_022cf16c + (self & 1) * 0x868 + lo * 20;
        for (i = lo; i <= hi; i++, e += 20) {
            if (func_ov002_021b9ecc(self, i) == want) {
                unsigned int f = *(unsigned int *)(e + 0x40);
                unsigned int h = *(unsigned short *)(e + 0x38);
                if ((h & ~((f >> 6) & 1)) & ~(((f >> 2) | (f >> 1)) & 1)) {
                    if (*(int *)(e + 0x3c) == arg2)
                        count++;
                }
            }
        }
    }
    return count;
}
