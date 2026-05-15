/* func_0202c460: dispatch Task_InvokeLocked through 2-level indirection
 * and clear the slot.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, .L_0202c4e4            ; r0 = &data_0219a85c
 *     ldr   r0, [r0, #0x8]             ; r0 = data_0219a85c[0x8] (ptr)
 *     ldr   r0, [r0, #0x0]             ; r0 = *ptr
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}             ; null → return
 *     bl    Task_InvokeLocked
 *     ldr   r0, .L_0202c4e4
 *     mov   r1, #0x0
 *     ldr   r0, [r0, #0x8]             ; reload ptr
 *     str   r1, [r0, #0x0]             ; *ptr = 0
 *     ldmia sp!, {r3, pc}
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    char  _pad_00[0x8];
    void **slot;            /* +0x8: pointer to the actual handle slot */
} data_0219a93c_t;

extern data_0219a93c_t data_0219a85c;

void func_0202c460(void) {
    void *p = *data_0219a85c.slot;
    if (p == 0) return;
    Task_InvokeLocked(p);
    *data_0219a85c.slot = 0;
}
