/* CAMPAIGN-PREP candidate for func_020736ac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested for; hoist 0x64 & global addr; first-used-first-decl i then j
 *   risk:       Orig hoists 0x64 into r5 and &data_0219ef1c into r4 ABOVE the outer loop and resets j from a zeroed r6; mwcc may rematerialise the address each inner iter (extra ldr) or not reuse r6 — reshape-able by hoisting a local 'volatile-free' base only if mwcc cooperates, else permuter.
 *   confidence: med
 */
/* func_020736ac: nested counted retry loops around a stepper.
 * arg0=r9=ctx. Outer i: 0..8, inner j: 0..20.
 *  for(i=0;i<8;i++){
 *    func_02073738(ctx);
 *    for(j=0;j<20;j++){
 *      if(data_0219ef1c == 0) return 0;     // global abort
 *      func_02091768(0x64);                 // delay/yield 100
 *      if(func_02073838(ctx) != 0) return 0;// stepper done -> bail 0
 *    }
 *  }
 *  return 0;
 *
 * Loop-invariant consts hoisted: r5=0x64 (delay arg), r4=&data_0219ef1c,
 * r8=i, r7=j, r6=0 reused for inner reset. Inner j resets from r6(=0)
 * each outer pass (mov r7,r6).  Both early-exits return 0; the natural
 * fallthrough also returns 0.
 */

extern int  data_0219ef1c;
extern void func_02073738(int ctx);
extern int  func_02073838(int ctx);
extern void func_02091768(int delay);

int func_020736ac(int ctx) {
    int i, j;

    for (i = 0; i < 8; i++) {
        func_02073738(ctx);
        for (j = 0; j < 20; j++) {
            if (data_0219ef1c == 0) return 0;
            func_02091768(0x64);
            if (func_02073838(ctx) != 0) return 0;
        }
    }
    return 0;
}
