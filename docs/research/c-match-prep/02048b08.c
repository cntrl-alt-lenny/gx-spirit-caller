/* CAMPAIGN-PREP candidate for func_02048b08 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     i declared last (r4); mla i*0xc and n*0xc inlined; swap-order calls; byte store f1d
 *   risk:       orig calls func_0204918c(i) ONCE (r0 reused for both cmp #0 and cmp r5); my two calls may double it, or mwcc may CSE - either way one bl diverges. reshape-able: bind `int r=func_0204918c(i); if(r==0||r!=a2)continue;`.
 *   confidence: med
 */
/* func_02048b08 - main - class C (loop + mla index)
 * scan i in [0,n), match func_0204918c(i)==arg2, swap-order call func_02048bc0
 * _LIT0 = data_0219dc80 : global pointer to control struct (byte_1d flag)
 */
typedef struct {
    unsigned char _pad1d[0x1d];
    unsigned char f1d;          /* +0x1d : set to 1 on hit */
} Ctrl;

typedef struct { unsigned char b[0xc]; } Elem;  /* 0xc stride */

extern Ctrl *data_0219dc80;
extern int  func_0204918c(int i);
extern int  func_02053650(Elem *e);
extern void func_02048bc0(Elem *base, int p, int q);

int func_02048b08(Elem *a0, int a1, int a2)
{
    int i;

    for (i = 0; i < a1; i++) {
        if (func_0204918c(i) == 0)
            continue;
        if (func_0204918c(i) != a2)
            continue;

        if (func_02053650(&a0[a1]) != 0 && func_02053650(&a0[i]) == 0)
            func_02048bc0(a0, i, a1);
        else
            func_02048bc0(a0, a1, i);

        data_0219dc80->f1d = 1;
        return 0;
    }
    return 0;
}
