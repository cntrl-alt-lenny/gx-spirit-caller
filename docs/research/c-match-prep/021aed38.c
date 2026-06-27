/* CAMPAIGN-PREP candidate for func_021aed38 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     three :8 bitfield inserts (bit8/bit22/bit0); call arg literal 0xff; store-order preserved
 *   risk:       reshape-able (peephole): orig sets the bit22:8 field to 0xff via bic#0x3fc00000;orr#0x3fc00000 -- if mwcc folds `f=0xff` to a single mask op or reorders the two writes to A[0x2b0] vs A[0x2ac], swap field decl order.
 *   confidence: med
 */
/* func_ov000_021aed38: set 8-bit field at bit8 of A[0x2b0]=arg0; set 8-bit field
 * at bit22 of A[0x2ac]=0xff (clear bits22..29 then set all 8); call
 * func_020b3870(0xff); set 8-bit field at bit0 of A[0x2b0]=return.
 *
 *   r3=arg0<<0x18; ldr ip,[r2,#0x2b0]; bic ip,#0xff00; orr r3,ip,r3,lsr#0x10
 *   str [r2,#0x2b0]                                       ; bit8:8 = arg0
 *   ldr r3,[r2,#0x2ac]; bic r3,#0x3fc00000; orr r3,#0x3fc00000; str [r2,#0x2ac] ; bit22:8 = 0xff
 *   mov r0,#0xff; bl func_020b3870
 *   and r0,r0,#0xff; ldr r2,[r1,#0x2b0]; bic r2,#0xff; orr r0,r2,r0; str [r1,#0x2b0] ; bit0:8 = ret
 */

struct Ov000_758c_ed38 {
    char         _pad0[0x2ac];
    unsigned int ac_lo : 22;       /* 0x2ac bit0  */
    unsigned int ac_f  : 8;        /* 0x2ac bit22 = 0xff */
    unsigned int ac_hi : 2;
    unsigned int b0 : 8;           /* 0x2b0 bit0  = ret  */
    unsigned int b8 : 8;           /* 0x2b0 bit8  = arg0 */
    unsigned int b_hi : 16;
};

extern struct Ov000_758c_ed38 data_ov000_021c758c;
extern int func_020b3870(int x);

void func_ov000_021aed38(int arg0) {
    data_ov000_021c758c.b8 = arg0;
    data_ov000_021c758c.ac_f = 0xff;
    data_ov000_021c758c.b0 = func_020b3870(0xff);
}
