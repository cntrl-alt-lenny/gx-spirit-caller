/* func_020b41bc: linked-list-walk-with-pop until empty (sp1p5 default).
 *
 *     push  {r3, r4, r5, lr}
 *     ldr   r4, .L_020b42f0       ; r4 = &data_021aa3a0
 *     ldr   r2, [r4, #0x0]        ; r2 = data_021aa3a0 (head)
 *     cmp   r2, #0x0
 *     popeq {r3, r4, r5, pc}
 *     mvn   r5, #0x0              ; r5 = -1
 * .L_020b42c8:
 *     ldr   r0, [r2, #0x0]        ; r0 = node->next
 *     mov   r1, r5                ; r1 = -1
 *     str   r0, [r4, #0x0]        ; head = node->next
 *     ldr   r0, [r2, #0x8]        ; r0 = node->arg
 *     ldr   r2, [r2, #0x4]        ; r2 = node->fn
 *     blx   r2                    ; fn(arg, -1)
 *     ldr   r2, [r4, #0x0]        ; reload head
 *     cmp   r2, #0x0
 *     bne   .L_020b42c8
 *     pop   {r3, r4, r5, pc}
 * .L_020b42f0: .word data_021aa3a0
 */

typedef void (*fn_020b42b0_t)(void *arg, int neg1);

typedef struct node_020b42b0 {
    struct node_020b42b0   *next;        /* +0x0 */
    fn_020b42b0_t           fn;          /* +0x4 */
    void                   *arg;         /* +0x8 */
} node_020b42b0_t;

extern node_020b42b0_t *data_021aa3a0;

void func_020b41bc(void) {
    node_020b42b0_t *n = data_021aa3a0;
    if (n == 0) return;
    do {
        data_021aa3a0 = n->next;
        n->fn(n->arg, -1);
        n = data_021aa3a0;
    } while (n != 0);
}
