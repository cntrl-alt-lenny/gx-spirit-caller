/* func_02031a70: linked-list iterate-and-call. Walks `h->first`
 * via `n->next20`, calling func_020319a0(n, b, c, d) on each.
 *
 *     stmdb sp!, {r3, r4, r5, r6, r7, lr}
 *     ldr   r4, [r0, #0x18]               ; head->first
 *     mov   r7, r1
 *     mov   r6, r2
 *     mov   r5, r3
 *     cmp   r4, #0x0
 *     ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
 *  .L_02031a8c:
 *     mov   r0, r4
 *     mov   r1, r7
 *     mov   r2, r6
 *     mov   r3, r5
 *     bl    func_020319a0
 *     ldr   r4, [r4, #0x20]                ; node->next
 *     cmp   r4, #0x0
 *     bne   .L_02031a8c
 *     ldmia sp!, {r3, r4, r5, r6, r7, pc}
 */

typedef struct list_node_02031a70 {
    char _pad[0x20];
    struct list_node_02031a70 *next;
} list_node_02031a70_t;

typedef struct list_head_02031a70 {
    char                  _pad[0x18];
    list_node_02031a70_t *first;
} list_head_02031a70_t;

extern int func_020319a0(list_node_02031a70_t *n, int a, int b, int c);

void func_02031a70(list_head_02031a70_t *h, int a, int b, int c) {
    list_node_02031a70_t *n;
    for (n = h->first; n != 0; n = n->next) {
        func_020319a0(n, a, b, c);
    }
}
