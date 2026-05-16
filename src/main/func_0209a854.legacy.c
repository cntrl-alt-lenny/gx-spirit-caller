/* func_0209a854: linked-list walk with per-node fn(data) (sp2p3).
 *
 *     push  {r4, lr}
 *     movs  r4, r0
 *     popeq {r4, lr}
 *     bxeq  lr
 * .L_0209a864:
 *     ldr   r0, [r4, #0x4]        ; data
 *     ldr   r1, [r4, #0x0]        ; fn
 *     blx   r1                    ; fn(data)
 *     ldr   r4, [r4, #0x8]        ; next
 *     cmp   r4, #0x0
 *     bne   .L_0209a864
 *     pop   {r4, lr}
 *     bx    lr
 */

typedef void (*fn_0209a854_t)(void *data);

typedef struct node_0209a854 {
    fn_0209a854_t              fn;          /* +0x0 */
    void                      *data;        /* +0x4 */
    struct node_0209a854      *next;        /* +0x8 */
} node_0209a854_t;

void func_0209a854(node_0209a854_t *n) {
    if (n == 0) return;
    do {
        n->fn(n->data);
        n = n->next;
    } while (n != 0);
}
