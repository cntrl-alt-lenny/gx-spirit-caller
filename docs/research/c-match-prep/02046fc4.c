/* CAMPAIGN-PREP candidate for func_02046fc4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order g; reload pointer before stores; if-not-ternary guards; accumulator-first
 *   risk:       orig RELOADS data_0219daec twice (ldr r2,[r0] then ldr r1,[r0]); if mwcc CSEs the deref to one reg, an ldr diverges. reshape-able (write data_0219daec->f7c, second g=load).
 *   confidence: med
 */
/* func_02046fc4 - main - class C
 * guard chain then 8-arg stacked call to func_0204937c
 * _LIT0 = data_0219daec : global pointer to control struct
 * _LIT1 = func_020463dc : callback passed as arg2
 */
typedef struct {
    unsigned char _pad24[0x24];
    int f24;            /* +0x24 */
    unsigned char _pad28[0x78 - 0x28];
    int f78;            /* +0x78 */
    int f7c;            /* +0x7c */
    unsigned char _padE0[0xe0 - 0x80];
    unsigned char fE0[0x100];   /* +0xe0 */
    unsigned char f1E0[4];      /* +0x1e0 */
} Ctrl;

extern Ctrl *data_0219daec;
extern int  func_02045280(void);
extern void func_020463dc(void);
extern void func_020466f4(int x);
extern void func_0204937c(void *a, void *b, void *cb, int z,
                          int a4, int a5, int a6, int a7);

int func_02046fc4(int a0, int a1, int a2, int a3, int a4, int a5, int a6)
{
    Ctrl *g;

    if (func_02045280() != 0)
        return 0;
    g = data_0219daec;
    if (g->f24 < 3)
        return 0;
    if (g->f24 == 4)
        return 0;

    g->f78 = a1;
    data_0219daec->f7c = a2;
    func_020466f4(4);
    g = data_0219daec;
    func_0204937c(g->fE0, g->f1E0, (void *)func_020463dc, 0,
                  a3, a4, a5, a6);
    return 1;
}
