/* func_ov011_021d2cc8: conditional dispatch + clear.
 *   p = data_ov011_021d4720[0xc];
 *   if (p) { Task_InvokeLocked(p); data_ov011_021d4720[0xc] = NULL; }
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, .L_021d2de0
 *     ldr   r0, [r0, #0xc]
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    Task_InvokeLocked
 *     ldr   r0, .L_021d2de0
 *     mov   r1, #0x0
 *     str   r1, [r0, #0xc]
 *     ldmia sp!, {r3, pc}
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    char  _pad_00[0xc];
    void *handle;
} data_ov011_021d4800_t;

extern data_ov011_021d4800_t data_ov011_021d4720;

void func_ov011_021d2cc8(void) {
    void *p = data_ov011_021d4720.handle;
    if (p == 0) return;
    Task_InvokeLocked(p);
    data_ov011_021d4720.handle = 0;
}
