/* CAMPAIGN-PREP candidate for func_0209e788 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bind singleton + guards + clear + memcpy g->f4
 *   risk:       g->f4 must reload twice; if mwcc binds f4 to a reg one ldr drops; Outer.f4 offset 0x4 guessed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209e788 (main, class A) — front-load.
 * UNVERIFIED build-free draft.
 *   recipe:     bind singleton (callee-saved) + guard-return r + null-arg guard + clear then memcpy of g->f4
 *   risk:       g held in r4 (bound) but g->f4 RELOADED each call; Outer.f4(0x4) is a 0x7c0-byte buffer; arg src in r5
 */
extern void *func_0209dca8(void);
extern int  func_0209dc8c(void);
extern void func_020928cc(void *p, int n);
extern void func_02094550(void *dst, void *src, int n);

struct Outer { char _pad0[0x4]; void *f4; };

int func_0209e788(void *src) {
    struct Outer *g = (struct Outer *)func_0209dca8();
    int r = func_0209dc8c();
    if (r != 0) return r;
    if (src == 0) return 6;
    func_020928cc(g->f4, 0x7c0);
    func_02094550(g->f4, src, 0x7c0);
    return 0;
}
