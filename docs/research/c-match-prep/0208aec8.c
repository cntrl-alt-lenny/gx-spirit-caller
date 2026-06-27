/* CAMPAIGN-PREP candidate for func_0208aec8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: dense switch->jump table (case 0..3 + default==case3 body); store fn-ptr to handler
 *   risk:       struct-guessed/reshape-able: case order maps to LIT2..5; default (.L_130) reuses LIT5 like case3 — must reload base (`ldr r0,_LIT0`) there. If mwcc folds default into case3 or merges the two #0/#0x3000 cmp r5,#1 tails, table layout shifts.
 *   confidence: low
 */
/* func_0208aec8 (main, class D): IRQ-bracketed state switch. Guard on
 * already-current state; special pre-step when prev==1; switch(state)
 * stores a handler fn-ptr into [base+4]; post-step when state==1.
 *   addls pc,pc,r5,lsl#2 => dense switch 0..3 (default falls to case-like
 *   .L_130). Store the constant fn-ptrs into base->handler in case order. */
typedef struct {
    int state;          /* +0x00 */
    void *handler;      /* +0x04 */
} Sm_0208aec8;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern Sm_0208aec8 data_021023c0;
extern char data_021023d8[];

extern void func_0208aa50(void);
extern void func_0208aa98(void);
extern void func_0208ac90(void);
extern void func_0208ae30(void);
extern void func_0209448c(int a0, void *a1, int a2);
extern void func_02094cec(int a0);

void func_0208aec8(int state) {
    Sm_0208aec8 *sm = &data_021023c0;
    int prev = sm->state;
    int saved;

    if (state == prev) {
        return;
    }
    if (prev == 1) {
        func_02094cec(0);
    }

    saved = OS_DisableIrq();
    func_0209448c(0, data_021023d8, 0xc0);

    sm->state = state;
    switch (state) {
    case 0:
        sm->handler = (void *)func_0208ac90;
        break;
    case 1:
        sm->handler = (void *)func_0208aa98;
        break;
    case 2:
        sm->handler = (void *)func_0208aa50;
        break;
    case 3:
        sm->handler = (void *)func_0208ae30;
        break;
    default:
        sm->handler = (void *)func_0208ae30;
        break;
    }

    OS_RestoreIrq(saved);

    if (state == 1) {
        func_02094cec(0x3000);
    }
}
