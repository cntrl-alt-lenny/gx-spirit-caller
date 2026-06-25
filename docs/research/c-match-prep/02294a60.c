/* CAMPAIGN-PREP candidate for func_02294a60 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0, pooled const 0x140e, ~0 mask, two predicated guards, tail call
 *   risk:       guards predicate-vs-branch; 0x140e/~0 immediate-vs-pool placement; movgt signed >0 shape
 *   confidence: med
 */
/* func_ov002_02294a60: two predicated early-return-0 guards + tail call.
 *
 *     ldrh; b0 ; ldr r1,=0x140e ; mvn r2,#0 ; bl func_021bae7c(b0,0x140e,-1)
 *     cmp#0; movne#0; popne                 -> if(!=0) return 0
 *     ldrh; b0 ; bl func_02280980(b0); cmp#0; movgt#0; popgt -> if(>0) return 0
 *     mov r0,r5; mov r1,r4; bl func_02291160(self, arg); pop -> tail call
 */

typedef unsigned short u16;

struct FuncOv00202294a60Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_021bae7c(unsigned int b0, int k, int mask);
extern int func_ov002_02280980(unsigned int b0);
extern int func_ov002_02291160(struct FuncOv00202294a60Self *self, int arg);

int func_ov002_02294a60(struct FuncOv00202294a60Self *self, int arg) {
    if (func_ov002_021bae7c(self->b0, 0x140e, ~0) != 0) return 0;
    if (func_ov002_02280980(self->b0) > 0) return 0;
    return func_ov002_02291160(self, arg);
}
