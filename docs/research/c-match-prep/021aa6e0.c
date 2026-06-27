/* CAMPAIGN-PREP candidate for func_021aa6e0 (ov022, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: store-order stack pack, <<0x10 zero-extend of the two coords
 *   risk:       struct-guessed: incoming args at [sp+0x28]/[sp+0x2c] are the 6th/7th stack params (a5/a6) and the func_0207f934 arg order (blk@sp, coords@sp+4/+8, flag) is inferred from the str offsets; signature/arg-order likely wrong. struct-guessed.
 *   confidence: low
 */
/* func_ov022_021aa6e0: resolve glyph via func_0207ec28, build a <<12/<<10 fixed-point
 * stack block (pos ptr, two coords, flag=1), render via func_0207f934, advance *r5 by 8*ret.
 * (ov022) class C/D: store-order into the stack frame is the lever. */
extern int func_0207ec28(int a);
extern int func_0207f934(int handle, int a, int b, int c, int *blk, int x, int y);

void func_ov022_021aa6e0(int a0, int *a1, int a2, int a3, int a4, int a5, int a6) {
    int blk[2];
    int r = func_0207ec28(a0);
    int ret;
    blk[0] = a3 << 0xc;
    blk[1] = (unsigned short)(a4 << 0x10 >> 0x10) << 0xc;
    ret = func_0207f934(*a1, blk, 1, (unsigned short)(a5 << 0x10) >> 0x10,
                        (unsigned short)((r << 0x10) >> 0x10), a2, 0);
    *a1 += ret << 3;
}
