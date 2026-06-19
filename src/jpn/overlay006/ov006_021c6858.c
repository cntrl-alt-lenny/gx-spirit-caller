/* func_ov006_021c6858: zero-fill ov006 data + clear obj[0x4], return 1.
 *
 *     stmdb sp!, {r4, lr}
 *     ldr   r1, .L_021c698c            ; r1 = &data_ov006_0225dd50
 *     mov   r4, r0                     ; cache obj
 *     mov   r0, #0x0
 *     mov   r2, #0x38
 *     bl    Fill32
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x4]             ; obj[0x4] = 0
 *     mov   r0, #0x1
 *     ldmia sp!, {r4, pc}
 */

extern void Fill32(unsigned int value, void *dest, int size_bytes);
extern char data_ov006_0225dd50[];

int func_ov006_021c6858(void *obj) {
    Fill32(0, data_ov006_0225dd50, 0x38);
    *(int *)((char *)obj + 0x4) = 0;
    return 1;
}
