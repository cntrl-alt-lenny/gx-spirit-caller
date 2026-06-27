/* CAMPAIGN-PREP candidate for func_02096728 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind p,v callee-saved pre-IRQ; unlink strne pair; reload-zero into prev
 *   risk:       orig zeroes [p] then RELOADS [p] to store into +0x4 (p->prev=p->next); if mwcc reuses the mov#0 zero reg, one ldr/str diverges - reshape-able (keep p->prev=p->next, not =0)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02096728 (main, class C) - p_0044.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     bind p+v to callee-saved before IRQ; unlink strne pair; reload [p] zero into +0x4; tail helper(p+0x18)
 *   risk:       see risk note
 *   confidence: med
 */
/* func_02096728: IRQ-guarded doubly-linked-list unlink. next=p->next, prev=p->prev;
 * if(next) next->prev=prev; if(prev) prev->next=next; p->next=0; p->prev=p->next(=0);
 * p->f0c &= ~0x4f; p->f14=v; func_02091a0c(&p->sub18). r4 holds IRQ token across. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int token);
extern void func_02091a0c(void *p);

typedef struct Node02096728 {
    struct Node02096728 *next;   /* 0x00 */
    struct Node02096728 *prev;   /* 0x04 */
    unsigned char        pad08[0x4];
    unsigned int         f0c;    /* 0x0c flags */
    unsigned char        pad10[0x4];
    int                  f14;    /* 0x14 */
    unsigned char        pad18[0x?];
} Node02096728;

void func_02096728(Node02096728 *p, int v)
{
    int token;
    Node02096728 *next;
    Node02096728 *prev;

    token = OS_DisableIrq();

    next = p->next;
    prev = p->prev;
    if (next) next->prev = prev;
    if (prev) prev->next = next;

    p->next = 0;
    p->prev = p->next;
    p->f0c &= ~0x4f;
    p->f14 = v;
    func_02091a0c((char *)p + 0x18);

    OS_RestoreIrq(token);
}
