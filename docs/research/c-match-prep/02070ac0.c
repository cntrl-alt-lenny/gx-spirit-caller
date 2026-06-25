/* CAMPAIGN-PREP candidate for func_02070ac0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-before-call in loop; bottom-test loop; reload *out for tail
 *   risk:       Orig pins saved in r8 and consts r7=2,r6=0 hoisted above the loop; mwcc may not hoist the '2' literal nor keep r8 — reg-alloc divergence on the hoisted constants is reshape-able only via permuter.
 *   confidence: med
 */
/* func_02070ac0: IRQ spin-wait until buffer non-empty or state leaves 4.
 * r5=out(arg0), r4=ctx(arg1).
 *  - if ctx->f44==0 && ctx->_8==4:
 *        saved=disable; loop: while(f44==0 && _8==4){ ctx->f4=2;
 *          func_02091a8c(0); }  restore(saved)
 *    else: func_020918d0()
 *  - *out = ctx->f44; if(*out!=0) return ctx->f40 else return 0
 *
 * loop body emits the str BEFORE the call (ctx->f4=2 then func_02091a8c)
 * and tests the condition at loop bottom (b .L_e98 entry).
 */

typedef struct Ctx {
    char  _pad04[0x4];
    int   f4;              /* +0x4 */
    char  _pad08[0x3];
    unsigned char state;   /* +0x8 */
    char  _pad09[0x37];
    int   f40;             /* +0x40 */
    int   f44;             /* +0x44 */
} Ctx;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020918d0(void);
extern void func_02091a8c(int arg);

int func_02070ac0(int *out, Ctx *ctx) {
    int saved;

    if (ctx->f44 == 0 && ctx->state == 4) {
        saved = OS_DisableIrq();
        while (ctx->f44 == 0 && ctx->state == 4) {
            ctx->f4 = 2;
            func_02091a8c(0);
        }
        OS_RestoreIrq(saved);
    } else {
        func_020918d0();
    }

    *out = ctx->f44;
    if (*out != 0) return ctx->f40;
    return 0;
}
