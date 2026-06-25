/* CAMPAIGN-PREP candidate for func_020413b0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C/D: struct fn-ptrs, store-order +4/+c/+0/+8, reload p->c after store
 *   risk:       reshape-able: orig re-checks q after the second blx (cmp r4,#0 twice). If mwcc folds the two q!=0 tests into one, the second ldmeq path vanishes — keep both explicit if-returns.
 *   confidence: med
 */
/* func_020413b0 - main - class C
 * straight-line blx allocate+update fields; reg-reuse, store-order
 * base=r0+0x1000 holds two fn ptrs at +0x10/+0x14; r6=p struct, r5=n size
 * field store order: +4, +0xc, +0, +8 ; p->c reloaded after its own store
 */
extern unsigned char data_020fe8b0[];
extern unsigned char data_020fe8c0[];
extern void func_02094688(void *dst, void *src, int n);

typedef struct {
    int a;        /* +0x0  : current ptr/base */
    int b;        /* +0x4  : accumulator */
    int c8;       /* +0x8  : end */
    int c;        /* +0xc  : length */
} Buf;

typedef struct {
    unsigned char pad[0x10];
    void *(*alloc)(void *tag, int sz);   /* +0x10 */
    void  (*notify)(void *tag, int a, int b); /* +0x14 */
} Mod;

int func_020413b0(int self, Buf *p, int n)
{
    Mod *m;
    void *q;

    m = (Mod *)(self + 0x1000);
    if (n <= 0)
        return 0;
    q = m->alloc(data_020fe8b0, p->c + n);
    if (q == 0)
        return 0;
    func_02094688((void *)p->a, q, p->c);
    m->notify(data_020fe8c0, (void *)p->a, 0);
    if (q == 0)
        return 0;
    p->b = p->b + ((int)q - p->a);
    p->c = p->c + n;
    p->a = (int)q;
    p->c8 = (int)q + p->c;
    return 1;
}
