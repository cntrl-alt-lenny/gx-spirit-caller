/* CAMPAIGN-PREP candidate for func_02090728 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     for-loop LSB scan, shift on miss; range ifs lo-then-hi; (char*)+off*12 mul; index table for ptr-walk
 *   risk:       permuter-class: loop codegen - mwcc must strength-reduce OSi_IrqCallbackTable[i] to the walked ptr (add r2,#4) AND place the i<0x16 test at the bottom (fallthrough entry) like orig; either differing reshuffles the loop. Range-branch order is reshape-able.
 *   confidence: low
 */
/* func_02090728 (main, cls C): scan flags LSB-first over indices 0..21,
 * shifting right each miss. On the first set bit at index i:
 *   8<=i<=11 -> data_021a6354[(i-8)*12 bytes]
 *   3<=i<=6  -> data_021a6354[(i+1)*12 bytes]
 *   else     -> OSi_IrqCallbackTable[i]  (orig walks base+i*4)
 * none set -> 0. data_021a6354 offsets are *12 byte strides (mul #0xc). */
extern int data_021a6354[];
extern int OSi_IrqCallbackTable[];

int func_02090728(unsigned int flags)
{
    int i;
    for (i = 0; i < 0x16; i++) {
        if (flags & 1) {
            if (i >= 8 && i <= 0xb)
                return *(int *)((char *)data_021a6354 + (i - 8) * 12);
            if (i >= 3 && i <= 6)
                return *(int *)((char *)data_021a6354 + (i + 1) * 12);
            return OSi_IrqCallbackTable[i];
        }
        flags >>= 1;
    }
    return 0;
}
