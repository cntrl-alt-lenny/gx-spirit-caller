/* CAMPAIGN-PREP candidate for func_0200fd68 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single linked-list search; head@+0x910; next@0,key@8; leaf
 *   risk:       node key@8 vs arg key@0; 0x910 within ldr-imm so no add; data symbol name only
 *   confidence: high
 */
/* func_0200fd68: walk the list whose head is at data_0218dae8+0x910,
 * returning the node whose key (@8) equals the arg's first word. */

typedef struct Node { struct Node *next; int pad; int key; } Node;
extern char data_0218dae8;

Node *func_0200fd68(int *arg) {
    Node *n = *(Node **)(&data_0218dae8 + 0x910);
    if (n != 0) {
        int k = arg[0];
        do {
            if (n->key == k) return n;
            n = n->next;
        } while (n != 0);
    }
    return 0;
}
