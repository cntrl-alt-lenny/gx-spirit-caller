/* CAMPAIGN-PREP candidate for func_0203a6f4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call + null guard + deref + bool-normalize; unused arg0
 *   risk:       arg0 unused (overwritten by mov r0,r1) - declared but dead; f0 offset guessed
 *   confidence: high
 */
/* func_0203a6f4 - resolve a1 (a0 unused), gate, return func_020394ec(...)!=0 */

typedef struct {
    int f0;
} Node;

extern Node *func_02089240(int a1);
extern int   func_020394ec(int x, int mode, int a2);

int func_0203a6f4(int a0, int a1, int a2)
{
    Node *p = func_02089240(a1);
    if (p == 0)
        return 0;
    return func_020394ec(p->f0, 3, a2) != 0;
}
