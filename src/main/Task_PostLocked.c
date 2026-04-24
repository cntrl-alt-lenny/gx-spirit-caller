/* Task_PostLocked: Task_InvokeLocked sibling — see scouting doc #175.
 * Body: IRQ-bracketed 2-worker dispatch + counter increment +
 * failure cleanup.
 *
 *     stmdb sp!, {r4, r5, r6, lr}
 *     mov   r6, r0                    ; cache arg0
 *     mov   r5, r1                    ; cache arg1
 *     mov   r4, r2                    ; cache arg2
 *     bl    OS_DisableIrq
 *     mov   r1, r4, lsl #0x10         ; zero-extend arg2 to u16
 *     ldr   r2, .L_0200686c
 *     mov   r4, r0                    ; reuse r4 for saved mask
 *     ldr   r0, [r2, #0x1c]
 *     mov   r1, r1, lsr #0x10
 *     bl    func_0207d36c
 *     ldr   r0, .L_0200686c
 *     mov   r1, r6
 *     ldr   r0, [r0, #0x1c]
 *     mov   r2, r5
 *     bl    func_0207d494
 *     mov   r5, r0                    ; reuse r5 for result
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     ldr   r0, .L_0200686c
 *     cmp   r5, #0x0
 *     ldr   r1, [r0, #0x18]
 *     add   r1, r1, #0x1
 *     str   r1, [r0, #0x18]
 *     bne   .L_02006864
 *     bl    func_020067f8
 *   .L_02006864:
 *     mov   r0, r5
 *     ldmia sp!, {r4, r5, r6, pc}
 *   .L_0200686c: .word data_02104f1c
 *
 * 21 insns + 1 pool word, 0x74 bytes. Register reuse is critical:
 * r4 holds arg2 initially, then saved-mask; r5 holds arg1 then
 * result. Passing arg2 as `int` (not `unsigned short`) lets mwcc
 * emit the `lsl 16; lsr 16` zero-extension that baserom uses and
 * free r4 for reuse.
 */

typedef struct {
    char _pad_00[0x18];
    int  counter;
    void *handler_ctx;
} manager_t;

extern manager_t data_02104f1c;
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_0207d36c(void *ctx, unsigned short arg);
extern int  func_0207d494(void *ctx, void *arg0, int arg1);
extern void func_020067f8(void);

int Task_PostLocked(void *arg0, int arg1, int arg2) {
    int saved = OS_DisableIrq();
    int result;

    func_0207d36c(data_02104f1c.handler_ctx, (unsigned short)arg2);
    result = func_0207d494(data_02104f1c.handler_ctx, arg0, arg1);
    OS_RestoreIrq(saved);

    data_02104f1c.counter++;
    if (result == 0) {
        func_020067f8();
    }
    return result;
}
