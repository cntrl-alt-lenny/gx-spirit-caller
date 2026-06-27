/* CAMPAIGN-PREP candidate for func_021f6304 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (u8) byte-pack lever + f14 bitfields (asym), non-shifted operand-first
 *   risk:       struct-guessed: f14 (+0x14) bitfield offsets b9@bit9 / f10@bit10 inferred from shifts — confirm against real struct. Codegen itself BYTE-MATCHES (verified compile); supersedes brief 229's .s verdict.
 *   confidence: high
 */
/* func_ov002_021f6304: pack two f14 bitfields into a u16 arg, 0226aff0(f2.bit0,
 * packed, 1); return 1. cls D (C-39c byte-pack).
 *   packed = (u16)((u8)f14.b9 | ((u8)f14.f10 << 8));
 * The (u8) casts force orig's and;and;orr lsl#8 (NOT mwcc's folded lsl#24;lsr#16).
 * NOTE: brief 229 catalogued this as a .s tier-wall; the brief 356/358 (u8) lever
 * (postdates 229) makes it byte-match under 2.0/sp1p5 (verified by compile). */
typedef unsigned short u16;
typedef unsigned char  u8;

extern int func_ov002_0226aff0(int bit, unsigned int packed, int one);

struct F021f6304_F2 {
    u16 bit0 : 1;
    u16 rest : 15;
};
struct F021f6304_F14 {
    unsigned int lo9 : 9;
    unsigned int b9  : 1;
    unsigned int f10 : 4;
    unsigned int hi  : 18;
};
struct F021f6304 {
    u16 pad0;
    struct F021f6304_F2 f2;
    u16 pad4;
    u16 pad6;
    u16 pad8;
    u16 pada;
    u16 padc;
    u16 pade;
    u16 pad10;
    u16 pad12;
    struct F021f6304_F14 f14;   /* +0x14 */
};

int func_ov002_021f6304(struct F021f6304 *self) {
    unsigned int packed = (u16)((u8)self->f14.b9 | ((u8)self->f14.f10 << 8));
    func_ov002_0226aff0(self->f2.bit0, packed, 1);
    return 1;
}
