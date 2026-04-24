/* func_0200ad90: if data_02186ae8[0x14] is non-null, dispatch it via
 * Task_InvokeLocked and then clear the slot.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, .L_0200adb8
 *     ldr   r0, [r0, #0x14]
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}            ; null → return
 *     bl    Task_InvokeLocked
 *     ldr   r0, .L_0200adb8
 *     mov   r1, #0x0
 *     str   r1, [r0, #0x14]            ; slot = NULL
 *     ldmia sp!, {r3, pc}
 *   .L_0200adb8: .word data_02186ae8
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    char  _pad_00[0x14];
    void *slot;
} data_02186ae8_t;

extern data_02186ae8_t data_02186ae8;

void func_0200ad90(void) {
    void *p = data_02186ae8.slot;
    if (p == 0) return;
    Task_InvokeLocked(p);
    data_02186ae8.slot = 0;
}
