/* func_02095420: IRQ-bracketed linked-list traversal counter.
 * Counts the number of `next` pointer hops from `data_021a666c`
 * to a NULL terminator. Returns 0 if the head pointer is NULL.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_02095510
 *     mov   r4, #0x0
 *     ldr   r1, [r1, #0x0]
 *     cmp   r1, #0x0
 *     beq   .L_02095500
 *  .L_020954f0:
 *     ldr   r1, [r1, #0x0]
 *     add   r4, r4, #0x1
 *     cmp   r1, #0x0
 *     bne   .L_020954f0
 *  .L_02095500:
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_02095510: .word data_021a666c
 *
 * Style A epilogue → routed via .legacy.c (mwcc 1.2/sp2p3).
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct list_node {
    struct list_node *next;
} list_node_t;

extern list_node_t *data_021a666c;

int func_02095420(void) {
    int saved = OS_DisableIrq();
    int count = 0;
    list_node_t *p = data_021a666c;
    while (p != 0) {
        p = p->next;
        count++;
    }
    OS_RestoreIrq(saved);
    return count;
}
