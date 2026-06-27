/* CAMPAIGN-PREP candidate for func_02063a4c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl lo,delta,best first; bind self in r9; min-update if-assign (movle); reload field_5c each call
 *   risk:       reshape-able: orig keeps lo(r7),delta(r6),best(r8) in callee-saved across loop and reloads p[0] after store before p[0]+p[1]; if mwcc CSEs p[0] the post-store ldr vanishes. Read p[0] fresh after the store.
 *   confidence: med
 */
// func_02063a4c — main, cls C (single counted scan loop, min-update, bind base)
// r9 = self* bound across fn. r7=lo, r6=delta from arg e[0]/e[1].
// min-update: cmp r8, v; movle r8, v  => if (best < v) best = v  (signed).
typedef struct Self Self;
struct Self {
    char _44[0x44];
    int field_44;  // [+0x44]
    char _48[0x14];
    int field_5c;  // [+0x5c]
};
struct Pair { int lo; int delta; };
extern void func_02053e58(int list, int sel);
extern int  func_02054140(int list);
extern int *func_020540d0(int list, int i);
extern void func_0206133c(void *dst, int lo, int delta);
extern int  func_02063a4c(Self *self, struct Pair *e, int sel);

extern int func_02063a4c(Self *self, struct Pair *e, int sel) {
    int lo = e->lo;
    int delta = e->delta;
    int best = 0;
    int n, i;
    func_02053e58(self->field_5c, sel);
    n = func_02054140(self->field_5c);
    if (n > 0) {
        i = 0;
        do {
            int *p = func_020540d0(self->field_5c, i);
            if (p[0] > lo) {
                p[0] -= delta;
                {
                    int v = p[0] + p[1];
                    if (best < v)
                        best = v;
                }
            }
        } while (++i < n);
    }
    func_0206133c(&self->field_44, lo, delta);
    return best;
}
