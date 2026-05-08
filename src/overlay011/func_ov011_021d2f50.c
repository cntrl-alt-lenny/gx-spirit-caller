/* func_ov011_021d2f50: invoke + clear p->f_0 twice (the second
 * call is a no-op since the first zeroed it; the asm has the
 * pattern duplicated literally). Returns p.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     ldr   r0, [r4, #0x0]
 *     cmp   r0, #0x0
 *     beq   .L_021d2f70
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x0]
 *  .L_021d2f70:
 *     ldr   r0, [r4, #0x0]
 *     cmp   r0, #0x0
 *     beq   .L_021d2f88
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x0]
 *  .L_021d2f88:
 *     mov   r0, r4
 *     ldmia sp!, {r4, pc}
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    void *f_0;
} state_ov011_021d2f50_t;

state_ov011_021d2f50_t *func_ov011_021d2f50(state_ov011_021d2f50_t *p) {
    if (p->f_0) {
        Task_InvokeLocked(p->f_0);
        p->f_0 = 0;
    }
    if (p->f_0) {
        Task_InvokeLocked(p->f_0);
        p->f_0 = 0;
    }
    return p;
}
