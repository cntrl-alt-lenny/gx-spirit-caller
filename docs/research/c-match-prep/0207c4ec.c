/* CAMPAIGN-PREP candidate for func_0207c4ec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     key-null guard + list-walk + two-step ptr add; sp2p3 tier
 *   risk:       node+0x10+0x4 may fold to single add r0,#0x14; loop reg-alloc; f2270/count load scheduling vs key check
 *   confidence: med
 */
/* func_0207c4ec: linked-list search by 6-byte key via func_0207cf78.
 * Style A epilogue WITH sub-sp (push {r4,r5,lr}; sub sp,#4; ...;
 * add sp,#4; pop {r4,r5,lr}; bx lr) -> `.legacy.c` (mwcc 1.2/sp2p3).
 * key arg is a pointer (passed as 2nd ptr to the 6-byte compare).
 * r4 is the single running result reg (init 0). The compare target is
 * computed as node+0x10 then +0x4 -> two-step pointer add (mirrors the
 * `add r0,r4,#0x10` / `add r0,r0,#0x4` split). */

typedef struct node_c4ec {
    char               _pad0[0xc];
    struct node_c4ec  *next;        /* +0xc */
    /* a sub-record begins at +0x10; the 6-byte id sits at +0x14 */
} node_c4ec_t;

typedef struct {
    char         _pad[0x4];
    node_c4ec_t *head;             /* +0x4 */
} list_c4ec_t;

typedef struct {
    char          _pad[0x2270];
    list_c4ec_t  *list;           /* +0x2270 */
    unsigned int  count;         /* +0x2274 */
} ctx_c4ec_t;

extern ctx_c4ec_t *func_0207b538(void);
extern int func_0207cf78(const unsigned char *a, const unsigned char *b);

node_c4ec_t *func_0207c4ec(const unsigned char *key) {
    ctx_c4ec_t  *ctx = func_0207b538();
    node_c4ec_t *node = 0;
    if (key == 0) return 0;
    {
        list_c4ec_t *list = ctx->list;
        if (list != 0 && ctx->count > 0xc) {
            node = list->head;
            while (node != 0) {
                unsigned char *rec = (unsigned char *)node + 0x10;
                if (func_0207cf78(rec + 4, key) != 0) break;
                node = node->next;
            }
        }
    }
    return node;
}
