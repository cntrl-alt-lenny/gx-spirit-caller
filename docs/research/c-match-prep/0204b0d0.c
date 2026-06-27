/* CAMPAIGN-PREP candidate for func_0204b0d0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return mask; do-while 1..[+0xd]; bind constant 1 (one) for lsl; reload bound each iter
 *   risk:       orig pre-hoists r6=0 before the a0 test and keeps r4=1 (one) live as the shift base across the loop. If mwcc rematerializes the literal 1 instead of holding it in a callee-saved reg, the loop body's reg use diverges (permuter-class: loop reg-alloc).
 *   confidence: med
 */
/* func_0204b0d0 - main - class C
 * early-return masks [+0x2f0]; else orr-lsl accumulate over a byte array
 * at +0x2d0 indexed 1..[+0xd]. r4 holds constant 1 for the shift.
 * Offsets confirmed against src/main/func_0204b0d0.s.
 */
extern unsigned char *func_020498f0(void);

int func_0204b0d0(int a0)
{
    int acc;
    int one;
    int i;

    if (a0 != 0)
        return *(int *)(func_020498f0() + 0x2f0) & ~1;

    acc = 0;
    one = 1;
    if (func_020498f0()[0xd] >= 1) {
        i = 1;
        do {
            acc |= one << func_020498f0()[i + 0x2d0];
            i++;
        } while (i <= func_020498f0()[0xd]);
    }
    return acc;
}
