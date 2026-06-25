/* CAMPAIGN-PREP candidate for func_0209f7fc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain validator, 4-reg calls, (r==0?2:r)
 *   risk:       g->f4->f10 reload vs bind; unsigned cc/eq guard ordering; Inner.f10 offset 0x10 guessed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209f7fc (main, class A) — front-load.
 * UNVERIFIED build-free draft.
 *   recipe:     linear guard-chain validator (all 4-reg calls, no stack marshalling); clear+guard ==1; unsigned<0x10 + ==0 guards; (r==0?2:r) tail
 *   risk:       func_0209dd30 here takes 4 reg args (vs 6 in f720); Inner.f10(0x10,int) offset guessed
 */
extern void *func_0209dca8(void);
extern int  func_0209db88(int a, int b);
extern void func_020928cc(void *p, int n);
extern void func_020928e8(int a, int b);
extern void func_0209de5c(int idx, int b);
extern int  func_0209dd30(int a, int b, int c, int d);

struct Inner { char _pad0[0x10]; int f10; };
struct Outer { char _pad0[0x4]; struct Inner *f4; };

int func_0209f7fc(int a, int b, int c) {
    struct Outer *g = (struct Outer *)func_0209dca8();
    int r = func_0209db88(1, 8);
    if (r != 0) return r;
    func_020928cc(&g->f4->f10, 4);
    if (g->f4->f10 == 1) return 3;
    if ((unsigned int)c < 0x10) return 6;
    if (b == 0) return 6;
    func_020928e8(b, c);
    func_0209de5c(0x11, a);
    r = func_0209dd30(0x11, 2, b, c);
    if (r == 0) return 2;
    return r;
}
