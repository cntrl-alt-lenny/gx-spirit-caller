/* func_0209a918: linked-list insert at head — given a list head pointer
 * `*r0` and a new node `r1`, insert r1 at the head if r0 is non-null:
 * `if (r0) { r1->next_8 = *r0; *r0 = r1; }`.
 *
 *     cmp r0, #0x0
 *     ldrne r2, [r0, #0x0]
 *     strne r2, [r1, #0x8]
 *     strne r1, [r0, #0x0]
 *     bx  lr
 */

typedef struct node {
    char         _pad[0x8];
    struct node *next_8;
} node_t;

void func_0209a918(node_t **head, node_t *new_node) {
    if (head != 0) {
        new_node->next_8 = *head;
        *head = new_node;
    }
}
