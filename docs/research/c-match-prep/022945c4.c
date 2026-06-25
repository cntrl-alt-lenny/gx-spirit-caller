/* CAMPAIGN-PREP candidate for func_022945c4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0, rsb 1-b0, predicated early-return-0, nested shared-0 guard chain
 *   risk:       first guard predicate-vs-branch (orig predicates); inner !=/>= shapes; -1 mask literal form
 *   confidence: med
 */
/* func_ov002_022945c4: standalone early-return-0 (predicated), then 2-path
 * shared-0 (.L_70) chain using 1-b0 args.
 *
 *     ldrh; b0 ; bl func_02280980(b0); cmp#0; movge#0; popge   -> if(>=0) return 0
 *     ldrh; 1-b0 ; bl func_02280df4(self, 1-b0, -1, 0)
 *     movs r1,r0; bmi .L_70                                     -> ret >= 0
 *     ldrh; 1-b0 ; bl func_021c8470(1-b0); cmp r0,#0x514; movge#1; popge -> if(>=0x514) return 1
 *  .L_70: mov r0,#0; pop
 */

typedef unsigned short u16;

struct FuncOv002022945c4Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_021c8470(unsigned int v);
extern int func_ov002_02280980(unsigned int b0);
extern int func_ov002_02280df4(struct FuncOv002022945c4Self *self, unsigned int v, int mask, unsigned int zero);

int func_ov002_022945c4(struct FuncOv002022945c4Self *self) {
    if (func_ov002_02280980(self->b0) >= 0) return 0;
    if (func_ov002_02280df4(self, 1 - self->b0, ~0, 0) >= 0) {
        if (func_ov002_021c8470(1 - self->b0) >= 0x514) return 1;
    }
    return 0;
}
