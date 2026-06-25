/* CAMPAIGN-PREP candidate for func_022301cc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     nested 2x5 counted loop, guarded call w/ stack args, bitfield tail
 *   risk:       stack consts 2/0 must hoist into callee-saved regs (orig holds them across the loop); 021d5a08 6-arg shape.
 *   confidence: med
 */
/* func_ov002_022301cc: for i<2,j<5: if 0225764c(self,i,j) then
 * 021d5a08(self,i,j,self->f0,2,0). after: 021e276c(b0,f0,1,0). return 0. */
typedef unsigned short u16;

struct S022301cc { u16 f0; u16 b0 : 1; u16 _r : 15; };

extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021d5a08(void *self, int a, int b, int c, int d, int e);
extern void func_ov002_021e276c(int a0, u16 a1, int a2, int a3);

int func_ov002_022301cc(struct S022301cc *self) {
    int i, j;
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 5; j++) {
            if (func_ov002_0225764c(self, i, j))
                func_ov002_021d5a08(self, i, j, self->f0, 2, 0);
        }
    }
    func_ov002_021e276c(self->b0, self->f0, 1, 0);
    return 0;
}
