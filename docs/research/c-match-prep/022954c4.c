/* CAMPAIGN-PREP candidate for func_022954c4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0, pooled consts, mixed predicated early-returns + branch block, final ==0
 *   risk:       longest chain: inline-vs-branch of the three early returns must match (orig predicates 1st/2nd, branches 3rd)
 *   confidence: med
 */
/* func_ov002_022954c4: linear predicate chain on self->b0.
 *
 *     bl func_02281a74(b0); ==0 -> return 0
 *     bl func_021bd364(b0,0x15); !=0 -> return 1
 *     bl func_02281994(b0,0x18f6); !=0 -> .L_80 (skip next)
 *       bl func_021c2f24(b0,0x18f6); !=0 -> return 1
 *  .L_80: bl func_021c3bdc(b0); return (==0)
 */

typedef unsigned short u16;

struct FuncOv002022954c4Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_021bd364(unsigned int b0, int k);
extern int func_ov002_021c2f24(unsigned int b0, int k);
extern int func_ov002_021c3bdc(unsigned int b0);
extern int func_ov002_02281994(unsigned int b0, int k);
extern int func_ov002_02281a74(unsigned int b0);

int func_ov002_022954c4(struct FuncOv002022954c4Self *self) {
    if (func_ov002_02281a74(self->b0) == 0) return 0;
    if (func_ov002_021bd364(self->b0, 0x15) != 0) return 1;
    if (func_ov002_02281994(self->b0, 0x18f6) == 0) {
        if (func_ov002_021c2f24(self->b0, 0x18f6) != 0) return 1;
    }
    return func_ov002_021c3bdc(self->b0) == 0;
}
