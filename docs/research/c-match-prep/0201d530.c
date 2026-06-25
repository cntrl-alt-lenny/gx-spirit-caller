/* CAMPAIGN-PREP candidate for func_0201d530 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch -> jump-table; mix of tail-calls and const returns
 *   risk:       constant cases must inline as mov #imm; default placement vs orig .L_190 may reorder table
 *   confidence: high
 */
/* func_0201d530: jump-table dispatch (cmp #9). Cases 4 and 9 return integer
 * constants (0x6400000 / 0x6600000); the rest tail-call helpers; default 0. */

extern int func_0208dd9c(void);
extern int func_0208ddec(void);
extern int func_0208de4c(void);
extern int func_0208de94(void);
extern int func_0208deec(void);
extern int func_0208df0c(void);
extern int func_0208df40(void);
extern int func_0208df60(void);

int func_0201d530(int sel) {
    switch (sel) {
    case 0: return func_0208df60();
    case 1: return func_0208df0c();
    case 2: return func_0208de94();
    case 3: return func_0208ddec();
    case 4: return 0x6400000;
    case 5: return func_0208df40();
    case 6: return func_0208deec();
    case 7: return func_0208de4c();
    case 8: return func_0208dd9c();
    case 9: return 0x6600000;
    }
    return 0;
}
