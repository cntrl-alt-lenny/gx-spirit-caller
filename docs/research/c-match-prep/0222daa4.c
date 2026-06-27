/* CAMPAIGN-PREP candidate for func_0222daa4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl j(r7) before i(r8); hoist consts r5=2,r4=0 before loops; f0 via ldrh r2/r3
 *   risk:       orig pins the stack-stored args (#2 at sp, #0 at sp+4) and reloads self->f0 via ldrh inside body; loop-invariant const placement (r5=2,r4=0 set pre-loop) is the divergence. permuter-class (invariant hoist + counter reg pairing).
 *   confidence: med
 */
/* func_ov002_0222daa4: nested loop player j=0..1, slot i=0..4; for each, if
 * 0225764c(self,j,i) passes and 021b3ecc(j,i,self->f0) is clear, emit
 * 021d5a08(self,j,i,self->f0, 2, 0); then notify 021e276c(f2.bit0,f0,1,0). */
typedef unsigned short u16;
struct F0222daa4_F2 { u16 bit0:1; u16 rest:15; };
struct F0222daa4_Self { u16 f0; struct F0222daa4_F2 f2; };
extern int  func_ov002_0225764c(void *self, int j, int i);
extern int  func_ov002_021b3ecc(int j, int i, int f0);
extern void func_ov002_021d5a08(void *self, int j, int i, int f0, int two, int zero);
extern void func_ov002_021e276c(int bit0, int f0, int one, int zero);

int func_ov002_0222daa4(struct F0222daa4_Self *self) {
    int j, i;
    for (j = 0; j < 2; j++) {
        for (i = 0; i < 5; i++) {
            if (func_ov002_0225764c(self, j, i) != 0 &&
                func_ov002_021b3ecc(j, i, self->f0) == 0) {
                func_ov002_021d5a08(self, j, i, self->f0, 2, 0);
            }
        }
    }
    func_ov002_021e276c(self->f2.bit0, self->f0, 1, 0);
    return 0;
}
