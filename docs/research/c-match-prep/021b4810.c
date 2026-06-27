/* CAMPAIGN-PREP candidate for func_021b4810 (ov014, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     volatile :5 bitfield field &= ~3; two ordered zero stores
 *   risk:       struct-guessed: same DISPCNT :5 model as 021b41b8. Risk the &= ~3 lowers to plain mask (and) instead of the orig lsl;lsr extract sequence, and that mwcc may share r0=0 const differently across the two stores. reshape-able via bitfield width tweak.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov014_021b4810 (ov014, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: volatile :5 bitfield at bit8 of base
 * 0x04001000 (sub DISPCNT region); field &= ~3; then two zero stores at
 * [+0x10] and [+0x14] in that order. return 1.
 */
typedef struct {
    unsigned int lo  : 8;
    unsigned int bf  : 5;   /* bits[12:8] */
    unsigned int hi  : 19;
} DispReg2;

int func_ov014_021b4810(void) {
    volatile DispReg2 *reg = (volatile DispReg2 *)0x04001000;
    reg->bf &= ~3;
    *(volatile int *)0x04001010 = 0;
    *(volatile int *)0x04001014 = 0;
    return 1;
}
