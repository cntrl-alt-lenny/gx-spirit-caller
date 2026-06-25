/* CAMPAIGN-PREP candidate for func_0204fc38 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear search loop, early return, tail call (RELOAD global)
 *   risk:       field 0xf4 is word array; func_0204fa7c(i,count) arg order; ble/blt loop shape
 *   confidence: med
 */
/* func_0204fc38 -> src/main/func_0204fc38.c (mwcc 2.0/sp1p5 default) */
typedef struct {
    char _pad[0xf4];
    int  arr[1];   /* +0xf4, word-indexed */
} State;
extern State *func_020498f0(void);
extern void  func_0204fa7c(int idx, int n);

int func_0204fc38(int key, int n) {
    int i;
    if (func_020498f0() == 0)
        return 0;
    if (n <= 0)
        return 0;
    for (i = 0; i < n; i++) {
        if (key == func_020498f0()->arr[i]) {
            func_0204fa7c(i, n);
            return 1;
        }
    }
    return 0;
}
