/* CAMPAIGN-PREP candidate for func_021ae42c (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :4 at bit12 + :8 at bit13; pass s->a8_f so mwcc re-extracts (lsl#16;lsr#28) for the tail-call arg
 *   risk:       reshape-able (operand re-use): orig derives the tail-call arg by re-shifting the stored word r2 (lsl#16;lsr#28), not `arg0&0xf`; if mwcc recomputes from arg0 (and r0,#0xf), pass s->a8_f (as written) -- already steered.
 *   confidence: med
 */
/* func_ov000_021ae42c: insert (arg0&0xf) as a 4-bit field at bit12 of A[0x2a8];
 * set the 8-bit field at bit13 of A[0x2a4] to 1 (clear bits13..20, set bit13);
 * tail-call func_ov000_021ae510 with that same 4-bit field (re-extracted from
 * the stored word, not from arg0).
 *
 *   ldr r1,A; r2=r0<<0x1c; ldr r3,[r1,#0x2a8]; bic r3,#0xf000
 *   orr r2,r3,r2,lsr#0x10; str r2,[r1,#0x2a8]            ; field bit12:4 = arg0
 *   ldr r3,[r1,#0x2a4]; and r0,r3,#0xffe01fff; orr r3,r0,#0x2000
 *   mov r2,r2,lsl#0x10; mov r0,r2,lsr#0x1c; str r3,[r1,#0x2a4]; bx func_ov000_021ae510
 */

struct Ov000_758c {
    char         _pad0[0x2a4];
    unsigned int a4_lo : 13;       /* 0x2a4 bit0  */
    unsigned int a4_f  : 8;        /* 0x2a4 bit13 = 1 */
    unsigned int a4_hi : 11;
    unsigned int a8_lo : 12;       /* 0x2a8 bit0  */
    unsigned int a8_f  : 4;        /* 0x2a8 bit12 = arg0 */
    unsigned int a8_hi : 16;
};

extern struct Ov000_758c data_ov000_021c758c;
extern int func_ov000_021ae510(unsigned int field);

int func_ov000_021ae42c(unsigned int arg0) {
    data_ov000_021c758c.a8_f = arg0;
    data_ov000_021c758c.a4_f = 1;
    return func_ov000_021ae510(data_ov000_021c758c.a8_f);
}
