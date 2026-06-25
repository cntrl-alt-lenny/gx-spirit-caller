/* CAMPAIGN-PREP candidate for func_022961bc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload f0 per call; hold first sum operand in r4; add then cmp#3
 *   risk:       reshape-able: each call re-reads ldrh [r4,#2] (4 reloads); if mwcc caches flags in a callee-saved reg the ldrh count drops — keep `obj->flags & 1` inline at every call site, no local.
 *   confidence: med
 */
// func_ov002_022961bc — sum of two call results, cmp>=3
typedef struct Obj Obj;
struct Obj { unsigned short pad0; unsigned short flags; };

extern int func_ov002_021ba294(int f0);
extern int func_ov002_021bbf50(int f0);
extern int func_ov002_021c3bdc(int f0);
extern int func_ov002_02281994(int f0);

int func_ov002_022961bc(Obj *obj)
{
    int a, b;

    if (func_ov002_021ba294(obj->flags & 1) < 0)
        return 0;
    if (func_ov002_02281994(obj->flags & 1) != 0)
        return 0;

    a = func_ov002_021bbf50(obj->flags & 1);   /* held in r4 */
    b = func_ov002_021c3bdc(obj->flags & 1);
    if (a + b >= 3)
        return 1;
    return 0;
}
