/* CAMPAIGN-PREP candidate for func_02294558 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0, func_02280df4(self,b0,~0,0), 3-cond && guard chain to shared ret-0
 *   risk:       last !=0 may predicate vs branch to shared epilogue; >= vs sign-test instruction shape
 *   confidence: med
 */
/* func_ov002_02294558: 3-guard AND chain -> return 1, else shared 0 (.L_60).
 *
 *     ldrh; b0 ; bl func_02280df4(self, b0, -1, 0)
 *     movs r1,r0; bmi .L_60                 -> ret >= 0
 *     ldrh; b0 ; bl func_021c8470(b0); cmp r0,#0x514; bge .L_60 -> ret < 0x514
 *     mov r0,r5; mov r1,r4; bl func_02291160(self, arg); cmp#0; movne#1; popne
 *  .L_60: mov r0,#0; pop
 */

typedef unsigned short u16;

struct FuncOv00202294558Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_021c8470(unsigned int b0);
extern int func_ov002_02280df4(struct FuncOv00202294558Self *self, unsigned int b0, int mask, unsigned int zero);
extern int func_ov002_02291160(struct FuncOv00202294558Self *self, int arg);

int func_ov002_02294558(struct FuncOv00202294558Self *self, int arg) {
    if (func_ov002_02280df4(self, self->b0, ~0, 0) >= 0
     && func_ov002_021c8470(self->b0) < 0x514
     && func_ov002_02291160(self, arg) != 0) return 1;
    return 0;
}
