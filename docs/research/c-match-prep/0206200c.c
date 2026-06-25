/* CAMPAIGN-PREP candidate for func_0206200c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r4=p; flag==0 sets state_c=6 then b48; state_c>=7 ldmge early-out; 4-call seq
 *   risk:       orig calls func_02061fa4 with stale r0 (NOT reloaded to p before bl) — r0 still =p from entry. mwcc will mov r0,r4 redundantly unless it tracks r0==p. Likely 1 extra mov before first bl. reshape-able? actually permuter-class (scheduling of r0).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206200c (main, class C) — brief 496.
 * UNVERIFIED build-free draft. MED tier: byte-match not expected first build.
 *   recipe: bind r4=p; arg1==0 branch sets state+tail-call; else state>=7 early-out, run 4-call seq
 */
/* func_0206200c: if the flag arg is zero, set state field +0xc to 6 and tail
 * into func_02062b48; otherwise, when state < 7, run the shutdown sequence
 * (func_02061fa4, func_020628fc, func_02061a8c(p,0), func_02064790). State
 * >= 7 returns immediately. */

extern void func_02061a8c(void *p, int a);
extern void func_02061fa4(void *p);
extern void func_020628fc(void *p);
extern int  func_02062b48(void *p);
extern void func_02064790(void *p);

typedef struct Obj { char _pad_00[0xc]; int state_c; } Obj;

void func_0206200c(Obj *p, int flag) {
    if (flag == 0) {
        p->state_c = 6;
        func_02062b48(p);
        return;
    }
    if (p->state_c >= 7) return;
    func_02061fa4(p);
    func_020628fc(p);
    func_02061a8c(p, 0);
    func_02064790(p);
}
