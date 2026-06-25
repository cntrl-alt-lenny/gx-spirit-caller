/* CAMPAIGN-PREP candidate for func_020683ec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linked-list pop-head + conditional tail-clear + count--
 *   risk:       shipped-.s wall; head reload after store (ldr r1,[r0]) and moveq/streq predication ordering may diverge from mwcc emit
 *   confidence: low
 */
/* func_020683ec — pop head of singly-linked list, return it.
 * cur = list->head; if (cur) { list->head = cur->next; if
 * (list->head == 0) list->tail = 0; list->count--; } return cur.
 * head/tail/count at +0,+4,+8; next at +0x20. Shipped as .s (wall);
 * the moveq/streq for the tail-clear and the head reload are the risk.
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

Node *func_020683ec(List *list) {
    Node *cur = list->head;
    if (cur != 0) {
        list->head = cur->next;
        if (list->head == 0) {
            list->tail = 0;
        }
        list->count--;
    }
    return cur;
}
