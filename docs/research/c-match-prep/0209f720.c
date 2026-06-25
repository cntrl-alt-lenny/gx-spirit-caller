/* CAMPAIGN-PREP candidate for func_0209f720 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain validator + stack-marshalled 6-arg call
 *   risk:       stack-arg/local frame ordering (c,d at sp+0/4, buf at sp+8) may differ; buf reload vs reg-keep; offsets guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0209f720 (main, class A) — front-load.
 * UNVERIFIED build-free draft. The hardest of the batch (stack-marshalled 6-arg call).
 *   recipe:     linear guard-chain validator; clear+guard g->f4->f10; range guard; fill local then 6-arg call (last 2 args on stack)
 *   risk:       frame layout — outgoing stack args c,d at sp+0/sp+4 and buf at sp+8 is mwcc-dependent; buf[] reloaded into r2,r3
 */
extern void *func_0209dca8(void);
extern int  func_0209db88(int a, int b);
extern void func_020928cc(void *p, int n);
extern void func_020928e8(int a, int b);
extern void func_0209de5c(int idx, int b);
extern void func_02094688(int a, void *buf, int n);
extern int  func_0209dd30(int a, int b, int c, int d, int e, int f);

struct Inner { char _pad0[0x10]; int f10; };
struct Outer { char _pad0[0x4]; struct Inner *f4; };

int func_0209f720(int a, int b, int c, int d) {
    struct Outer *g = (struct Outer *)func_0209dca8();
    int buf[2];
    int r = func_0209db88(1, 0xb);
    if (r != 0) return r;
    func_020928cc(&g->f4->f10, 4);
    if (g->f4->f10 == 0) return 3;
    if ((unsigned int)d > 0x5e4) return 6;
    func_020928e8(c, d);
    func_0209de5c(0x12, a);
    func_02094688(b, buf, 6);
    r = func_0209dd30(0x12, 4, buf[0], buf[1], c, d);
    if (r == 0) return 2;
    return r;
}
