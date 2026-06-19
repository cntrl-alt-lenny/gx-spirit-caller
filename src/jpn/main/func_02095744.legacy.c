/* func_02095744: IRQ-bracketed linked-list "append node" — if
 * the tail (data_021a6678) is null, point head AND tail at the
 * new node; otherwise chain the new node onto the current tail
 * and update tail. Always: arg->next = NULL.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    OS_DisableIrq
 *     ldr   r2, .L_02095878          ; r2 = &data_021a6678 (tail slot)
 *     ldr   r1, [r2, #0x0]            ; r1 = current tail
 *     cmp   r1, #0x0
 *     ldreq r1, .L_0209587c           ; r1 = &data_021a6674 (head slot)
 *     streq r4, [r2, #0x0]            ; tail = arg
 *     streq r4, [r1, #0x0]            ; head = arg
 *     strne r4, [r1, #0x0]            ; cur_tail->next = arg
 *     strne r4, [r2, #0x0]            ; tail = arg
 *     mov   r1, #0x0
 *     str   r1, [r4, #0x0]            ; arg->next = 0
 *     bl    OS_RestoreIrq
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_02095878: .word data_021a6678
 *  .L_0209587c: .word data_021a6674
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct list_node_3 {
    struct list_node_3 *next;
} list_node_3_t;

extern list_node_3_t *data_021a6674;  /* head */
extern list_node_3_t *data_021a6678;  /* tail */

void func_02095744(list_node_3_t *arg) {
    int saved = OS_DisableIrq();
    if (data_021a6678 == 0) {
        data_021a6678 = arg;
        data_021a6674 = arg;
    } else {
        data_021a6678->next = arg;
        data_021a6678 = arg;
    }
    arg->next = 0;
    OS_RestoreIrq(saved);
}
