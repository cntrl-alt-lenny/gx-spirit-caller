/* func_0200faf8: doubly-linked-list node unlink.
 *
 *     ldr   r1, [r0, #0x4]        ; r1 = next
 *     ldr   r0, [r0, #0x0]        ; r0 = prev
 *     cmp   r1, #0x0
 *     strne r0, [r1, #0x0]        ; next->prev = prev
 *     cmp   r0, #0x0
 *     strne r1, [r0, #0x4]        ; prev->next = next
 *     mov   r0, #0x0
 *     bx    lr
 */

typedef struct list_node {
    struct list_node *prev;
    struct list_node *next;
} list_node_t;

int func_0200faf8(list_node_t *node) {
    list_node_t *next = node->next;
    list_node_t *prev = node->prev;
    if (next) next->prev = prev;
    if (prev) prev->next = next;
    return 0;
}
