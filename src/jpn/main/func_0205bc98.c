/* CAMPAIGN-PREP candidate for func_0205bc98 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     list-search by field; conditional *out store; tail return
 *   risk:       strne r3,[r1] (store node to out) vs movne/strne 0 on the miss path must both gate on out!=0; node-reg flip possible
 *   confidence: high
 */
/* func_0205bc98: search list (head=(*pp)->+0x424, link +0x20) for a
 * node whose +0x18 == key. On hit, if out!=0 store node, return 1.
 * On miss, if out!=0 store 0, return 0.
 */

typedef struct Node2 {
    char          _pad_00[0x18];
    int           key;    /* +0x18 */
    char          _pad_1c[0x20 - 0x1c];
    struct Node2 *next;   /* +0x20 */
} Node2;

typedef struct {
    char   _pad_00[0x424];
    Node2 *head;          /* +0x424 */
} Root2;

int func_0205bc98(Root2 **pp, Node2 **out, int key) {
    Node2 *n = (*pp)->head;
    while (n != 0) {
        if (n->key == key) {
            if (out != 0) *out = n;
            return 1;
        }
        n = n->next;
    }
    if (out != 0) *out = 0;
    return 0;
}
