/* CAMPAIGN-PREP candidate for func_021ab4a0 (ov020, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod: sel%5 and sel/5 via smull magic -> plain / and %
 *   risk:       struct-guessed: the smull on (r5*2)/4 path computing r4 (a second quotient) and exact Fill32/func_020a978c/func_02004fe8 arg layout via [sp] block are inferred; the row uses sel/5 but a parallel (2*sel)/4 term suggests my divisor mapping is incomplete. struct-guessed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov020_021ab4a0 (ov020, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     class D divmod: r5/5 (smull magic _LIT5) and (r5*2)/4 give row/col; plain
 *     '/' and '%' by 5; bitfield/shift on r5>>0x1f sign part handled by mwcc.
 *   risk:       see risk field.
 *   confidence: low
 */
/* func_ov020_021ab4a0: menu cursor setup. If r5<0: tear-down path (func_0207f884/85c, ab708,
 * ab0d8). Else clamp r5 to 9, fill a stack block, then place via func_02004fe8 at
 * col=(r5%5)*0x1c+8, row=(r5/5)*0x6c+1. */
extern void Fill32(int v, void *dst, int n);
extern int  data_02102c90;
extern int  data_ov020_021ae040;
extern int  data_ov020_021ae060;
extern int  data_ov020_021ae070;
extern int  data_ov020_021ae084;
extern void func_02001c98(int a, int b);
extern void func_02001d0c(int a, int b, int c, int d);
extern void func_02001d68(int a);
extern void func_02004fe8(int a, void *blk, int c, int d);
extern void func_0207f85c(int a);
extern void func_0207f884(int a);
extern int *func_0208df40(void);
extern void func_020a978c(void *blk, int a, int n);
extern void func_ov020_021ab0d8(int a);
extern void func_ov020_021ab708(int a, int b, int c, int d);

void func_ov020_021ab4a0(int sel) {
    int *base;
    int blk[4];
    int q5;
    base = func_0208df40();
    ((int*)&data_ov020_021ae060)[0x8d8 / 4] = 0x12;
    func_02001d0c((int)&data_ov020_021ae070, 0x1b, 0, 0x12);
    func_02001d68(0);
    func_02001c98(0xf, 1);
    if (sel < 0) {
        func_0207f884((int)&data_ov020_021ae040);
        func_0207f85c((int)&data_ov020_021ae084);
        func_ov020_021ab708(0, 2, 0, 0);
        func_ov020_021ab0d8(0);
        return;
    }
    if (sel >= 0xa) sel = 9;
    Fill32(0, blk, 0xc);
    func_020a978c(blk, (int)&data_02102c90, sel + 1);
    q5 = sel / 5;
    blk[0] = (sel % 5) * 0x1c + 8;
    blk[1] = 0xe;
    func_02004fe8((int)base, blk, q5 * 0x6c + 1, 0);
}
