/* func_02095298: IRQ-bracketed pop-front of linked list at
 * data_021a666c. Returns the popped node (or NULL if empty).
 * If the new head is NULL, also clears the tail pointer
 * data_021a667c. Style A epilogue → .legacy.c.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_020953dc
 *     ldr   r4, [r1, #0x0]
 *     cmp   r4, #0x0
 *     bne   .L_020953b4
 *     bl    OS_RestoreIrq
 *     mov   r0, #0x0
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_020953b4:
 *     ldr   r2, [r4, #0x0]
 *     str   r2, [r1, #0x0]
 *     cmp   r2, #0x0
 *     ldreq r1, .L_020953e0
 *     moveq r2, #0x0
 *     streq r2, [r1, #0x0]
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_020953dc: .word data_021a666c
 *  .L_020953e0: .word data_021a667c
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

typedef struct list_node_4 {
    struct list_node_4 *next;
} list_node_4_t;

extern list_node_4_t *data_021a666c;  /* head */
extern void          *data_021a667c;  /* tail */

list_node_4_t *func_02095298(void) {
    int saved;
    list_node_4_t *head;
    list_node_4_t *nxt;
    saved = OS_DisableIrq();
    head = data_021a666c;
    if (head == 0) {
        OS_RestoreIrq(saved);
        return 0;
    }
    nxt = head->next;
    data_021a666c = nxt;
    if (nxt == 0) {
        data_021a667c = 0;
    }
    OS_RestoreIrq(saved);
    return head;
}
