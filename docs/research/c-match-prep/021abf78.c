/* CAMPAIGN-PREP candidate for func_021abf78 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 lo/hi fields + u8 cbyte; if-assign clamp, store-order +8 low half
 *   risk:       permuter-class: ov000_core.h already diagnoses this exact addr as 17v17 'byte->r2 vs r1, won't flip' — a register-numbering coin-flip a C reshape won't fix. Campaign should permuter or ship .s. struct-guessed field +0xc.
 *   confidence: low
 */
/* func_ov000_021abf78 (ov000, D) — operates on arg0 as a struct pointer.
 * KNOWN NEAR-MISS (ov000_core.h wall list): "17v17 reg-numbering (byte->r2 vs
 * r1), won't flip" — structurally perfect, the allocator just numbers the
 * loaded byte into r2 where mine lands r1. Logged permuter-class.
 *   +8 word: lo16 = w8 & 0xffff, hi16 = w8 >> 16 (both u16)
 *   +0xc word: cbyte = (u8) low byte
 *   if ((u16)(hi16 - cbyte) > lo16) { lo16++; store lo16 back into +8 low half }
 * The compare is unsigned 16-bit; bxls returns when (hi16-cbyte) <= lo16. */
struct Ov000Clamp { char pad0[8]; unsigned short lo16; unsigned short hi16; unsigned char cbyte; char pad13[3]; };

void func_ov000_021abf78(struct Ov000Clamp *p) {
    unsigned short d = (unsigned short)(p->hi16 - p->cbyte);
    if (d > p->lo16) {
        p->lo16 = p->lo16 + 1;
    }
}
