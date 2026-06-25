/* CAMPAIGN-PREP candidate for func_02080114 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/branch-tail list-walk; unsigned cmp (bhi); tail call
 *   risk:       key must be unsigned to emit bhi not bgt; node/ctx offsets guessed.
 *   confidence: med
 */
/* func_02080114: walk list at p->ctx->head, return func_020801ac(node,key)
 * for first node with node->lo<=key<=node->hi (unsigned), else 0xffff. */

typedef struct Node {
    unsigned short lo;   /* 0x00 */
    unsigned short hi;   /* 0x02 */
    unsigned char  _pad04[0x08 - 0x04];
    struct Node   *next; /* 0x08 */
} Node;

typedef struct {
    unsigned char _pad00[0x10];
    Node *head;          /* 0x10 */
} Ctx;

typedef struct {
    Ctx *ctx;            /* 0x00 */
} T;

extern int func_020801ac(Node *node, unsigned key);

int func_02080114(T *p, unsigned key) {
    Node *node = p->ctx->head;
    while (node != 0) {
        if (node->lo <= key && key <= node->hi)
            return func_020801ac(node, key);
        node = node->next;
    }
    return 0xffff;
}
