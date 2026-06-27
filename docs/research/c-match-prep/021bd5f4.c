/* CAMPAIGN-PREP candidate for func_021bd5f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hoist mla row-base per outer iter (+0x30), reload +0x38/+0x40 off it; guard chain
 *   risk:       orig builds row = mla(p&1,0x868,cf16c)+0x30 once per outer iter then +=0x14; offsets 0x08/0x10/0x14 struct-guessed. Nested cmp4==arg0/cmpeq j==arg1 ordering may reorder. permuter-class if the eq-pair compare swaps.
 *   confidence: low
 */
/* func_ov002_021bd5f4: call helper(arg0,arg1)->r7; gate on the +0x38 u16 of
 * slot[arg0&1][0] and on r7; then 2x5 nested scan of player rows counting
 * func_ov002_021ba104 hits past guards (active +0x38, flags +0x40 bits). */

extern char            data_ov002_022cf16c[];
extern unsigned short  data_ov002_022cf1a4[];
extern int  func_ov002_021b9ecc(int a, int b);
extern int  func_ov002_021ba104(int a, int b, int c);

int func_ov002_021bd5f4(int arg0, int arg1) {
    int r7 = func_ov002_021b9ecc(arg0, arg1);
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (arg0 & 1) * 0x868 + arg1 * 20) == 0)
        return 0;
    if (r7 == 0)
        return 0;
    {
        int count = 0;
        int p = 0;
        do {
            char *row = data_ov002_022cf16c + (p & 1) * 0x868 + 0x30;
            int j = 0;
            do {
                if (!(p == arg0 && j == arg1)) {
                    if (*(unsigned short *)(row + 0x08) != 0) {
                        unsigned int f = *(unsigned int *)(row + 0x10);
                        if (!((((f >> 2) | (f >> 1)) & 1)) &&
                            func_ov002_021ba104(p, j, r7) != 0)
                            count++;
                    }
                }
                j++;
                row += 0x14;
            } while (j < 5);
            p++;
        } while (p < 2);
        return count;
    }
}
