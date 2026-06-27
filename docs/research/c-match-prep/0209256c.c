/* CAMPAIGN-PREP candidate for func_0209256c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload q->cap/q->count fresh (no locals); arg=index+count, subscript=cap
 *   risk:       93% as *.legacy.c (re-read fields, NOT bound - binding=64% via r8). Permuter-class residual: orig keeps cap in r1 across bl func_020b3870; 1 stray ldr [0x14] + r1/r0 color. Likely .s-escape; .s header says reg-alloc-walled.
 *   confidence: med
 */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091a0c(void *);
extern void func_02091a8c(void *);
extern void func_020b3870(int);
typedef struct Queue { char _pad00[0x08]; char sub[0x08]; int *base; int cap; int index; int count; } Queue;
int func_0209256c(Queue *q, int value, int flagarg){
    int irq = OS_DisableIrq();
    if (q->cap <= q->count) {
        int flag = flagarg & 1;
        do {
            if (flag == 0) { OS_RestoreIrq(irq); return 0; }
            func_02091a8c(q);
        } while (q->cap <= q->count);
    }
    func_020b3870(q->index + q->count);
    q->base[q->cap] = value;
    q->count = q->count + 1;
    func_02091a0c((char *)q + 8);
    OS_RestoreIrq(irq);
    return 1;
}
