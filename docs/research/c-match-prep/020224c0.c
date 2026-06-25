/* CAMPAIGN-PREP candidate for func_020224c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch + nested guard + two tail-ish calls
 *   risk:       branch ordering of the x<0x20 split (blt vs bge first) may flip; the unused base arg in case 0/default could be optimized differently
 *   confidence: med
 */
/* func_020224c0: switch(sel): case 0 -> x; case 1 -> (x<0x20 ?
 * func_0202224c(x) : func_02022270(base, x-0x20)); default -> 0.
 * result preinitialised to 0 before the switch (mov r3,#0). */
extern int func_0202224c(int idx);
extern int func_02022270(char *base, int i);

int func_020224c0(char *base, int sel, int x) {
    int result = 0;
    switch (sel) {
    case 0:
        result = x;
        break;
    case 1:
        if (x < 0x20) {
            result = func_0202224c(x);
        } else {
            result = func_02022270(base, x - 0x20);
        }
        break;
    }
    return result;
}
