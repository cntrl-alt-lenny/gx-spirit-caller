/* CAMPAIGN-PREP candidate for func_0206a9bc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     teardown call-sequence + guarded free + clear
 *   risk:       None observed: byte-exact. field f4 (the freed handle) offset 0x4 guessed from str [r4,#0x4].
 *   confidence: high
 */
/* func_0206a9bc (default mwcc 2.0/sp1p5).
 * Teardown: run three sub-teardowns over p, then guarded-free p->f4 and
 * clear it. VERIFIED byte-exact vs target (push {r4,lr}; pop {r4,pc}). */
extern void func_0206a9f4(void *p);
extern void func_0206b51c(void *p);
extern void func_02068b44(void *p);
extern void func_020540d4(int h);

struct S { int f0; int f4; };

void func_0206a9bc(struct S *p) {
    func_0206a9f4(p);
    func_0206b51c(p);
    func_02068b44(p);
    if (p->f4 != 0) func_020540d4(p->f4);
    p->f4 = 0;
}
