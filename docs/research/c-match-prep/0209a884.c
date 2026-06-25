/* CAMPAIGN-PREP candidate for func_0209a884 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-pointer list walk; if/else conditional-store predication; loop rotation
 *   risk:       mwcc must predicate the if/else into ldreq/streq+ldrne/strne (two separate cur->next loads) and rotate the do-while; either may differ.
 *   confidence: med
 */
/* func_0209a884: singly-linked-list unlink. Walks list *head with cur(r3)
 * and prev(r2); prev is initialised to cur, so cur==prev detects the
 * still-at-head case -> *head = cur->next, else prev->next = cur->next.
 * next field at offset 0x8.
 */

typedef struct Node {
    char _pad_00[0x8];
    struct Node *next;   /* +0x8 */
} Node;

void func_0209a884(Node **head, Node *target) {
    Node *cur;
    Node *prev;

    if (head == 0) return;
    cur = *head;
    prev = cur;
    if (cur == 0) return;
    do {
        if (cur == target) {
            if (cur == prev) *head = cur->next;
            else             prev->next = cur->next;
            return;
        }
        prev = cur;
        cur = cur->next;
    } while (cur != 0);
}
