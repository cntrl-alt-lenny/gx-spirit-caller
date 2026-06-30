/* CAMPAIGN-PREP candidate for func_0206830c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linked-list unlink: prev/cur walk + predicated splice + count--
 *   risk:       shipped-.s reg-alloc wall; the head reload (ldr r1,[r0] after prev splice) and predicated str ordering likely differ; r1 reuse for next-ptr
 *   confidence: low
 */
/* func_0206830c — singly-linked-list unlink by key.
 * head/tail/count live at [r0+0], [r0+4], [r0+8]; node->next at +0x20.
 * Walk from head keeping prev (r2); when node==key (r1): splice
 * prev->next=node->next (if prev), fix head if head==node, fix tail to
 * prev if tail==node, count--, return 1. Not found -> 0.
 * NOTE: this one was shipped as .s (reg-alloc wall). The exact
 * predicated reload sequence (ldr r1,[r0] twice, cmp head==node /
 * tail==node) is the risky part.
 */
typedef struct Node Node;
struct Node {
    char  _pad_00[0x20];
    Node *next;       /* +0x20 */
};
typedef struct List List;
struct List {
    Node *head;       /* +0x00 */
    Node *tail;       /* +0x04 */
    int   count;      /* +0x08 */
};

int func_0206830c(List *list, Node *key) {
    Node *prev = 0;
    Node *cur  = list->head;

    while (cur != 0) {
        if (cur == key) {
            if (prev != 0) {
                prev->next = cur->next;
            }
            if (list->head == cur) {
                list->head = cur->next;
            }
            if (list->tail == cur) {
                list->tail = prev;
            }
            list->count--;
            return 1;
        }
        prev = cur;
        cur  = cur->next;
    }
    return 0;
}
