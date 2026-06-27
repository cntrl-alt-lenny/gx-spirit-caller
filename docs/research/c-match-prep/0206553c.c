/* CAMPAIGN-PREP candidate for func_0206553c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     global gate then bind list in r4; reverse do-while subs/bpl; discard func_020540d0 result
 *   risk:       reshape-able: orig RELOADS data_0219e968 (ldr r4,_LIT0) into a callee-saved reg once and reuses (ldr r0,[r4]) per pass. If mwcc reloads the literal each iter, one extra ldr diverges; global read in loop matches.
 *   confidence: med
 */
// func_0206553c — main, cls C (reverse counted loop, simple body)
// global gate data_0219e968 (a list handle). bind into r4 across loop.
// reverse: subs i; bpl. func_02065590() called with no args (r0 from func_020540d0 ignored).
extern int data_0219e968;
extern int  func_02054140(int list);
extern int *func_020540d0(int list, int i);
extern void func_02065590(void);
extern void func_0206553c(void);

extern void func_0206553c(void) {
    int i;
    if (data_0219e968 == 0)
        return;
    i = func_02054140(data_0219e968) - 1;
    if (i < 0)
        return;
    do {
        func_020540d0(data_0219e968, i);
        func_02065590();
    } while (--i >= 0);
}
