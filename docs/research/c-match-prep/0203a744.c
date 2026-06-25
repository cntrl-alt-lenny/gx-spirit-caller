/* CAMPAIGN-PREP candidate for func_0203a744 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call + null guard + deref + bool-normalize; unused arg0
 *   risk:       arg0 unused (overwritten by mov r0,r1) - declared but dead; f0 offset guessed
 *   confidence: high
 */
/* func_0203a744 - resolve a1 (a0 unused), gate, return func_0203953c(...)!=0 */

typedef struct {
    int f0;
} Node;

extern Node *func_02089328(int a1);
extern int   func_0203953c(int x, int mode, int a2);

int func_0203a744(int a0, int a1, int a2)
{
    Node *p = func_02089328(a1);
    if (p == 0)
        return 0;
    return func_0203953c(p->f0, 3, a2) != 0;
}
