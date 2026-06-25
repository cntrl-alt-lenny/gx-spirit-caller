/* CAMPAIGN-PREP candidate for func_021bcd80 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested mla-base+0x30 ptr-walk; 13-bit :id; u8|u8<<8 u16 key; decl i before sum
 *   risk:       many callee-saved temps (self/key/row/(u8)i held across inner loop). likely (u8)i CSE or row-induction-var lands in a different reg than orig. permuter-class.
 *   confidence: low
 */
/* func_ov002_021bcd80: 2x5 nested scan over player rows. early-out 0 if gate
 * func_ov002_021bb068(0x13f2) > 0. for each (i,j): skip if slot id==0 or if
 * arg1 equals packed key (u8 i | (u8 j)<<8); else accumulate
 * func_ov002_021bc8c8(self,i,j). */
extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021bb068(int a);
extern int func_ov002_021bc8c8(int a, int b, int c);
struct slot { unsigned int id : 13; };

int func_ov002_021bcd80(int self, int key) {
    int sum = 0;
    int i;
    if (func_ov002_021bb068(0x13f2) > 0)
        return 0;
    for (i = 0; i < 2; i++) {
        unsigned char *row = data_ov002_022cf16c + (i & 1) * 0x868 + 0x30;
        int j;
        for (j = 0; j < 5; j++) {
            if (((struct slot *)row)->id != 0 &&
                key != (unsigned short)((unsigned char)i | ((unsigned char)j << 8)))
                sum += func_ov002_021bc8c8(self, i, j);
            row += 20;
        }
    }
    return sum;
}
