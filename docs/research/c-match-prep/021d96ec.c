/* CAMPAIGN-PREP candidate for func_021d96ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     counted loop, mla base+0x64, bind cell, proven f38/f40 mvn/tst bit-test idiom
 *   risk:       Mask idiom is byte-proven by sibling 021c2568; main risk is cmp r6,r0 operand order (a1==result vs result==a1). reshape-able (swap compare operands if cmp reverses).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov002_021d96ec (ov002, class C) — MED tier.
 *   recipe: counted loop idx 5..9; cell=base+0x64 +0x14/iter; bit-test RMW (021c2568 idiom)
 * func_021d96ec(a0,a1): scan idx 5..9; if 021b9ecc(a0,idx)==a1 and f38/f40 mask test passes, return 1.
 */

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b9ecc(int a, int b);

int func_ov002_021d96ec(int a0, int a1)
{
    char *cell = data_ov002_022cf16c + (a0 & 1) * 0x868 + 0x64;
    int i = 5;

    do {
        if (a1 == func_ov002_021b9ecc(a0, i)) {
            int f40 = *(int *)(cell + 0x40);
            unsigned short f38 = *(unsigned short *)(cell + 0x38);
            int m6  = ~((f40 >> 6) & 1);
            int m21 = ~(((f40 >> 2) | (f40 >> 1)) & 1);
            if (((f38 & m6) & m21) != 0)
                return 1;
        }
        i++;
        cell += 0x14;
    } while (i < 0xa);

    return 0;
}
