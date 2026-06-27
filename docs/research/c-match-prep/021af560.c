/* CAMPAIGN-PREP candidate for func_021af560 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     save args in callee-saved across call (mov r6/r5/r4), two :8 inserts fused into one A[0x28] word, one :5 insert
 *   risk:       reshape-able (decl-order): orig saves arg0->r6,arg1->r5,arg2->r4 in that order before the call; if mwcc allocates r4/r5/r6 in a different arg order, declaring params/locals first-used-first should realign, else permuter.
 *   confidence: med
 */
/* func_ov000_021af560: call func_ov000_021b0b38_unk(arg0,arg1,arg2,arg3) (args
 * pass through r0-r3 untouched), then pack three fields:
 * A[0x28] bit12:8=arg0, bit20:8=arg1; A[0x2c] bit0:5=arg2. Store-order.
 *
 *   mov r6,r0; mov r5,r1; mov r4,r2; bl func_ov000_021b0b38_unk
 *   and r3,r6,#0xff; ldr ip,[r0,#0x28]; ... bit12:8=arg0; ... bit20:8=arg1; str [r0,#0x28]
 *   and r1,r4,#0x1f; ldr r2,[r0,#0x2c]; bic r2,#0x1f; orr; str [r0,#0x2c]
 */

struct Ov000_758c_560 {
    char         _pad0[0x28];
    unsigned int a28_lo : 12;
    unsigned int a28_b12 : 8;      /* 0x28 bit12:8 = arg0 */
    unsigned int a28_b20 : 8;      /* 0x28 bit20:8 = arg1 */
    unsigned int a28_hi : 4;
    unsigned int a2c_b0 : 5;       /* 0x2c bit0:5  = arg2 */
    unsigned int a2c_hi : 27;
};

extern struct Ov000_758c_560 data_ov000_021c758c;
extern int func_ov000_021b0b38_unk(int a, int b, int c, int d);

void func_ov000_021af560(int arg0, int arg1, int arg2, int arg3) {
    func_ov000_021b0b38_unk(arg0, arg1, arg2, arg3);
    data_ov000_021c758c.a28_b12 = arg0;
    data_ov000_021c758c.a28_b20 = arg1;
    data_ov000_021c758c.a2c_b0  = arg2;
}
