/* CAMPAIGN-PREP candidate for func_02294370 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single guard (~0/0 mask), distance-from-magic bool
 *   risk:       02280df4(self,bit0,~0,0) sig confirmed via 022943c4 sibling; 021c8470 cmp 0x514; >=/movge polarity
 *   confidence: high
 */
/* func_ov002_02294370: if(h1(self,bit0,~0,0) < 0) return 0; return h2(bit0) >= 0x514. */

struct F02294370_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02294370_Self { unsigned short f0; struct F02294370_F2 f2; };

extern int func_ov002_02280df4(struct F02294370_Self *self, unsigned int bit, int mask, int zero);
extern int func_ov002_021c8470(unsigned int bit);

int func_ov002_02294370(struct F02294370_Self *self) {
    if (func_ov002_02280df4(self, self->f2.bit0, ~0, 0) < 0)
        return 0;
    return func_ov002_021c8470(self->f2.bit0) >= 0x514;
}
