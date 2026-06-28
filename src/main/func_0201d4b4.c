/* CAMPAIGN-PREP candidate for func_0201d4b4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch -> jump-table; tail-call cases returning result
 *   risk:       case4 & default share the mov r0,#0/return slot; mwcc may not fold both into one label as orig
 *   confidence: high
 */
/* func_0201d4b4: jump-table dispatch (cmp #8) -> tail-call helpers, returning
 * each helper's result; cases 4 and default return 0. The selector value is
 * left in r0 into each call (helpers declared (void) so r0 is not reloaded). */

extern int func_0208df94(void);
extern int func_0208e014(void);
extern int func_0208e0a0(void);
extern int func_0208e120(void);
extern int func_0208e1ac(void);
extern int func_0208e1cc(void);
extern int func_0208e200(void);
extern int func_0208e220(void);

int func_0201d4b4(int sel) {
    switch (sel) {
    case 0: return func_0208e220();
    case 1: return func_0208e1cc();
    case 2: return func_0208e120();
    case 3: return func_0208e014();
    case 4: break;
    case 5: return func_0208e200();
    case 6: return func_0208e1ac();
    case 7: return func_0208e0a0();
    case 8: return func_0208df94();
    }
    return 0;
}
