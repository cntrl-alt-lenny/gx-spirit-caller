/* CAMPAIGN-PREP candidate for func_0205c7f4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     list-search predicate; compound && match; return node (tail)
 *   risk:       && order (fc==key then f0==0x69) must keep the bxeq-returns-node form; node temp reg-alloc could flip
 *   confidence: high
 */
/* func_0205c7f4: search list head=(*pp)->+0x434, link +0x3c, for a
 * node whose +0xc == key AND +0x0 == 0x69. Return the node or 0.
 */

typedef struct Node3 {
    int           f0;    /* +0x00 */
    char          _pad_04[0xc - 0x4];
    int           fc;    /* +0x0c */
    char          _pad_10[0x3c - 0x10];
    struct Node3 *next;  /* +0x3c */
} Node3;

typedef struct {
    char   _pad_00[0x434];
    Node3 *head;         /* +0x434 */
} Root3;

Node3 *func_0205c7f4(Root3 **pp, int key) {
    Node3 *n = (*pp)->head;
    while (n != 0) {
        if (n->fc == key && n->f0 == 0x69) {
            return n;
        }
        n = n->next;
    }
    return 0;
}
