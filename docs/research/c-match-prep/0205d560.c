/* CAMPAIGN-PREP candidate for func_0205d560 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-arg pack (store order p,arg1,arg2) then call, bool-negate
 *   risk:       store order is str sp[4]=r1, sp[8]=r2, sp[0]=r0 — mwcc may emit a different order than a,b,c init; base[0x10a]=[r3,#0x428]; pack only 3 words used of 0xc.
 *   confidence: low
 */
extern int func_02054338(int a, void *fn, void *args);
extern void func_0205d5a0(void);

struct A5d560 { int a, b, c, d; };

int func_0205d560(int *r0, int r1, int r2) {
    struct A5d560 pack;
    int *base = (int *)r0[0];
    pack.a = (int)r0;
    pack.b = r1;
    pack.c = r2;
    if (func_02054338(base[0x10a], (void *)func_0205d5a0, &pack) == 0) {
        return 1;
    }
    return 0;
}
