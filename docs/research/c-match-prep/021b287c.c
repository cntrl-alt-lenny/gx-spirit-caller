/* CAMPAIGN-PREP candidate for func_021b287c (ov016, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: two stack out-params (sp+4 = x, sp+0 = y) ordered as in asm; box reads ldrh/ldrb in field order; compares bgt/ble emitted by the >, <= form shown.
 *   risk:       reshape-able: stack temp ordering -- orig puts first out-param at sp+0x4, second at sp+0x0, so declare x BEFORE y (first-used-first). If mwcc swaps the two stack slots the &x/&y args to 02006110 invert. The final ble/movgt fused return may rotate (permuter-class) but compare order is reshape-able.
 *   confidence: med
 */
/* func_ov016_021b287c: point/AABB hit test. Fetch two reference coords into stack temps
 * via 02006110(&x,&y); a guard 020061ac() must be nonzero; then test the object's box
 * (x0=ldrh[0], w=ldrb[4]; y0=ldrh[2], h=ldrb[5]) strictly contains (x,y). Returns 1 on hit. */
extern void func_02006110(int *px, int *py);
extern int  func_020061ac(void);

struct box016 { unsigned short x0; unsigned short y0; unsigned char w; unsigned char h; };

int func_ov016_021b287c(int obj)
{
    struct box016 *b = (struct box016 *)obj;
    int x, y;
    func_02006110(&x, &y);
    if (func_020061ac() == 0) return 0;
    if (b->x0 > x) return 0;
    if (b->x0 + b->w <= x) return 0;
    if (b->y0 > y) return 0;
    if (b->y0 + b->h > y) return 1;
    return 0;
}
