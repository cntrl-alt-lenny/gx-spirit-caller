/* CAMPAIGN-PREP candidate for func_0201d460 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch -> jump-table; tail-call cases returning result
 *   risk:       case4 & default share the mov r0,#0/return slot; mwcc may not fold both into one label as orig
 *   confidence: high
 */
/* func_0201d460: jump-table dispatch (cmp #8) -> tail-call helpers, returning
 * each helper's result; cases 4 and default return 0. The selector value is
 * left in r0 into each call (helpers declared (void) so r0 is not reloaded). */

extern int func_0208deac(void);
extern int func_0208df2c(void);
extern int func_0208dfb8(void);
extern int func_0208e038(void);
extern int func_0208e0c4(void);
extern int func_0208e0e4(void);
extern int func_0208e118(void);
extern int func_0208e138(void);

int func_0201d460(int sel) {
    switch (sel) {
    case 0: return func_0208e138();
    case 1: return func_0208e0e4();
    case 2: return func_0208e038();
    case 3: return func_0208df2c();
    case 4: break;
    case 5: return func_0208e118();
    case 6: return func_0208e0c4();
    case 7: return func_0208dfb8();
    case 8: return func_0208deac();
    }
    return 0;
}
