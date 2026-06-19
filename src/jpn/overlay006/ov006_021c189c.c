/* func_ov006_021c189c: Fill32 + multi-field init — zero 0x105c bytes,
 * clear obj[0x44], obj[0x48], set obj[0x70] = arg1, return 1.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r4, r1                    ; cache arg1
 *     mov   r5, r0                    ; cache obj
 *     ldr   r1, .L_021c19dc            ; r1 = &data_ov006_0225ca98
 *     ldr   r2, .L_021c19e0            ; r2 = 0x105c
 *     mov   r0, #0x0
 *     bl    Fill32
 *     mov   r0, #0x0
 *     str   r0, [r5, #0x44]
 *     str   r0, [r5, #0x48]
 *     str   r4, [r5, #0x70]
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern void Fill32(unsigned int value, void *dest, int size_bytes);
extern char data_ov006_0225ca98[];

int func_ov006_021c189c(void *obj, int arg1) {
    Fill32(0, data_ov006_0225ca98, 0x105c);
    *(int *)((char *)obj + 0x44) = 0;
    *(int *)((char *)obj + 0x48) = 0;
    *(int *)((char *)obj + 0x70) = arg1;
    return 1;
}
