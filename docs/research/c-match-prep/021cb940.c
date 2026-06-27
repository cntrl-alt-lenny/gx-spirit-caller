/* CAMPAIGN-PREP candidate for func_021cb940 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     pos=(signed char)(a0*0x30); plain signed /8 divides; func_0208e0a0 base; 2-way split fill
 *   risk:       struct-guessed: cmp pos,#0xd0 signed-bgt contradicts pure s8 (max 0x7f); (signed char) is closest C for rsb;lsl#24;ror#24 but modulo width unproven. Else reshape-able
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov004_021cb940 (ov004, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 * Sibling of func_ov004_021cb834 (same (signed char)(a0*0x30) idiom + /8 fills).
 *   recipe:     pos=(signed char)(a0*0x30); signed /8 divides (x>>2;+>>29;>>3); base from func_0208e0a0(); 2-way split fill
 *   risk:       struct-guessed: cmp pos,#0xd0 with signed bgt contradicts a pure s8 (max 0x7f) -- the (signed char) cast is the closest C for the rsb;lsl#24;ror#24 idiom but the modulo width is unproven; reshape-able otherwise (plain /8).
 *   confidence: low
 */
/* func_ov004_021cb940 (ov004, class D): pos=(signed char)(a0*0x30). If pos<=0xd0:
 * b=func_0208e0a0(); func_02094504(0, b+(pos/8)*0x40, 0x180). Else two-fill split:
 * w=0x100-pos; func_02094504(0, b+(pos/8)*0x40, ((w*0x20)/8)*2);
 * func_02094504(0, b, (((0x30-w)*0x20)/8)*2). */
extern int func_0208e0a0(void);
extern void func_02094504(int r0, int r1, int r2);

void func_ov004_021cb940(int a0) {
    int pos = (signed char)(a0 * 0x30);
    int b;
    if (pos <= 0xd0) {
        b = func_0208e0a0();
        func_02094504(0, b + (pos / 8) * 0x40, 0x180);
    } else {
        int w = 0x100 - pos;
        b = func_0208e0a0();
        func_02094504(0, b + (pos / 8) * 0x40, ((w * 0x20) / 8) * 2);
        b = func_0208e0a0();
        func_02094504(0, b, (((0x30 - w) * 0x20) / 8) * 2);
    }
}
