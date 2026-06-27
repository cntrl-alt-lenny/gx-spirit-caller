/* CAMPAIGN-PREP candidate for func_0209b0f4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two independent shifted-index stores (don't share o+i*8 base); orr operand-first (a&0xff)|imm; bind d83e4 base
 *   risk:       orig computes a<<3 twice (lr for strh, inline for str) into different array bases; if mwcc CSEs the index into one reg the two addressings still match, but store interleave (strh, then field_4/8, then str) must hold. reshape-able (statement order).
 *   confidence: med
 */
/* func_0209b0f4: shifted-index stores into two arrays + and/orr config. */

extern short data_021a840c[];   /* halfword array, stride 8 (index*8 bytes) */
extern int   data_021a8410[];   /* word array, stride 8 (index*8 bytes) */

typedef struct {
    /* 0x00 */ int field_0;
    /* 0x04 */ int field_4;
    /* 0x08 */ int field_8;
} Struct_021a83e4;
extern Struct_021a83e4 data_021a83e4;

extern int  func_0209b4e4(void);
extern void func_0209adb4(unsigned int arg);

int func_0209b0f4(unsigned int a, int b, int c, int d) {
    if (func_0209b4e4() == 0)
        return 1;
    *(short *)((char *)data_021a840c + (a << 3)) = 0;
    data_021a83e4.field_4 = c;
    data_021a83e4.field_8 = d;
    *(int *)((char *)data_021a8410 + (a << 3)) = b;
    func_0209adb4((a & 0xff) | 0x03006500);
    return 0;
}
