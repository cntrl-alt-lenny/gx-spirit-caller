/* CAMPAIGN-PREP candidate for func_02095880 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard-chain + branch-merge poll loops; bind arg r4; shared epilogue (class C)
 *   risk:       the >0 branch must FALL THROUGH into the func_020953e4 tail when func_0209538c()==0 (asm shares .L_78). if mwcc duplicates the tail instead of branching, epilogue layout diverges. reshape-able / permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02095880 (main, class C) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe:  guard-chain + branch-merge poll loops; shared epilogue reg-alloc
 *   class C: decl-order of r4=arg; merge of the .L_78 tail under two predecessors
 */
/* func_02095880: r4=arg.
 *   if (func_02095344()==0) return 0;
 *   r = func_0209538c(); if (r!=0) return r;
 *   if ((arg & 1)==0) return 0;
 *   if (func_020954b4() > 0) {
 *       while (func_0209591c(0) != 0) ;
 *       r = func_0209538c(); if (r!=0) return r;
 *   } else {
 *       func_02095678(1);
 *   }
 *   func_020953e4();
 *   do { func_0209591c(1); r = func_0209538c(); } while (r==0);
 *   return r;
 * The >0 branch falls into the func_020953e4 tail when func_0209538c()==0
 * (shared .L_78 merge). */

extern int  func_02095344(void);
extern int  func_0209538c(void);
extern int  func_020953e4(void);
extern int  func_020954b4(void);
extern void func_02095678(int a);
extern int  func_0209591c(int a);

int func_02095880(int a)
{
    int r;

    if (func_02095344() == 0)
        return 0;
    r = func_0209538c();
    if (r != 0)
        return r;
    if ((a & 1) == 0)
        return 0;
    if (func_020954b4() > 0) {
        while (func_0209591c(0) != 0)
            ;
        r = func_0209538c();
        if (r != 0)
            return r;
    } else {
        func_02095678(1);
    }
    func_020953e4();
    do {
        func_0209591c(1);
        r = func_0209538c();
    } while (r == 0);
    return r;
}
