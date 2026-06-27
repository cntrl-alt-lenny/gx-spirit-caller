/* CAMPAIGN-PREP candidate for func_020480b4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload pointer after call; if-return guards; blx via struct fn-ptr f14(arg0,0,f18)
 *   risk:       orig reads g->f14 then g->f18 (blx r3 with r2=[r0,#0x18]); arg order to blx is (r0=a0,r1=0,r2=f18). If mwcc orders the f18 load or the cmp differently around blx, minor schedule diff. reshape-able (operand/decl order).
 *   confidence: high
 */
/* func_020480b4 - main - class C
 * guard g!=0 && arg0!=0, call, vtable blx through f14/f18
 * _LIT0 = data_0219dc78 : global pointer to control struct
 */
typedef struct {
    unsigned char _pad14[0x14];
    void (*f14)(void *a, int b, int c);  /* +0x14 vtable fn */
    int f18;                             /* +0x18 */
} Ctrl;

extern Ctrl *data_0219dc78;
extern void func_0204525c(void);
extern void func_0204802c(void);

void func_020480b4(void *a0)
{
    Ctrl *g;

    g = data_0219dc78;
    if (g == 0)
        return;
    if (a0 == 0)
        return;

    func_0204525c();
    g = data_0219dc78;
    if (g->f14 != 0)
        g->f14(a0, 0, g->f18);
    func_0204802c();
}
