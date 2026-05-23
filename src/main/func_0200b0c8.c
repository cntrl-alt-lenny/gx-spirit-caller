/* B-22 stub for brief 198 permuter wave — task-list walker.
 *
 *     push  {r4, r5, r6, lr}
 *     movs  r6, r0
 *     beq   .L_done                          ; if NULL return 0
 *     ldr   r5, [r6]                          ; length
 *     mov   r4, #0
 *     cmp   r5, #0
 *     ble   .L_after_loop
 *   .Lloop:
 *     ldr   r0, [r6, #4]
 *     ldr   r0, [r0, r4, lsl #2]
 *     cmp   r0, #0
 *     beq   .Lskip
 *     bl    Task_InvokeLocked
 *   .Lskip:
 *     add   r4, #1; cmp r4, r5; blt .Lloop
 *   .L_after_loop:
 *     ldr   r0, [r6, #4]; bl Task_InvokeLocked
 *     mov   r0, r6;      bl Task_InvokeLocked
 *     mov   r0, #1
 *     pop   {r4, r5, r6, pc}
 *   .L_done: mov r0, #0; pop
 */

typedef struct {
    int length;
    void **handlers;
} task_list_t;

extern int Task_InvokeLocked(void *task);

int func_0200b0c8(task_list_t *list) {
    int i;
    if (list == 0) {
        return 0;
    }
    for (i = 0; i < list->length; i++) {
        if (list->handlers[i] != 0) {
            Task_InvokeLocked(list->handlers[i]);
        }
    }
    Task_InvokeLocked(list->handlers);
    Task_InvokeLocked(list);
    return 1;
}
