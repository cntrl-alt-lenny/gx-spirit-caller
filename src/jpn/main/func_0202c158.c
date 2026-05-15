/* func_0202c158: 2-step chain of conditional Task_InvokeLocked +
 * slot-zero on `data_0219a85c->f_18` and `f_1c`. The second step
 * uses a predicated pop (`ldmeqia`) for the early-out null case.
 * Style B epilogue with r3-spill push (3 regs → push {r3, lr}).
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, .L_0202c204
 *     ldr   r0, [r0, #0x0]
 *     ldr   r0, [r0, #0x18]
 *     cmp   r0, #0x0
 *     beq   .L_0202c1d8
 *     bl    Task_InvokeLocked
 *     ldr   r0, .L_0202c204
 *     mov   r1, #0x0
 *     ldr   r0, [r0, #0x0]
 *     str   r1, [r0, #0x18]
 *  .L_0202c1d8:
 *     ldr   r0, .L_0202c204
 *     ldr   r0, [r0, #0x0]
 *     ldr   r0, [r0, #0x1c]
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    Task_InvokeLocked
 *     ldr   r0, .L_0202c204
 *     mov   r1, #0x0
 *     ldr   r0, [r0, #0x0]
 *     str   r1, [r0, #0x1c]
 *     ldmia sp!, {r3, pc}
 *  .L_0202c204: .word data_0219a85c
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    char  _pad0[0x18];
    void *f_18;
    void *f_1c;
} state_0219a93c_t;

extern state_0219a93c_t *data_0219a85c;

void func_0202c158(void) {
    if (data_0219a85c->f_18 != 0) {
        Task_InvokeLocked(data_0219a85c->f_18);
        data_0219a85c->f_18 = 0;
    }
    if (data_0219a85c->f_1c != 0) {
        Task_InvokeLocked(data_0219a85c->f_1c);
        data_0219a85c->f_1c = 0;
    }
}
