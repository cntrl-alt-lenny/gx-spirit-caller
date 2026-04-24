/* func_ov000_021aae70: linked-list traversal — invoke Task_InvokeLocked
 * on each node's handle at +0xc.
 *
 *     stmdb sp!, {r4, lr}
 *     ldr   r0, .L_021aae9c            ; head = *data_ov000_021c752c
 *     ldr   r0, [r0, #0x0]
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r4, pc}
 *   .L_021aae84:
 *     ldr   r4, [r0, #0xc]              ; next = node->next
 *     bl    Task_InvokeLocked            ; invoke node (r0 = node)
 *     mov   r0, r4                      ; advance
 *     cmp   r4, #0x0
 *     bne   .L_021aae84                  ; loop while next
 *     ldmia sp!, {r4, pc}
 *
 * Interesting order: the next-pointer is loaded BEFORE the invoke,
 * so the handle can free/relocate the current node without disrupting
 * traversal. Classic queue-drain pattern.
 */

extern void Task_InvokeLocked(void *p);

typedef struct node {
    char         _pad_00[0xc];
    struct node *next;
} ov000_node_t;

extern ov000_node_t *data_ov000_021c752c;

void func_ov000_021aae70(void) {
    ov000_node_t *p = data_ov000_021c752c;
    while (p != 0) {
        ov000_node_t *next = p->next;
        Task_InvokeLocked(p);
        p = next;
    }
}
