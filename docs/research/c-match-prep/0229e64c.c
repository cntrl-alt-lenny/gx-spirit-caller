/* CAMPAIGN-PREP candidate for func_0229e64c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: packed :1/:5/:8/:1/:1 bitfield; in-place + stack-copy insert chains; two transform calls; store-order
 *   risk:       already ships as .s (reg-alloc-walled): two near-identical passes thrash callee-saved alloc and the in-place-vs-stack bitfield juggling; a C reshape unlikely to land it. permuter-class
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229e64c (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. NOTE: already ships as whole-fn .s
 * (reg-alloc-walled). recipe: read +0x28 packed bitfield; extract bit0/[5:1]
 * for two transform calls; insert [13:6]=v, bit14=ret, clear bit15; mirror to
 * a stack copy; tail to func_0229d184. permuter-class / struct-guessed. */
extern int  func_ov002_021b00e8(int a, int b);
extern int  func_ov002_021c988c(int a, int b, int c);
extern int  func_ov002_021c9504(int a, int b, int c);
extern void func_ov002_0229d184(char *dst, int arg1, void *src);

typedef struct {
    unsigned short b0   : 1;
    unsigned short b51  : 5;
    unsigned short b136 : 8;
    unsigned short b14  : 1;
    unsigned short b15  : 1;
} Packed28;

void func_ov002_0229e64c(char *self) {
    Packed28 *p = (Packed28 *)(self + 0x28);
    short *pstate = (short *)(self + 0x2a);
    short s;

    *pstate = (short)func_ov002_021b00e8((int)p->b0, (int)p->b51);

    s = *pstate;
    if (s == 0) {
        p->b136 = 0;
        *(char *)self = 0;
        return;
    }

    {
        int v = (p->b51 == 0xd) ? 0 : (s - 1);
        int r;
        p->b136 = (unsigned char)v;
        r = func_ov002_021c988c((int)p->b0, (int)p->b51, (int)p->b136);
        p->b14 = r;
        p->b15 = 0;
        r = func_ov002_021c9504((int)p->b0, (int)p->b51, (int)p->b136);
        func_ov002_0229d184(self, r, p);
    }

    s = *pstate;
    if (s <= 1)
        return;

    {
        Packed28 bf;
        int v2;
        int r;
        *(unsigned short *)&bf = *(unsigned short *)p;
        v2 = (bf.b51 == 0xd) ? 1 : (s - 2);
        bf.b136 = (unsigned char)v2;
        r = func_ov002_021c988c((int)bf.b0, (int)bf.b51, (int)bf.b136);
        bf.b14 = r;
        bf.b15 = 0;
        r = func_ov002_021c9504((int)bf.b0, (int)bf.b51, (int)bf.b136);
        func_ov002_0229d184(self + 0x14, r, &bf);
    }
}
