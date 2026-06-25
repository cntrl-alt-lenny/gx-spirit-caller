/* CAMPAIGN-PREP candidate for func_0222c590 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hoist consts r5=0xfa7,r9=1,r4=0 before loop; bit0 reloaded each iter; <=4 loop
 *   risk:       Loop hoists 0xfa7/1/0 into callee-saved regs (r5,r9,r4) across iterations; if mwcc rematerialises them inside the loop the ldr/mov placement diverges. permuter-class (loop-invariant reg pinning vs reload).
 *   confidence: med
 */
/* func_ov002_0222c590: if self->f4 bit2 set, skip straight to tail; else if
 * f2.kind6 != 0x23 run a 5-iteration (0..4) scan calling a per-slot chain
 * (021b9ecc->0202df78 gate, 021c1e44 gate, 021d59cc body) then notify
 * 021e276c; always tail 0220e75c(self, arg). */
typedef unsigned short u16;
struct F0222c590_F2 { u16 bit0:1; u16 pad5:5; u16 kind6:6; u16 rest:4; };
struct F0222c590_F4 { u16 pad2:2; u16 b2:1; u16 rest:13; };
struct F0222c590_Self { u16 f0; struct F0222c590_F2 f2; struct F0222c590_F4 f4; };
extern int  func_ov002_021b9ecc(int bit0, int i);
extern int  func_0202df78(int a, int b);
extern int  func_ov002_021c1e44(void *self, int bit0, int i);
extern void func_ov002_021d59cc(int bit0, int i, int f0, int one, int zero);
extern void func_ov002_021e276c(int bit0, int f0, int one, int zero);
extern int  func_ov002_0220e75c(void *self, int arg);

int func_ov002_0222c590(struct F0222c590_Self *self, int arg) {
    if (self->f4.b2 == 0) {
        if (self->f2.kind6 != 0x23) {
            int i;
            for (i = 0; i <= 4; i++) {
                if (func_0202df78(func_ov002_021b9ecc(self->f2.bit0, i), 0xfa7) != 0 &&
                    func_ov002_021c1e44(self, self->f2.bit0, i) != 0) {
                    func_ov002_021d59cc(self->f2.bit0, i, self->f0, 1, 0);
                }
            }
            func_ov002_021e276c(self->f2.bit0, self->f0, 1, 0);
        }
    }
    return func_ov002_0220e75c(self, arg);
}
