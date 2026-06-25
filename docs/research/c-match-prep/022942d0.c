/* CAMPAIGN-PREP candidate for func_022942d0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain, !bit0 rsb, ~0/0 mask args, distance bool
 *   risk:       021bae7c(bit0,0x13c3,-1) and 02280df4(self,bit0,~0,0) sigs confirmed via siblings; 021c8470 cmp 0x708
 *   confidence: med
 */
/* func_ov002_022942d0: if(h1(!bit0)==0) return 0; if(h2(bit0,0x13c3,-1)) return 1; if(h3(self,bit0,~0,0)<0) return 0; return h4(bit0) >= 0x708. */

struct F022942d0_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F022942d0_Self { unsigned short f0; struct F022942d0_F2 f2; };

extern int func_ov002_021bbeac(unsigned int v);
extern int func_ov002_021bae7c(unsigned int bit, int code, int arg);
extern int func_ov002_02280df4(struct F022942d0_Self *self, unsigned int bit, int mask, int zero);
extern int func_ov002_021c8470(unsigned int bit);

int func_ov002_022942d0(struct F022942d0_Self *self) {
    if (func_ov002_021bbeac(1 - self->f2.bit0) == 0)
        return 0;
    if (func_ov002_021bae7c(self->f2.bit0, 0x13c3, -1) != 0)
        return 1;
    if (func_ov002_02280df4(self, self->f2.bit0, ~0, 0) < 0)
        return 0;
    return func_ov002_021c8470(self->f2.bit0) >= 0x708;
}
