/* CAMPAIGN-PREP candidate for func_020955e8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     poll-retry; bind arg in r5 across 4 reloads; shared early-return epilogue (class C)
 *   risk:       prologue has bare `sub sp,#4`/`add sp,#4` with no local -> needs legacy_sp3 file routing; default 2.0 O4 likely omits the slot. reshape-able via *.legacy_sp3.c filename.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020955e8 (main, class C) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe:  poll-retry; repeated early-return epilogues; sub sp,#4 routing
 *   class C: shared epilogue reg-alloc; bind arg in r5 across 4 reloads
 */
/* func_020955e8: r5=arg. Guard func_02095554(arg)!=0 -> return. Spin
 * func_0209591c(0) until 0. Re-check func_02095554(arg)!=0 -> return.
 * func_020953e4(). Re-check again -> return. Spin func_0209591c(1) until
 * func_02095554(arg)==0. The empty stack slot (sub sp,#4) implies legacy_sp3
 * routing -- save as func_020955e8.legacy_sp3.c if main-tree O4 won't emit it. */

extern int  func_020953e4(void);
extern int  func_02095554(int a);
extern int  func_0209591c(int a);

void func_020955e8(int a)
{
    if (func_02095554(a) != 0)
        return;
    while (func_0209591c(0) != 0)
        ;
    if (func_02095554(a) != 0)
        return;
    func_020953e4();
    if (func_02095554(a) != 0)
        return;
    do {
        func_0209591c(1);
    } while (func_02095554(a) != 0);
}
