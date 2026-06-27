/* CAMPAIGN-PREP candidate for func_0204827c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload *pp before every store (write data_0219dc78->f each time, no local bind)
 *   risk:       orig issues ldr r1,[r0] before EVERY store (8 reloads, r0=&pp held). If mwcc binds the deref to one reg it drops 7 ldr. reshape-able: never bind, always re-deref the global pointer as written.
 *   confidence: high
 */
/* func_0204827c - main - class C (bind-vs-reload)
 * store arg0 into the pointer var, memset 0x260, then RELOAD *pp per field store
 * _LIT0 = data_0219dc78 : global pointer object (written here)
 */
typedef struct {
    int f0;     /* +0x00 */
    int f4;     /* +0x04 */
    int f8;     /* +0x08 */
    int fc;     /* +0x0c */
    int f10;    /* +0x10 */
    int f14;    /* +0x14 */
    int f18;    /* +0x18 */
    int f1c;    /* +0x1c */
} Ctrl;

extern Ctrl *data_0219dc78;
extern void func_020945f4(void *p, int v, int n);  /* memset-like */

void func_0204827c(Ctrl *a0, int a1, int a2, int a3,
                   int a4, int a5, int a6, int a7)
{
    data_0219dc78 = a0;
    func_020945f4(a0, 0, 0x260);

    data_0219dc78->f0  = a2;
    data_0219dc78->f4  = 0;
    data_0219dc78->f8  = a3;
    data_0219dc78->fc  = a4;
    data_0219dc78->f10 = a5;
    data_0219dc78->f14 = a6;
    data_0219dc78->f18 = a7;
    data_0219dc78->f1c = a1;
}
