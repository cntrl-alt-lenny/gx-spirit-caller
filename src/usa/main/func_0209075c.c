/* func_0209075c: clear two adjacent fields of OSi_IrqCheckBuf.
 *
 *     ldr r0, .L_02090858
 *     mov r1, #0x0
 *     str r1, [r0, #0x4]
 *     str r1, [r0, #0x0]
 *     bx  lr
 *  .L_02090858: .word OSi_IrqCheckBuf
 *
 * mwcc emits the two stores in reverse order of the source-level
 * assignments (the `[r0,#0x4]` store comes before the `[r0,#0x0]`
 * store) — RHS of the comma expression is materialised first.
 */

typedef struct {
    int f_0;
    int f_4;
} osi_irq_check_buf_t;

extern osi_irq_check_buf_t OSi_IrqCheckBuf;

void func_0209075c(void) {
    OSi_IrqCheckBuf.f_4 = 0, OSi_IrqCheckBuf.f_0 = 0;
}
