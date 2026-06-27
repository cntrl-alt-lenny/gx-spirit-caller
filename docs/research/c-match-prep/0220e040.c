/* CAMPAIGN-PREP candidate for func_0220e040 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: single-bit as (w<<k)>>31 (NOT >>9&1) for fused `eor ...,lsr#31`; b6_11 in if-block for shared ret0; Ov002Slot:13
 *   risk:       permuter-class (register-naming): size+instruction-SEQUENCE byte-exact (140B) incl fused eor; only the parity-mla chain regs differ (orig and r3/mla r2 + 2nd-mla base r2 vs mwcc r2/r1 + base r1). Register-rotation coin-flip, not a logic/shape miss.
 *   confidence: med
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
int func_ov002_0220e040(struct Ov002Self *self, int arg1) {
    unsigned int w, a, c;
    char *base; struct Ov002Slot *slot;
    if (arg1 != 0) return 0;
    if (self->b6_11 == 0x21) {
        w = *(unsigned int *)((char *)self + 0x14);
        a = (w << 22) >> 31;
        if ((a ^ ((w << 15) >> 31)) == self->b0) return 0;
        base = data_ov002_022cf16c + (a & 1) * 0x868;
        c = (w << 18) >> 28;
        slot = (struct Ov002Slot *)(base + c * 20 + 0x30);
        return slot->id != 0;
    }
    return 0;
}
