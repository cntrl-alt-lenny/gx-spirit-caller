/* CAMPAIGN-PREP candidate for func_02201e38 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit + bit9 + bit0 bitfields; equality returns bool
 *   risk:       KNOWN WALL (brief 358 .s): frameless single-return predicate; moveq#1;movne#0 after cmp r1,r0,lsr#31 will not match
 *   confidence: low
 */
/* func_ov002_02201e38: kind(6-bit)==0x1d AND (+0x14 bit9)==self bit0 -> 1, else 0.
 * NOTE: shipped as .s (brief 358 reg-mirror / inline-branch wall). */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 5; u16 kind : 6; char _p[0x14 - 4]; unsigned int f14 : 10; };

int func_ov002_02201e38(struct Self *self) {
    if (self->kind != 0x1d) return 0;
    return ((self->f14 >> 9) & 1) == self->b0;
}
