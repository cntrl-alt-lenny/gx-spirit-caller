/* CAMPAIGN-PREP candidate for func_0207b038 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: reload global each use (3x ldr), conditional store via if, s in callee-saved across body
 *   risk:       reshape-able: the strne (if(state!=0xb)state=s) must stay a predicated store not a branch; if mwcc branches, add diverges. Also stacked 5th arg ordering of func_02093454 (str r2,[sp]) may reorder.
 *   confidence: med
 */
/* func_0207b038: IRQ-bracketed state setter, arg = new state s (r0).
 * mask=DisableIrq; if(g->state(0x2260)==9 && s!=9) func_020933bc(g+0x22cc);
 * reload g; if(g->state!=0xb) g->state=s;  (conditional store)
 * if(s==9) func_02093454(g+0x22cc, 0x022f5341, 0, func_0207afa0, /*stk*/0);
 * RestoreIrq(mask). Global RELOADED 3x (not cached). r5=s,r4=mask. */
typedef unsigned char u8;

typedef struct {
    u8  _pad0[0x2260];
    int state;         /* +0x2260 */
    u8  _pad1[0x68];
    u8  f22cc[1];      /* +0x22cc */
} GxState;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern GxState *data_021a088c;
extern void func_0207afa0(void);
extern void func_020933bc(void *p);
extern void func_02093454(void *p, int a, int b, void *fn, int e);

void func_0207b038(int s) {
    int mask = OS_DisableIrq();
    if (((GxState *)data_021a088c)->state == 9 && s != 9) {
        func_020933bc((char *)data_021a088c + 0x22cc);
    }
    if (((GxState *)data_021a088c)->state != 0xb) {
        ((GxState *)data_021a088c)->state = s;
    }
    if (s == 9) {
        func_02093454((char *)data_021a088c + 0x22cc, 0x022f5341, 0,
                       func_0207afa0, 0);
    }
    OS_RestoreIrq(mask);
}
