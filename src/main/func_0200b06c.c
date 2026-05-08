/* func_0200b06c: invoke each non-null entry in p->tasks[0..n-1],
 * then invoke p->tasks itself and p. Returns 1 on success, 0 if
 * p was null. Style B (1-step pop into pc). The asm has TWO
 * separate `pop` instructions — the early-zero return path is
 * a distinct epilogue, not a shared one.
 *
 *     stmdb sp!, {r4, r5, r6, lr}
 *     movs  r6, r0
 *     beq   .L_0200b0c0
 *     ldr   r5, [r6, #0x0]
 *     mov   r4, #0x0
 *     cmp   r5, #0x0
 *     ble   .L_0200b0a8
 *  .L_0200b088:
 *     ldr   r0, [r6, #0x4]
 *     ldr   r0, [r0, r4, lsl #0x2]
 *     cmp   r0, #0x0
 *     beq   .L_0200b09c
 *     bl    Task_InvokeLocked
 *  .L_0200b09c:
 *     add   r4, r4, #0x1
 *     cmp   r4, r5
 *     blt   .L_0200b088
 *  .L_0200b0a8:
 *     ldr   r0, [r6, #0x4]
 *     bl    Task_InvokeLocked
 *     mov   r0, r6
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x1
 *     ldmia sp!, {r4, r5, r6, pc}
 *  .L_0200b0c0:
 *     mov   r0, #0x0
 *     ldmia sp!, {r4, r5, r6, pc}
 *
 * Brief 046 hit a -4 byte shortfall (one less pop than target)
 * because mwcc shared the epilogue between return paths. To
 * force separate pops, the early-zero return goes at the very
 * end of the function with the main flow finishing first.
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    int    count;
    void **tasks;
} task_list_06c_t;

int func_0200b06c(task_list_06c_t *p) {
    int i;
    int n;
    if (p != 0) {
        n = p->count;
        for (i = 0; i < n; i++) {
            void *t = p->tasks[i];
            if (t != 0) Task_InvokeLocked(t);
        }
        Task_InvokeLocked(p->tasks);
        Task_InvokeLocked(p);
        return 1;
    }
    return 0;
}
