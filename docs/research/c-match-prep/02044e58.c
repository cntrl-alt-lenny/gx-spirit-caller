/* CAMPAIGN-PREP candidate for func_02044e58 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     struct copy dst+8->dst+0 then buf+8->dst+8 in that store-order; &dst->p1 reused (ip); arg1 callee-saved
 *   risk:       struct-guessed: relies on Pair being copied via ldmia/stmia and &dst->p1 (ip) computed once for both load+store; confirm Buf/Dst offsets. Store-order (p0 before p1) must not be reordered.
 *   confidence: med
 */
typedef struct { int lo, hi; } Pair;

typedef struct {
    Pair p0;
    Pair p1;
    short e, f;
} Buf;

typedef struct {
    Pair p0;
    Pair p1;
    int flag;
} Dst;

extern int func_02044528(void *a, void *b);
extern void func_02044610(void *buf);

int func_02044e58(Dst *dst, void *arg1)
{
    Buf buf;

    func_02044610(&buf);
    dst->p0 = dst->p1;
    dst->p1 = buf.p1;
    return func_02044528(dst, arg1) != 0;
}
