/* CAMPAIGN-PREP candidate for func_0206c46c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movs r4 alloc guard, mvneq ~0x30=-49; func ptr arg0; obj kept in r4
 *   risk:       _LIT0 = func_0206c3f4 (code address) passed as func_0206bf94's first arg. mwcc must emit `ldr r0,=func_0206c3f4`; passing it as a plain function reference should match. reshape-able (cast types if the ldr literal pool ordering differs).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0206c46c (main, class C) - brief 494.
 * UNVERIFIED build-free draft. recipe: alloc-guard early return (mvneq ~0x30
 * = -49); pass func_0206c3f4 as a callback address; two calls reusing obj
 * in r4; return obj.
 */
/* obj=func_0206c380(); if(!obj) return -49;
 * r=func_0206bf94(func_0206c3f4, obj, 1); func_0206be28(obj, r); return obj. */

extern void *func_0206c380(void);
extern int  func_0206c3f4(void);
extern int  func_0206bf94(int (*cb)(void), void *obj, int n);
extern void func_0206be28(void *obj, int r);

void *func_0206c46c(void)
{
    void *obj = func_0206c380();
    int r;
    if (obj == 0)
        return (void *)-49;
    r = func_0206bf94(func_0206c3f4, obj, 1);
    func_0206be28(obj, r);
    return obj;
}
