/* func_ov005_021abb1c: 4-step chain of conditional
 * Task_InvokeLocked + slot-zero. The last step uses a predicated
 * pop (`ldmeqia`) to early-return when the slot is null, saving
 * one branch. Style B epilogue → default .c.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     ldr   r0, [r4, #0x2c]
 *     cmp   r0, #0x0
 *     beq   .L_021abc1c
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x2c]
 *  .L_021abc1c:
 *     ldr   r0, [r4, #0x28]
 *     cmp   r0, #0x0
 *     beq   .L_021abc34
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x28]
 *  .L_021abc34:
 *     ldr   r0, [r4, #0x60]
 *     cmp   r0, #0x0
 *     beq   .L_021abc4c
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x60]
 *  .L_021abc4c:
 *     ldr   r0, [r4, #0x3c]
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r4, pc}            ; predicated pop on null
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x3c]
 *     ldmia sp!, {r4, pc}
 *
 * Field order in source: f_2c, f_28, f_60, f_3c (matches asm
 * order, NOT struct address order).
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    char  _pad0[0x28];
    void *f_28;
    void *f_2c;
    char  _pad30[0xc];
    void *f_3c;
    char  _pad40[0x20];
    void *f_60;
} state_ov005_021abbfc_t;

void func_ov005_021abb1c(state_ov005_021abbfc_t *p) {
    if (p->f_2c) {
        Task_InvokeLocked(p->f_2c);
        p->f_2c = 0;
    }
    if (p->f_28) {
        Task_InvokeLocked(p->f_28);
        p->f_28 = 0;
    }
    if (p->f_60) {
        Task_InvokeLocked(p->f_60);
        p->f_60 = 0;
    }
    if (p->f_3c) {
        Task_InvokeLocked(p->f_3c);
        p->f_3c = 0;
    }
}
