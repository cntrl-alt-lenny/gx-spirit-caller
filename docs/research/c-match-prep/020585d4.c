/* CAMPAIGN-PREP candidate for func_020585d4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order n->f0,fc,f4,f8 under nonnull guard; spill w0/w1 to sp, reload via ldmia r1,{r1,r2}
 *   risk:       ldmia r1,{r1,r2} loads sp[0x8..0xc] as func_02058528 {a,b} args after they are set 0/1; that exact spill/reload is fragile. permuter-class/struct-guessed.
 *   confidence: low
 */
/* func_020585d4 (D): assert chain, snapshot 2 words, alloc node, queue insert. */
extern void *func_020453e8(int sz);
extern int  func_02058528(int ctx, int a, int b, int c, void *node, int e);
extern void func_020a6d54(unsigned char *m, unsigned char *f, int z, int line);
extern unsigned char data_02100280[], data_021002b4[], data_021002c8[], data_021002e0[];
typedef struct St { int f0; char _4[0x1a0]; int f1a4; int f1a8; char _1ac[0x26c]; int f418; int f41c; } St;
typedef struct Node2 { int f0; int f4; int f8; int fc; } Node2;
int func_020585d4(int ctx, int arg, int flag) {
    St *s = (St *)*(void **)(int *)ctx;
    int w0, w1;
    int sp0, sp1;
    Node2 *n;
    if (s == 0)
        func_020a6d54(data_021002b4, data_02100280, 0, 0x23);
    if (arg == 0)
        func_020a6d54(data_021002c8, data_02100280, 0, 0x24);
    if (flag != 1 && flag != 0)
        func_020a6d54(data_021002e0, data_02100280, 0, 0x25);
    if (flag == 1)
        s->f41c = 1;
    w0 = s->f1a4;
    w1 = s->f1a8;
    sp0 = w0;
    sp1 = w1;
    if (w0 == 0)
        return 0;
    n = (Node2 *)func_020453e8(0x10);
    if (n != 0) {
        n->f0 = arg;
        n->fc = flag;
        n->f4 = s->f418;
        n->f8 = (int)s;
    }
    sp0 = 0;
    sp1 = 1;
    func_02058528(ctx, sp0, sp1, w1, n, w0);
    return 0;
}
