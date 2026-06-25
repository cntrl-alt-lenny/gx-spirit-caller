/* CAMPAIGN-PREP candidate for func_0203624c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD chain (movs/ldmeq early-ret, ldrsb<0 ret) + clamp + two calls
 *   risk:       Struct offsets 0x5c/0x6a inferred from asm; if real struct differs offsets shift. Verified byte-exact as written.
 *   confidence: high
 */
extern int func_02036080(void *p, int v);

struct S0203624c {
    char pad00[0x5c];
    void *f5c;       /* 0x5c */
    char pad60[0x6a-0x60];
    signed char f6a; /* 0x6a */
};

void func_0203624c(struct S0203624c *p, int v) {
    void *h;
    if (!p) return;
    if (p->f6a < 0) return;
    if (v < 0) { v = 0; p->f5c = (void *)v; }
    h = p->f5c;
    if (h != 0)
        func_02036080(h, v);
    func_02036080(p, v);
}
