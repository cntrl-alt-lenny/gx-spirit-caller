/* CAMPAIGN-PREP candidate for func_021bce2c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two parallel ptr-walks (rec base / row+0x30); flags bit2|bit1; guard chain; decl i before sum
 *   risk:       orig keeps rec(r8) and row(r7) as two separate induction vars both stepping 0x14; if mwcc folds them to one base+offset the two add r7/add r8 collapse. reshape-able (force both ptrs) else permuter-class.
 *   confidence: low
 */
/* func_ov002_021bce2c: 2x5 nested scan with a 3-part guard chain. early-out 0
 * if gate func_ov002_021bb068(0x13f2) > 0. per (i,j): skip if id==0; skip if
 * ((flags>>2)|(flags>>1))&1; if i!=self require cap nonzero; require
 * func_ov002_021c8940(i,j)==arg1; then accumulate func_ov002_021bc8c8(self,i,j). */
extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021c8940(int a, int b);
struct slot { unsigned int id : 13; };

int func_ov002_021bce2c(int self, int want) {
    int sum = 0;
    int i;
    if (func_ov002_021bb068(0x13f2) > 0)
        return 0;
    for (i = 0; i < 2; i++) {
        unsigned char *rec = data_ov002_022cf16c + (i & 1) * 0x868;
        unsigned char *row = rec + 0x30;
        int j;
        for (j = 0; j < 5; j++) {
            unsigned int flags = *(unsigned int *)(rec + 0x40);
            if (((struct slot *)row)->id != 0 &&
                !(((flags >> 2) | (flags >> 1)) & 1) &&
                (i == self || *(unsigned short *)(rec + 0x38) != 0) &&
                func_ov002_021c8940(i, j) == want)
                sum += func_ov002_021bc8c8(self, i, j);
            row += 20;
            rec += 20;
        }
    }
    return sum;
}
