/* CAMPAIGN-PREP candidate for func_02051ab0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain + tail returns, RELOAD global; reuse saved args
 *   risk:       field 0xe4 word(ptr); func_02068cc8(p,r6)/func_02068a20(_,r5,r4) arg slots; default-arg passthrough r4
 *   confidence: med
 */
/* func_02051ab0 -> src/main/func_02051ab0.c (mwcc 2.0/sp1p5 default) */
typedef struct {
    char _pad[0xe4];
    int  fe4;   /* +0xe4 */
} State;
extern State *func_020498f0(void);
extern int   func_02045280(void);
extern int   func_02068cc8(int, int);
extern int   func_02068a20(int, int, int);

int func_02051ab0(int a, int b, int c) {
    int r = c;
    if (func_020498f0() != 0 && func_02045280() != 0) {
        if (func_02068cc8(func_020498f0()->fe4, a) != 0)
            r = func_02068a20(func_020498f0()->fe4, b, c);
    }
    return r;
}
