/* CAMPAIGN-PREP candidate for func_0201d4dc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch -> jump-table; mix of tail-calls and const returns
 *   risk:       constant cases must inline as mov #imm; default placement vs orig .L_190 may reorder table
 *   confidence: high
 */
/* func_0201d4dc: jump-table dispatch (cmp #9). Cases 4 and 9 return integer
 * constants (0x6400000 / 0x6600000); the rest tail-call helpers; default 0. */

extern int func_0208dcb4(void);
extern int func_0208dd04(void);
extern int func_0208dd64(void);
extern int func_0208ddac(void);
extern int func_0208de04(void);
extern int func_0208de24(void);
extern int func_0208de58(void);
extern int func_0208de78(void);

int func_0201d4dc(int sel) {
    switch (sel) {
    case 0: return func_0208de78();
    case 1: return func_0208de24();
    case 2: return func_0208ddac();
    case 3: return func_0208dd04();
    case 4: return 0x6400000;
    case 5: return func_0208de58();
    case 6: return func_0208de04();
    case 7: return func_0208dd64();
    case 8: return func_0208dcb4();
    case 9: return 0x6600000;
    }
    return 0;
}
