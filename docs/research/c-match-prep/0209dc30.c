/* CAMPAIGN-PREP candidate for func_0209dc30 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-return + clear + unsigned<=1 ternary, reload global
 *   risk:       must RELOAD data/->f4 twice (not bind); if mwcc CSEs the second deref the ldr-chain count drops; field offsets guessed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209dc30 (main, class A) — front-load.
 * UNVERIFIED build-free draft.
 *   recipe:     guard-return r; clear helper; unsigned (<=1?3:0) conditional-mov ternary; RELOAD global each use
 *   risk:       data_021a8d2c and ->f4 are RELOADED (kept as separate exprs); Outer.f4(0x4)/Inner.f0(0x0,u16) guessed
 */
extern int  func_0209dc8c(void);
extern void func_020928cc(void *p, int k);

struct Inner { unsigned short f0; };
struct Outer { char _pad0[0x4]; struct Inner *f4; };
extern struct Outer *data_021a8d2c;

int func_0209dc30(void) {
    int r = func_0209dc8c();
    if (r != 0) return r;
    func_020928cc(data_021a8d2c->f4, 2);
    return data_021a8d2c->f4->f0 <= 1 ? 3 : 0;
}
