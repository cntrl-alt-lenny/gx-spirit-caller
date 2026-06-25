/* CAMPAIGN-PREP candidate for func_022636cc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     eor index r8; movs r4 sign-test as >=0; orr topbit|const; r/i as bind temps
 *   risk:       reshape-able: orig does `movs r4,r0; bmi` (sign test on call result) and reuses r4 both as arg to d5b80 and shifted into r1 (r4<<0xd). If mwcc spills r between the two calls, the shift source diverges. Confirm func_021e30b4 arity (here 2 args).
 *   confidence: med
 */
// func_ov002_022636cc — small counted loop, eor index, bitfield-pack
extern int func_ov002_021b4120(int a, int b, int c);
extern void func_ov002_021d5b80(int a, int b, int c, int d);
extern int func_ov002_021e30b4(int a, int b);

int func_ov002_022636cc(int a0)
{
    int i;

    for (i = 0; i < 2; i++) {
        int xi = a0 ^ i;                 /* r8 = eor */
        int r = func_ov002_021b4120(xi, 0xb, 0x16b9);
        if (r >= 0) {
            unsigned topbit;
            unsigned packlo;
            func_ov002_021d5b80(xi, 0xb, r, 0);
            topbit = ((unsigned)xi << 0x1f) & 0x80000000u;      /* r3 */
            packlo = ((unsigned)((unsigned)r << 0xd)) >> 0x10;   /* r1 */
            (void)packlo;
            func_ov002_021e30b4((int)(topbit | 0x0a4f16b9u),
                                (int)packlo);
            return 0;
        }
    }
    return 1;
}
