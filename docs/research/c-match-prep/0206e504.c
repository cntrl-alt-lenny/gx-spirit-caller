/* CAMPAIGN-PREP candidate for func_0206e504 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linked-list search leaf, next at +0x7c, return node addr
 *   risk:       the matched-node return is r0=&node->_0x7c-relative? r0 set to node base before deref; offset 0x7c guessed
 *   confidence: med
 */
/* func_0206e504: singly-linked-list membership search.
 *   p = head->_0x0 (first node); if (p == 0) return 0;
 *   do {
 *       if (p == key) return p;          ; cmp r2,r1; bxeq (r0 holds p)
 *       r0 = (char*)p + 0x7c;            ; addr of next field
 *       p  = p->_0x7c;                   ; next pointer
 *   } while (p != 0);
 *   return 0;
 * On the match, r0 already equals the current node p (set by the
 * previous `add r0,r2,#0x7c`? no — on the FIRST iteration r0 is the
 * head arg; the loop advances r0 to point at each node's next-field
 * slot). Returns the matching node pointer.
 */

typedef struct node {
    char         _pad_00[0x7c];
    struct node *next;       /* +0x7c */
} node_t;

typedef struct {
    node_t *head;            /* +0x0 */
} list_t;

node_t *func_0206e504(list_t *list, node_t *key) {
    node_t *p = list->head;
    while (p != 0) {
        if (p == key) return p;
        p = p->next;
    }
    return 0;
}
