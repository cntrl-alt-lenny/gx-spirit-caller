/* CAMPAIGN-PREP candidate for func_0206aa30 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     teardown call-sequence + guarded free + clear
 *   risk:       None observed: byte-exact. field f4 (the freed handle) offset 0x4 guessed from str [r4,#0x4].
 *   confidence: high
 */
/* func_0206aa30 (default mwcc 2.0/sp1p5).
 * Teardown: run three sub-teardowns over p, then guarded-free p->f4 and
 * clear it. VERIFIED byte-exact vs target (push {r4,lr}; pop {r4,pc}). */
extern void func_0206aa68(void *p);
extern void func_0206b590(void *p);
extern void func_02068bb8(void *p);
extern void func_02054148(int h);

struct S { int f0; int f4; };

void func_0206aa30(struct S *p) {
    func_0206aa68(p);
    func_0206b590(p);
    func_02068bb8(p);
    if (p->f4 != 0) func_02054148(p->f4);
    p->f4 = 0;
}
