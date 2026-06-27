/* CAMPAIGN-PREP candidate for func_021d7c84 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     plain v/52 & v%52 for smull-magic; out-param decl-order x@sp0/y@sp4; -1 fold
 *   risk:       SOURCE .s IS TRUNCATED at .L_120 (680B fn, ~half shown): .L_198 path + literal pool absent, so /52 divisor and _LIT1 global are inferred and the tail is a stub — struct-guessed, cannot byte-match as-is.
 *   confidence: low
 */
/* func_ov004_021d7c84: touch/pointer handler. Early-outs while +0x88 latched or
 * a global flag is set, clamps +0x90 >=0, then on a press inside the active
 * rectangle maps the y-coord to a row via (y-7)/52 (smull magic), validates the
 * remainder < 45, and on a confirmed hit latches +0x90 / +0x9c and fires a toast.
 * cls D: smull magic divmod (/52).  ** PARTIAL: source .s was truncated at .L_120;
 * the .L_198 path and literal pool (incl _LIT2 magic) are NOT in the batch. **
 */
#include "ov004_core.h"
extern char data_02104bac[];
extern int  func_02006194(void);
extern int  func_0200617c(void);
extern void func_02006110(int *a, int *b);
extern void func_02037208(int a, int b, int c, int d);

int func_ov004_021d7c84(void) {
    char *b = data_ov004_0220b500;
    int row;
    int y, x;          /* x declared last -> x@sp+0, y@sp+4 (matches arg fills) */

    if (*(int *)(b + 0x88) != 0)
        return 0;                     /* tail return value unknown (truncated) */
    if (*(int *)data_ov004_022915e8 != 0)   /* _LIT1 global; offset 0 word read */
        return 0;
    if (*(int *)(b + 0x90) < 0)
        *(int *)(b + 0x90) = 0;
    *(int *)(b + 0x60) = 0;

    if (func_02006194() != 0 || func_0200617c() != 0) {
        func_02006110(&y, &x);
        *(int *)(b + 0x60) = 1;
        if (y >= 0x14 && y < 0xec && x >= 7 && x < 0xa3) {
            int v = x - 7;
            row = v / 52;
            if (v % 52 < 0x2d) {
                *(int *)(b + 0x60) = 0;
                *(int *)(b + 0x90) = row;
                *(int *)(b + 0x9c) = 1;
                if (func_0200617c() != 0) {
                    func_02037208(0x3a, -1, 0, 1);
                    if (*(int *)(b + 0x90) == 0)
                        *(int *)(b + 0x54) = 5;
                    else
                        *(int *)(b + 0x88) = *(int *)(b + 0x90) + 1;
                }
            }
        }
    }
    if (y < 0xe0)
        return 0;
    /* ** truncated: remaining body after .L_120 not present in source .s ** */
    return 0;
}
