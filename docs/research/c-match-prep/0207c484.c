/* CAMPAIGN-PREP candidate for func_0207c484 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain early-returns + list-walk loop; sp2p3 tier
 *   risk:       shared mov r0,#0 across predicated returns may split; head-null return-reg reuse; loop reg-alloc
 *   confidence: med
 */
/* func_0207c484: linked-list search by int key. Style A 2-step epilogue
 * (stmdb {r4,lr}; ...; ldmia {r4,lr}; bx lr) with NO r3-spill and NO
 * sub-sp -> route as `.legacy.c` (mwcc 1.2/sp2p3). Singleton ctx via
 * func_0207b538(); ptr+count at abs 0x2270/0x2274 (same field family as
 * func_0207c86c / func_0207c570). */

typedef struct node_c484 {
    char                _pad0[0x4];
    int                 key;        /* +0x4 */
    char                _pad8[0x4];
    struct node_c484   *next;       /* +0xc */
} node_c484_t;

typedef struct {
    char         _pad[0x4];
    node_c484_t *head;              /* +0x4 */
} list_c484_t;

typedef struct {
    char          _pad[0x2270];
    list_c484_t  *list;            /* +0x2270 */
    unsigned int  count;          /* +0x2274 */
} ctx_c484_t;

extern ctx_c484_t *func_0207b538(void);

node_c484_t *func_0207c484(int key) {
    ctx_c484_t  *ctx = func_0207b538();
    list_c484_t *list = ctx->list;
    node_c484_t *n;
    if (list == 0) return 0;
    if (ctx->count <= 0xc) return 0;
    n = list->head;
    if (n == 0) return 0;
    do {
        if (n->key == key) return n;
        n = n->next;
    } while (n != 0);
    return 0;
}
