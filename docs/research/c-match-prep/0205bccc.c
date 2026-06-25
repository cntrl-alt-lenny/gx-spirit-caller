/* CAMPAIGN-PREP candidate for func_0205bccc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     list-walk predicate (guard chain inside loop, tail return)
 *   risk:       the inner && short-circuit order (f8 then f0) must compile to beq-skip then movne/bxne; rare reg flip on node temp
 *   confidence: high
 */
/* func_0205bccc: list-walk predicate. head = (*pp)->+0x424; walk via
 * +0x20. Return 1 if a node has +0x8 != 0 AND +0x0 != 3, else 0.
 */

typedef struct Node {
    int          f0;    /* +0x00 */
    char         _pad_04[0x8 - 0x4];
    int          f8;    /* +0x08 */
    char         _pad_0c[0x20 - 0xc];
    struct Node *next;  /* +0x20 */
} Node;

typedef struct {
    char  _pad_00[0x424];
    Node *head;         /* +0x424 */
} Root;

int func_0205bccc(Root **pp) {
    Node *n = (*pp)->head;
    while (n != 0) {
        if (n->f8 != 0 && n->f0 != 3) {
            return 1;
        }
        n = n->next;
    }
    return 0;
}
