/* CAMPAIGN-PREP candidate for func_021c2568 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on RAW v (case 0x1a90..0x1a96) -> sub 0x1a90 jump-table matches; unsigned f40 for lsr
 *   risk:       VERIFIED jump-table + 0x1a90 literal now byte-match; residual: f40 bit-mask block operand-order/register-mirror differs (orig does bit6 term before bit2|bit1, regs permuted) = permuter-class scheduling.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2568 (ov002, class C) — MED tier.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 *   recipe:  nested player/idx loops, mla base per outer iter, dense switch jump-table, f40 bit-mask
 * func_021c2568(): count cells (over 2 players x 5 idx) where 021b9ecc(p,i)
 *   in {0x1a91,0x1a93,0x1a95} AND the f40/f38 bit-mask test passes.
 *   sub 0x1a90 then jump-table cases 0..6 (odd cases do the test).
 */

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b9ecc(int player, int idx);

int func_ov002_021c2568(void)
{
    int total = 0;
    int p = 0;

    do {
        char *cell = data_ov002_022cf16c + (p & 1) * 0x868;
        int i = 0;
        do {
            int v = func_ov002_021b9ecc(p, i);
            switch (v) {
            case 0x1a90:
            case 0x1a92:
            case 0x1a94:
            case 0x1a96:
                break;
            case 0x1a91:
            case 0x1a93:
            case 0x1a95: {
                unsigned int f40 = *(unsigned int *)(cell + 0x40);
                unsigned short f38 = *(unsigned short *)(cell + 0x38);
                int m6  = ~((f40 >> 6) & 1);
                int m21 = ~(((f40 >> 2) | (f40 >> 1)) & 1);
                if ((f38 & m6 & m21) != 0)
                    total++;
                break;
            }
            }
            i++;
            cell += 0x14;
        } while (i <= 4);
        p++;
    } while (p < 2);

    return total;
}
