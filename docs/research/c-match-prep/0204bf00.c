/* CAMPAIGN-PREP candidate for func_0204bf00 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two byte-cmp early-returns (f15==2/==3) + two void tail calls
 *   risk:       f15 offset; func_0204bf44(1) is a plain call (not return) before epilogue
 *   confidence: high
 */
/* func_0204bf00: if acc()->f15 == 2 return; if acc()->f15 == 3 return;
 * func_0204bd8c(); func_0204bf44(1);  (acc reloaded for each guard) */

typedef struct {
    char          _pad0[0x15];
    unsigned char f15; /* +0x15 */
} State0204bf00;

extern State0204bf00 *func_020498f0(void);
extern void func_0204bd8c(void);
extern void func_0204bf44(int a);

void func_0204bf00(void) {
    if (func_020498f0()->f15 == 2) return;
    if (func_020498f0()->f15 == 3) return;
    func_0204bd8c();
    func_0204bf44(1);
}
