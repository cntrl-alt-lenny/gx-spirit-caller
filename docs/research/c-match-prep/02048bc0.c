/* CAMPAIGN-PREP candidate for func_02048bc0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload pointer after call; mla a1*0xc inlined; blx via struct fn-ptr f3c(a1,a2)
 *   risk:       blx r3 args are (r0=a1, r1=a2, r2=[r0,#0x40]); my f3c(a1,a2) drops the r2=f40 arg. If callee actually takes 3 args the blx setup loses one mov. reshape-able: declare f3c(int,int,int) and pass g->f40. struct-guessed on f40 use.
 *   confidence: med
 */
/* func_02048bc0 - main - class C
 * guard, mla index func_020945f4(base + p*0xc, 0), vtable blx f3c/f40
 * _LIT0 = data_0219dc80 : global pointer to control struct
 */
typedef struct {
    unsigned char _pad3c[0x3c];
    void (*f3c)(int a, int b);   /* +0x3c vtable fn */
    int f40;                     /* +0x40 */
} Ctrl;

typedef struct { unsigned char b[0xc]; } Elem;  /* 0xc stride */

extern Ctrl *data_0219dc80;
extern void func_020945f4(void *p, int v);   /* 2-arg memset-ish here */

void func_02048bc0(Elem *a0, int a1, int a2)
{
    Ctrl *g;

    g = data_0219dc80;
    if (g == 0)
        return;

    func_020945f4(&a0[a1], 0);

    g = data_0219dc80;
    if (g->f3c != 0)
        g->f3c(a1, a2);
}
