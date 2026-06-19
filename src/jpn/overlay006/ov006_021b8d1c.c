/* func_ov006_021b8d1c: conditional Task_InvokeLocked + clear at obj + 0xc000 + 0xa90.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0                    ; cache obj
 *     add   r0, r4, #0xc000            ; split-add for offset 0xca90
 *     ldr   r0, [r0, #0xa90]
 *     cmp   r0, #0x0
 *     beq   .L_021b8e44
 *     bl    Task_InvokeLocked
 *     add   r0, r4, #0xc000
 *     mov   r1, #0x0
 *     str   r1, [r0, #0xa90]          ; clear the slot
 *   .L_021b8e44:
 *     mov   r0, #0x1
 *     ldmia sp!, {r4, pc}
 *
 * 12 insns, 0x30 bytes.
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    char  _pad_00[0xca90];
    void *handle;
} ov006_obj_t;

int func_ov006_021b8d1c(ov006_obj_t *obj) {
    void *p = obj->handle;
    if (p != 0) {
        Task_InvokeLocked(p);
        obj->handle = 0;
    }
    return 1;
}
