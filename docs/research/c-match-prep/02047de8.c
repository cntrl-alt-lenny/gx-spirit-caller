/* CAMPAIGN-PREP candidate for func_02047de8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store f34 then f38 then f30 in asm order; reload pointer per group; pair-return split
 *   risk:       func_020930b0 returns a register PAIR (r0,r1) stored f34/f38 - modeled as long long; if real proto is two out-params the codegen for the pair split diverges. struct-guessed (pair-return shape + f30/34/38 offsets).
 *   confidence: low
 */
/* func_02047de8 - main - class D (store-order)
 * two func_020aadf8 inits, pair-return stored f34/f38, ordered field stores
 * _LIT0 = data_0219dc78 : global pointer to control struct
 */
typedef struct {
    int f0;
    int f4;             /* +0x4 */
    unsigned char _pad30[0x30 - 0x8];
    int f30;            /* +0x30 */
    int f34;            /* +0x34 */
    int f38;            /* +0x38 */
    unsigned char _pad48[0x48 - 0x3c];
    unsigned char f48[0x100];   /* +0x48 */
    unsigned char f148[0x100];  /* +0x148 */
} Ctrl;

extern Ctrl *data_0219dc78;
extern void func_020aadf8(void *dst, int src);
extern int  func_02047fb8(void);
extern void func_02055e60(int a0, void *a1, void *a2, int s0, int s1, int s2);
extern void func_020930b0(void);   /* returns pair in r0,r1 */
extern long long func_020930b0_pair(void);

int func_02047de8(int a0, int a1, int a2, int a3)
{
    Ctrl *g;
    long long pr;

    g = data_0219dc78;
    func_020aadf8(&g->f48, a0);
    func_020aadf8(&data_0219dc78->f148, a1);

    g = data_0219dc78;
    pr = func_020930b0_pair();
    g->f34 = (int)pr;
    g->f38 = (int)(pr >> 32);
    g->f30 = 1;

    {
        Ctrl *h = data_0219dc78;
        func_02055e60(*(int *)h, &h->f48, &h->f148, 0, a2, 0);
    }

    if (func_02047fb8() == 0)
        data_0219dc78->f4 = a3;
    return 0;   /* falls through; r0 = func_02047fb8 ret or streq path */
}
