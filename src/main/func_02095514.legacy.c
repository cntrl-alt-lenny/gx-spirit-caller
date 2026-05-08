/* func_02095514: identical shape to func_020954d4 — IRQ-bracketed
 * linked-list traversal counter, different head pointer.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_02095550
 *     mov   r4, #0x0
 *     ldr   r1, [r1, #0x0]
 *     cmp   r1, #0x0
 *     beq   .L_02095540
 *  .L_02095530:
 *     ldr   r1, [r1, #0x0]
 *     add   r4, r4, #0x1
 *     cmp   r1, #0x0
 *     bne   .L_02095530
 *  .L_02095540:
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_02095550: .word data_021a674c
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct list_node_2 {
    struct list_node_2 *next;
} list_node_2_t;

extern list_node_2_t *data_021a674c;

int func_02095514(void) {
    int saved = OS_DisableIrq();
    int count = 0;
    list_node_2_t *p = data_021a674c;
    while (p != 0) {
        p = p->next;
        count++;
    }
    OS_RestoreIrq(saved);
    return count;
}
