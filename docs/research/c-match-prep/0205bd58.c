/* CAMPAIGN-PREP candidate for func_0205bd58 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign prev-vs-head split matching eq/ne store source; do-while to put test at top
 *   risk:       struct-guessed: head offset 0x424 and next offset 0x20 inferred. Also reshape-able: the eq-branch must read cur->next but ne-branch target->next; collapsing both to one var changes which register feeds the str.
 *   confidence: med
 */
/* func_0205bd58: singly-linked-list unlink. *r0 -> container; list head at
 * container[0x424]; nodes chain via ->next at +0x20. Walk with a prev
 * pointer; when the target node is found, splice it out (head update when
 * prev==NULL, else prev->next = node->next) and call func_0205bdb8. The
 * eq-branch reads node->next via the matched node, the ne-branch via the
 * search arg — same object once found. func_0205bdb8 takes the original
 * holder (r0 is never clobbered before the call). */

typedef struct Node { char _pad[0x20]; struct Node *next; } Node;
typedef struct Container { char _pad[0x424]; Node *head; } Container;

extern void func_0205bdb8(void *holder);

int func_0205bd58(void *holder, Node *target) {
    Container *c = *(Container **)holder;
    Node *prev = 0;
    Node *cur = c->head;

    if (cur == 0) return 0;
    do {
        if (cur == target) {
            if (prev == 0)
                c->head = cur->next;
            else
                prev->next = target->next;
            func_0205bdb8(holder);
            return 0;
        }
        prev = cur;
        cur = cur->next;
    } while (cur != 0);
    return 0;
}
