/* CAMPAIGN-PREP candidate for func_02033770 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: two-step mask to emit duplicate bic; store-then-call order
 *   risk:       Single mask folds the two `bic #0x40000` into one; split into two `&=~` statements (reshape-able). Also marshalling sig of func_02046e80 is struct-guessed.
 *   confidence: med
 */
/* func_02033770: clear a chain of flag bits in this->flags (offset 0xeb4),
 * then tail-call a marshaller passing two function pointers and `this`.
 *
 * The bic chain clears 0x2000,0x1000,0x4000,0x10000,0x40000 and then
 * 0x40000 AGAIN (a redundant second clear of the same bit). To reproduce
 * the duplicated `bic #0x40000`, the mask must be applied in two steps so
 * mwcc cannot fold the duplicate into a single immediate.
 */
extern void func_02032b30(void);
extern void func_02032bfc(void);
extern int  func_02046e80(int a, void *f0, void *self, void *f1, void *self2);

struct Obj_2033770 {
    char pad[0xeb4];
    unsigned int flags;
};

int func_02033770(struct Obj_2033770 *self, int a) {
    unsigned int v = self->flags;
    v &= ~(0x2000u | 0x1000u | 0x4000u | 0x10000u | 0x40000u);
    v &= ~0x40000u;            /* redundant second clear -> 2nd `bic #0x40000` */
    self->flags = v;
    return func_02046e80(a, (void *)func_02032b30, self,
                         (void *)func_02032bfc, self);
}
