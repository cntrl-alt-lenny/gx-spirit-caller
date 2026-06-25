/* CAMPAIGN-PREP candidate for func_022a1890 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl a before b; read f34 pre-call (callee-saved); if-assign range bools
 *   risk:       a-range bool duplicated 3x (orig does too) but mwcc may CSE or reorder the cmp/movlt idiom; f34 must stay callee-saved across a16b0 call. reshape-able (if-assign); residual permuter-class
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a1890 (ov002, class C, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Point-in-region predicate, 3 modes on self->f04.
 * Point x@sp+4, y@sp+0. f34 loaded BEFORE the a16b0 call (callee-saved across).
 *   recipe: decl a before b (slot order); read f34 before call (cross-call live); if-assign range bools.
 */
extern void func_0200612c(int *x, int *y);
extern void func_02006110(int *x, int *y);
extern int  func_ov002_022a16b0(void *self);

typedef struct {
    char _p00[0x4];
    int  f04;          /* +0x04 mode discriminant */
    char _p08[0x2c];
    int  f34;          /* +0x34 span count */
} Obj_022a1890;

int func_ov002_022a1890(Obj_022a1890 *self, int flag)
{
    int a, b;
    int f34, base, mode;
    int hit;

    if (flag) func_02006110(&a, &b);
    else      func_0200612c(&a, &b);

    f34  = self->f34;
    base = func_ov002_022a16b0(self);
    mode = self->f04;

    if (mode < 0) {
        int in = 0;
        if (a >= 0x10 && a < 0xf0) in = 1;
        if (!in) return 0;
        hit = 0;
        if (b >= base && b < base + f34 * 8 - 6) hit = 1;
        return hit;
    }

    if (mode == 0xb) {
        int in = 0;
        if (a >= 0x10 && a < 0xf0) in = 1;
        return in;
    }

    {
        int in = 0;
        if (a >= 0x10 && a < 0xf0) in = 1;
        if (!in) return 0;
        hit = 0;
        if (b >= base && b < base + f34 * 8) hit = 1;
        return hit;
    }
}
