/* CAMPAIGN-PREP candidate for func_0201b5d0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Two counted loops, helper call with (i + const) arg
 *   risk:       mwcc may strength-reduce to count the passed value directly instead of i+const; low risk.
 *   confidence: high
 */
/* func_0201b5d0: two counted loops calling a helper.
 *   GetSystemWork() (discarded);
 *   for (i = 0; i < 5;  i++) func_0201b504(i + 1);
 *   for (i = 0; i < 16; i++) func_0201b504(i + 0x11);
 */

extern char *GetSystemWork(void);
extern void func_0201b504(int x);

void func_0201b5d0(void) {
    int i;
    GetSystemWork();
    for (i = 0; i < 5; i++) {
        func_0201b504(i + 1);
    }
    for (i = 0; i < 16; i++) {
        func_0201b504(i + 0x11);
    }
}
