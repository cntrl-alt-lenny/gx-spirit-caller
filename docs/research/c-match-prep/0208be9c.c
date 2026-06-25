/* CAMPAIGN-PREP candidate for func_0208be9c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     literal-pointer MMIO init stores (DIV setup)
 *   risk:       constant-load and 64-bit store scheduling differs; identical USA sibling shipped as .s -> likely still .s
 *   confidence: low
 */
/* func_0208be9c — kick off a hardware division: set DIVCNT mode, load
 * a 64-bit numerator (0 : 0x1000) and the denominator (arg : 0).
 *
 *   strh #1, [0x04000280]            ; DIVCNT = 1 (mode 1: 64/32)
 *   str  #0, [0x04000290]            ; DIV_NUMER lo = 0
 *   str  #0x1000, [0x04000294]       ; DIV_NUMER hi = 0x1000
 *   str  r0, [0x04000298]            ; DIV_DENOM lo = arg
 *   str  #0, [0x0400029c]            ; DIV_DENOM hi = 0
 *   bx lr
 *
 * NOTE: the byte-identical USA sibling func_0208bdb4 was shipped as .s
 * (reg-alloc/scheduling wall: mwcc orders the constant materialisation
 * and the two 64-bit stores differently). Provided as the best C
 * candidate; expect objdiff to show store/const scheduling differences.
 * The literal-pointer stores are kept inline-volatile per recipe.
 */
#include <nitro/types.h>

void func_0208be9c(s32 denom) {
    *(vu16 *)0x04000280 = 1;
    ((vs32 *)0x04000290)[0] = 0;
    ((vs32 *)0x04000290)[1] = 0x1000;
    ((vs32 *)0x04000298)[0] = denom;
    ((vs32 *)0x04000298)[1] = 0;
}
