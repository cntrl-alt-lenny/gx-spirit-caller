/* CAMPAIGN-PREP candidate for func_02295b50 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0, rsb 1-b0, two predicated guards (==0, signed >=2), final ==0 tail
 *   risk:       the two early-return-0 must predicate not branch; movge signed >=2 needs int return on func_021bbf50
 *   confidence: med
 */
/* func_ov002_02295b50: linear chain, two predicated early-return-0 + final ==0.
 *
 *     ldrh; b0 ; bl func_02259f74(b0); ==0 -> return 0
 *     ldrh; 1-b0 ; bl func_021bbf50(1-b0); cmp r0,#2; movge#0; popge -> if(>=2) return 0
 *     mov r0,r4; ldrh; 1-b0 ; mov r2,#0 ; bl func_02281760(self, 1-b0, 0)
 *     cmp#0; moveq#1; movne#0; pop  -> return (==0)
 */

typedef unsigned short u16;

struct FuncOv00202295b50Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_021bbf50(unsigned int v);
extern int func_ov002_02259f74(unsigned int b0);
extern int func_ov002_02281760(struct FuncOv00202295b50Self *self, unsigned int v, int zero);

int func_ov002_02295b50(struct FuncOv00202295b50Self *self) {
    if (func_ov002_02259f74(self->b0) == 0) return 0;
    if (func_ov002_021bbf50(1 - self->b0) >= 2) return 0;
    return func_ov002_02281760(self, 1 - self->b0, 0) == 0;
}
