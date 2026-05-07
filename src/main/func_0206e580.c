/* func_0206e580: linked-list insert at head — `new->next_7c = *head;
 * *head = new;`. Variant of brief-029 func_0209a918 with the next
 * pointer at offset 0x7c instead of 0x8, and no null-check on the
 * head pointer.
 *
 *     ldr r2, [r0, #0x0]
 *     str r2, [r1, #0x7c]
 *     str r1, [r0, #0x0]
 *     bx  lr
 */

typedef struct node {
    char         _pad[0x7c];
    struct node *next_7c;
} node_t;

void func_0206e580(node_t **head, node_t *new_node) {
    new_node->next_7c = *head;
    *head = new_node;
}
