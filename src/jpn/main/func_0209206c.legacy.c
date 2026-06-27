/* CAMPAIGN-PREP candidate for func_0209206c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     doubly-linked unlink; head/tail eq-ne split; break for single exit
 *   risk:       VERIFIED 100% as *.legacy.c (1.2/sp2p3). Reshape-able: match path MUST `break` not `return cur` (return = second exit, 77%); route .legacy.c (leaf, no epilogue change but body needs 1.2).
 *   confidence: high
 */
typedef struct Node {
    char         _pad00[0x7c];
    struct Node *prev;   /* +0x7c */
    struct Node *next;   /* +0x80 */
} Node;

typedef struct List {
    Node *head;   /* +0x00 */
    Node *tail;   /* +0x04 */
} List;

Node *func_0209206c(List *list, Node *target)
{
    Node *cur = list->head;
    while (cur != 0) {
        Node *next = cur->next;
        if (cur == target) {
            Node *prev = cur->prev;
            if (list->head == cur)
                list->head = next;
            else
                prev->next = next;
            if (list->tail == cur)
                list->tail = prev;
            else
                next->prev = prev;
            break;
        }
        cur = next;
    }
    return cur;
}
