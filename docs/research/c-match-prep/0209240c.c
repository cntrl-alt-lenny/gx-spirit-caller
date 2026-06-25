/* CAMPAIGN-PREP candidate for func_0209240c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload fields (no binding-binding promotes to r8); store-then-reload index
 *   risk:       80% as *.legacy.c (best of tested). Permuter-class residual: orig keeps cap([0x14]) in r1 ACROSS bl func_020b3870 (caller-saved survives call); C can't reproduce - binding promotes to r8. Likely .s-escape (clone of 0209256c, both reg-alloc-walled).
 *   confidence: low
 */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091a0c(void *);
extern void func_02091a8c(void *);
extern void func_020b3870(int);

typedef struct Queue {
    char  _pad00[0x08];
    char  sub[0x08];   /* +0x08 */
    int  *base;        /* +0x10 */
    int   cap;         /* +0x14 */
    int   index;       /* +0x18 */
    int   count;       /* +0x1c */
} Queue;

int func_0209240c(Queue *q, int value, int flagarg)
{
    int irq = OS_DisableIrq();
    if (q->cap <= q->count) {
        int flag = flagarg & 1;
        do {
            if (flag == 0) {
                OS_RestoreIrq(irq);
                return 0;
            }
            func_02091a8c(q);
        } while (q->cap <= q->count);
    }
    func_020b3870(q->index + q->cap - 1);
    q->index = q->cap;
    q->base[q->index] = value;
    q->count = q->count + 1;
    func_02091a0c((char *)q + 8);
    OS_RestoreIrq(irq);
    return 1;
}
