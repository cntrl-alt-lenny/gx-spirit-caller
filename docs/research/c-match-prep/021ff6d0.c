/* CAMPAIGN-PREP candidate for func_021ff6d0 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     (u8) byte-pack; reuse bit0; gt-zero bool
 *   risk:       byte-pack may peephole to lsl#24;lsr#16 instead of and;orr; bit0 reuse for arg0+low-byte may not CSE
 *   confidence: med
 */
/* func_ov002_021ff6d0: pack (u8)bit0 | ((u8)multi5 << 8) as a u16, call
 * 021bcd80(bit0, packed), return result > 0. The (u8) casts are the byte-pack
 * lever (and;and;orr lsl#8); bit0 is reused as both arg0 and the low byte. */

struct F021ff6d0_F2 {
    unsigned short b0     : 1;
    unsigned short multi5 : 5;
    unsigned short        : 10;
};
struct F021ff6d0_Self {
    unsigned short f0;
    struct F021ff6d0_F2 f2;
};

extern int func_ov002_021bcd80(unsigned int bit0, int mask);

int func_ov002_021ff6d0(struct F021ff6d0_Self *self) {
    unsigned int b0 = self->f2.b0;
    return func_ov002_021bcd80(
               b0,
               (unsigned short)((unsigned char)b0 |
                                ((unsigned char)self->f2.multi5 << 8))) > 0;
}
