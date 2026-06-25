/* CAMPAIGN-PREP candidate for func_0209e0f0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     forwarded-args call + predicated ==0 halfword store
 *   risk:       func is void/return unclear (no value set on the non-eq path) — returning a here is a guess; f16 offset guessed; def8 arity guessed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209e0f0 (main, class A) — front-load.
 * UNVERIFIED build-free draft.
 *   recipe:     pass-through call (args r0,r1 forwarded) + constant r2 + predicated halfword store on ==0
 *   risk:       func_0209def8 arg count = 3 (r0,r1 forwarded, r2=0xf00); data_021a8d2c single-deref Outer.f16(0x16,u16) guessed
 */
extern int func_0209def8(int a, int b, int c);

struct Outer { char _pad0[0x16]; unsigned short f16; };
extern struct Outer *data_021a8d2c;

int func_0209e0f0(int a, int b) {
    if (func_0209def8(a, b, 0xf00) == 0) {
        data_021a8d2c->f16 = 0;
    }
    return a;
}
