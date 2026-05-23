/* B-24 stub for brief 198 permuter wave — task-state setter (ov011).
 *
 *     push  {r4, lr}
 *     sub   sp, sp, #16             ; 4 local int slots
 *     mov   r4, r0
 *     str   r1, [r4, #0x2c]
 *     str   r2, [r4, #0x30]
 *     ldr   r0, [r4, #0x34]
 *     str   r1, [sp, #8]
 *     bic   r0, r0, #1
 *     str   r0, [r4, #0x34]
 *     ldr   r0, [r4, #0x20]
 *     str   r2, [sp, #0xc]
 *     str   r1, [sp]
 *     str   r2, [sp, #4]
 *     cmp   r0, #0
 *     beq   .L_021d2cf0
 *     bl    Task_InvokeLocked
 *     mov   r0, #0
 *     str   r0, [r4, #0x20]
 *   .L_021d2cf0:
 *     ldr   r0, [r4, #0x40]
 *     bic   r0, r0, #0x100
 *     str   r0, [r4, #0x40]
 *     add   sp, sp, #16
 *     pop   {r4, pc}
 *
 * The 4 stack writes are unexplained — mwcc's spill of (a, b) into
 * locals. Permuter target.
 */

typedef struct {
    char _0[0x20];
    void *task_handle;
    char _24[0x8];
    int f_2c;
    int f_30;
    int f_34;
    char _38[0x8];
    int f_40;
} state_t;

extern int Task_InvokeLocked(void *task);

void func_ov011_021d2ca8(state_t *p, int a, int b) {
    p->f_2c = a;
    p->f_30 = b;
    p->f_34 &= ~1;
    if (p->task_handle != 0) {
        Task_InvokeLocked(p->task_handle);
        p->task_handle = 0;
    }
    p->f_40 &= ~0x100;
}
