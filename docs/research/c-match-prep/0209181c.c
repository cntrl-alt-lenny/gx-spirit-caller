/* CAMPAIGN-PREP candidate for func_0209181c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     load head pre-disable; while-walk prev/cur (test-at-top via b); predicated prev==0 splice; reload base for write
 *   risk:       permuter-class: 5 live callee-saved values force cur into r8 (high reg) - mwcc's exact r7=prev/r8=cur split is a reg-alloc coin-flip a C reshape won't reliably pin. Node offsets next@0x68/f70@0x70 and head@0x8 are struct-guessed.
 *   confidence: low
 */
/* func_0209181c (main, cls C): IRQ-locked singly-linked unlink.
 * Read head (data_021a63d0.head @+8) BEFORE disabling IRQs; walk next(@+0x68)
 * tracking prev until cur==0 or cur==target; bail (return 0) if cur is null
 * or the sentinel data_021a63e0; if cur->f70(@+0x70)!=val, splice target out
 * (head or prev->next = target->next), set target->f70=val, notify, return 1. */
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02091f88(void);
extern void func_020920bc(void *node);

typedef struct Node {
    char         _pad0[0x68];
    struct Node *next;   /* +0x68 */
    char         _pad1[0x70 - 0x68 - 4];
    int          f70;    /* +0x70 */
} Node;

typedef struct {
    char  _pad[8];
    Node *head;          /* +0x8 */
} Mgr;

extern Mgr  data_021a63d0;
extern Node data_021a63e0;   /* sentinel, compared by address */

int func_0209181c(Node *target, int val)
{
    Node *prev = 0;
    Node *cur  = data_021a63d0.head;   /* read before disable, like orig */
    int   saved = OS_DisableIrq();

    while (cur != 0 && cur != target) {
        prev = cur;
        cur  = cur->next;
    }
    if (cur == 0 || cur == &data_021a63e0) {
        OS_RestoreIrq(saved);
        return 0;
    }
    if (cur->f70 != val) {
        if (prev == 0) data_021a63d0.head = target->next;
        else           prev->next = target->next;
        target->f70 = val;
        func_020920bc(target);
        func_02091f88();
    }
    OS_RestoreIrq(saved);
    return 1;
}
