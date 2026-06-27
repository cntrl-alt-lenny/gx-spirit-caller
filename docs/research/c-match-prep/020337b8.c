/* CAMPAIGN-PREP candidate for func_020337b8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: single-mask clear (no dup here); store before tail-call
 *   risk:       mwcc may split/reorder the 5 bic immediates (orig nests ip->r1->r3->r1->r1); a constant-fold or different split diverges. permuter-class for the bic register chain; sig struct-guessed.
 *   confidence: med
 */
/* func_020337b8: sibling of func_02033770 with a SHORTER bic chain and a
 * different marshaller (func_02046c88). Clears 0x2000,0x1000,0x4000,0x10000,
 * 0x40000 (no duplicate here), stores back, then tail-calls passing the
 * same two fn-ptrs and `this` (5th stacked arg).
 */
extern void func_02032b30(void);
extern void func_02032bfc(void);
extern int  func_02046c88(int a, void *f0, void *self, void *f1, void *self2);

struct Obj_20337b8 {
    char pad[0xeb4];
    unsigned int flags;
};

int func_020337b8(struct Obj_20337b8 *self, int a) {
    unsigned int v = self->flags;
    v &= ~(0x2000u | 0x1000u | 0x4000u | 0x10000u | 0x40000u);
    self->flags = v;
    return func_02046c88(a, (void *)func_02032b30, self,
                         (void *)func_02032bfc, self);
}
