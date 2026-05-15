/* func_0208bca0: 32-bit signed integer divide using the DS hardware
 * divider. Returns the REMAINDER (companion to func_0208bcf8 which
 * returns the quotient).
 *
 * Same setup + wait-loop as func_0208bcf8; only the final pool word
 * differs (0x040002a8 = DIV_REMAIN instead of 0x040002a0 = DIV_RESULT).
 *
 * 18 insns + 4 pool words = 0x58 bytes. Routes through .legacy.c
 * (mwcc 1.2/sp2p3) — mwcc 2.0/sp1p5 folds the four register-base
 * pointers into a single ldr + offsets, shrinking the function to
 * 14 insns + 1 pool word (0x38 bytes). The 1.2-era compiler doesn't
 * apply that folding and preserves the four separate `ldr ip, .L`
 * loads the original used.
 */

#include <nitro/types.h>

int func_0208bca0(int numer, int denom) {
    vu16 *p_divcnt  = (vu16 *)0x04000280;
    vs32 *p_numer   = (vs32 *)0x04000290;
    vs32 *p_denom   = (vs32 *)0x04000298;
    vs32 *p_remain  = (vs32 *)0x040002a8;
    *p_divcnt = 0;
    *p_numer  = numer;
    *p_denom  = denom;
    p_denom[1] = 0;
    while (*p_divcnt & 0x8000)
        ;
    return *p_remain;
}
