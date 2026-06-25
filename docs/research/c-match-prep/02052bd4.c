/* CAMPAIGN-PREP candidate for func_02052bd4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag-track + sign-test, conditional-move ladder to 0/1/2/3
 *   risk:       movne-before-moveq order: orig tests flag!=0 (movne first); ternary may emit moveq/movne swapped vs orig, a coin-flip diff.
 *   confidence: med
 */
extern void func_02000b60(int x);
extern int func_020448d8(int a);
extern int func_02044c10(void);
extern void func_02044ea8(int a);

int func_02052bd4(int a) {
    int r5;
    int flag = 0;
    func_02000b60(0x02000b8c);
    r5 = func_020448d8(a);
    if (func_02044c10() != 0) {
        func_02044ea8(a);
        flag = 1;
    }
    if (r5 < 0) {
        return flag ? 2 : 3;
    }
    return flag ? 1 : 0;
}
