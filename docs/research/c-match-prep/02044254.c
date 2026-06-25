/* CAMPAIGN-PREP candidate for func_02044254 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl x,y in sp+0/sp+4 read order; -2 => mvn r0,#1; (x&~y) => mvn+ands
 *   risk:       reshape-able: the cmp loads x(r2) then y(r1) but compares y first (cmp r1;cmpeq r2). Fused cmpeq is order-neutral for value; if a stray branch appears, swap to (y==0&&x==0).
 *   confidence: med
 */
extern int func_02044228();
extern void func_02094688(int handle, void *dst, int len);

int func_02044254(int a, int b)
{
    int x;
    int y;

    if (func_02044228() == 0)
        return 0;
    func_02094688(a, &x, 4);
    func_02094688(b, &y, 4);
    if ((x | y) == -2)
        return 0;
    return (x & ~y) != 0;
}
