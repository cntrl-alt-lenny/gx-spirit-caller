/* CAMPAIGN-PREP candidate for func_0203c698 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Null-guard chain with moveq early-returns; bool ==1 result
 *   risk:       Field offsets 0xac/0x1d and call return types guessed; movne/moveq bool ordering
 *   confidence: high
 */
/* func_0203c698: chained null-guard, returns (field==1).
 *  if(!p) return 0;
 *  h = func_020891fc(p->f_ac);  if(!h) return 0;
 *  q = func_0203a84c(*h);       if(!q) return 0;
 *  return q->f_1d == 1;
 */
extern void *func_020891fc(unsigned short id);
extern void *func_0203a84c(void *p);

typedef struct {
    char           _pad00[0xac];
    unsigned short f_ac;   /* +0xac (ldrh) */
} A;

typedef struct {
    char _pad00[0x1d];
    signed char f_1d;      /* +0x1d (ldrsb) */
} C;

int func_0203c698(A *p) {
    void **h;
    C *q;
    if (p == 0) return 0;
    h = (void **)func_020891fc(p->f_ac);
    if (h == 0) return 0;
    q = (C *)func_0203a84c(*h);
    if (q == 0) return 0;
    return q->f_1d == 1;
}
