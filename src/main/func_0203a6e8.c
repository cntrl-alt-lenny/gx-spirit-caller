/* CAMPAIGN-PREP candidate for func_0203a6e8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain + u16 field arg + bool-normalize (!=0)
 *   risk:       node f0/f4 offsets guessed; movs r4,r0 early-return and movne/moveq normalize should match
 *   confidence: high
 */
/* func_0203a6e8 - resolve a1, two gated calls, return func_0203a694(...)!=0 */

typedef struct {
    int            f0;
    unsigned short f4;
} Node;

extern Node *func_0208938c(int a1);
extern int   func_0203953c(int x, int mode, int a2);
extern int   func_0203a694(int a0, int a1, int a2);

int func_0203a6e8(int a0, int a1, int a2)
{
    Node *p = func_0208938c(a1);
    if (p == 0)
        return 0;
    if (func_0203953c(p->f0, 0, a2) == 0)
        return 0;
    return func_0203a694(a0, p->f4, a2) != 0;
}
