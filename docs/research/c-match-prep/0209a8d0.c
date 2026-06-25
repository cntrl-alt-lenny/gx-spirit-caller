/* CAMPAIGN-PREP candidate for func_0209a8d0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     list append; empty-branch store order; loop rotation (cmp;beq;do..while)
 *   risk:       empty-list path must emit node->next=0 (moveq r2,#0;streq) before *head=node, and the while must rotate to the .L_88 join; reg reuse of r0 may flip.
 *   confidence: med
 */
/* func_0209a8d0: singly-linked-list append. Appends node to the list whose
 * head is *head (next at +0x8). Empty list: node->next=0; *head=node.
 * Non-empty: walk prev(r2) to the tail, set node->next=cur(0), prev->next=node.
 * prev is seeded with *head so the zero-iteration case still has prev=head.
 */

typedef struct Node {
    char _pad_00[0x8];
    struct Node *next;   /* +0x8 */
} Node;

void func_0209a8d0(Node **head, Node *node) {
    Node *prev;
    Node *cur;

    if (head == 0) return;
    prev = *head;
    if (prev == 0) {
        node->next = 0;
        *head = node;
        return;
    }
    cur = prev->next;
    while (cur != 0) {
        prev = cur;
        cur = cur->next;
    }
    node->next = cur;
    prev->next = node;
}
