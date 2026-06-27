/* CAMPAIGN-PREP candidate for func_0201a4dc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind GetSystemWork in r4; if-assign cmp returns; lsl7/lsr31 bit-test = bit24 movne/eq
 *   risk:       reshape-able: the .L_70 path uses ldmltia (conditional return only when <0xa8, then FALLS THROUGH to the bit-test) — if mwcc emits an unconditional return-2 / branch instead of fall-through, the moveq/movne tail reorders.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0201a4dc (main, class C) — UNVERIFIED build-free draft.
 * Guard chain; GetSystemWork bound in r4 across the function (reloaded only at the +0x900 tail).
 *   sys = GetSystemWork();
 *   if (func_020190ec()) {                 // .L_80 path when func_020190ec()==0 falls to else? NO:
 *       if (func_020139b4() >= 2) goto bit; // bge .L_80
 *       return 1;
 *   } else {                               // .L_70
 *       if (func_02019124() < 0xa8) return 2;   // movlt+conditional return; else fall through
 *   }
 * bit:  v = *(int*)(sys+0x900); v = (v<<7)>>31;  // bit 24
 *       return v ? 3 : 0; */
extern char *GetSystemWork(void);
extern int func_020190ec(void);
extern int func_020139b4(void);
extern int func_02019124(void);

int func_0201a4dc(void) {
    char *r4 = GetSystemWork();
    if (func_020190ec() != 0) {
        if (func_020139b4() < 2)
            return 1;
    } else {
        if (func_02019124() < 0xa8)
            return 2;
    }
    if ((unsigned int)((unsigned int)*(int *)(r4 + 0x900) << 7) >> 0x1f)
        return 3;
    return 0;
}
