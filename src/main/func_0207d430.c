/* func_0207d430: sum a singly-linked list. Walks p->f_24 via n->f_c
 * (next), accumulating n->f_4 into the sum. Returns 0 if list empty.
 *
 *     ldr   r2, [r0, #0x24]            ; n = p->head
 *     mov   r0, #0x0                   ; sum = 0
 *     cmp   r2, #0x0
 *     bxeq  lr
 *  .L_0207d440:
 *     ldr   r1, [r2, #0x4]             ; val = n->val
 *     ldr   r2, [r2, #0xc]             ; n   = n->next
 *     add   r0, r0, r1                 ; sum += val
 *     cmp   r2, #0x0
 *     bne   .L_0207d440
 *     bx    lr
 */

typedef struct node_0207d430 {
    char                  _pad0[0x4];
    int                   val;
    char                  _pad1[0x4];
    struct node_0207d430 *next;
} node_0207d430_t;

typedef struct {
    char              _pad[0x24];
    node_0207d430_t  *head;
} owner_0207d430_t;

int func_0207d430(owner_0207d430_t *p) {
    node_0207d430_t *n = p->head;
    int              sum = 0;
    if (n == 0) return 0;
    do {
        sum += n->val;
        n = n->next;
    } while (n != 0);
    return sum;
}
