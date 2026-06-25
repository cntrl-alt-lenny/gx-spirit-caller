/* CAMPAIGN-PREP candidate for func_021bb5a8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base e + shift; e+=20 each iter (mla base reuse); flag-mask raw; bit18 separate tst
 *   risk:       orig keeps e(r7), shift(r8), count(r6), const1(r4), want(r9) all live across the call; that is a 5+ callee-saved live set. mwcc may assign/spill these regs in a different order -> stmdb reg-list + movs differ. permuter-class.
 *   confidence: low
 */
/* func_ov002_021bb5a8 (ov002, class C): counted loop slot 0..4, flag-mask
 * body + extra bit18 test + global-bit test; counts passing slots. */
extern unsigned char data_ov002_022cf16c[]; /* entry table, stride 20 */
extern unsigned char data_ov002_022d016c[]; /* obj w/ bitmask at +0xd4 */
extern int func_ov002_021b9ecc(int a, int b);

int func_ov002_021bb5a8(int self, int want) {
    int i;
    int count = 0;
    unsigned char *e = (unsigned char *)data_ov002_022cf16c + (self & 1) * 0x868;
    int shift = self << 4;
    for (i = 0; i < 5; i++, e += 20, shift++) {
        if (func_ov002_021b9ecc(self, i) == want) {
            unsigned int f = *(unsigned int *)(e + 0x40);
            unsigned int h = *(unsigned short *)(e + 0x38);
            if (((h & ~((f >> 6) & 1)) & ~(((f >> 2) | (f >> 1)) & 1))
                && ((f >> 18) & 1)) {
                unsigned int m = *(unsigned int *)(data_ov002_022d016c + 0xd4);
                if (!(m & (1u << shift)))
                    count++;
            }
        }
    }
    return count;
}
