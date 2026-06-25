/* CAMPAIGN-PREP candidate for func_020919ac (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linked-list search; test-first loop; next@0x68 flag@0x64
 *   risk:       Loop layout (b-to-cond then advance) should match while(); struct offsets 0x64/0x68 guessed; data_021a63d0 deref vs base+8 read assumed. Med-high.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020919ac (main, class A).
 * recipe:  linked-list search leaf. head = *(Node**)(data_021a63d0+0x8);
 *          walk via next (+0x68) until node->flag(+0x64) == 1, return it; else NULL.
 *          Loop is laid out test-first (`b .L_10`) then advance (`ldr [.,#0x68]`),
 *          i.e. a while(n){ if(n->flag==1) return n; n=n->next; } shape.
 */
extern char data_021a63d0[];

typedef struct Node020919ac {
    char                       _pad[0x64];
    int                        flag;   /* +0x64 */
    struct Node020919ac       *next;   /* +0x68 */
} Node020919ac;

Node020919ac *func_020919ac(void) {
    Node020919ac *n = *(Node020919ac **)(data_021a63d0 + 0x8);
    while (n) {
        if (n->flag == 1)
            return n;
        n = n->next;
    }
    return 0;
}
