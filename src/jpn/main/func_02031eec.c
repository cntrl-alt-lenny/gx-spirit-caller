/* CAMPAIGN-PREP candidate for func_02031eec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linked-list walk calling one func per node
 *   risk:       loop reg-alloc (r4=next, r5=head) may differ; the cmp on saved next vs reload may flip
 *   confidence: med
 */
/* func_02031eec: walk a singly-linked list. Head pointer kept in r5
 * across the loop; each iteration caches node->next (offset +0x4) in
 * a callee-saved reg before the call, then advances. The first node
 * comes from head->field_08.
 *
 *     mov r5,r0; ldr r1,[r5,#0x8]; cmp r1,#0; (return if null)
 *  .L: ldr r4,[r1,#0x4]; mov r0,r5; bl func_02031e68
 *     mov r1,r4; cmp r4,#0; bne .L
 */

typedef struct Node {
    char _pad_00[0x04];
    struct Node *next;  /* +0x04 */
} Node;

typedef struct {
    char _pad_00[0x08];
    Node *head;         /* +0x08 */
} List_02031f40;

extern void func_02031e68(List_02031f40 *list, Node *node);

void func_02031eec(List_02031f40 *list) {
    Node *n = list->head;

    while (n != 0) {
        Node *next = n->next;
        func_02031e68(list, n);
        n = next;
    }
}
