/* func_ov006_021cab04: zero-fill 0x2c bytes of data_ov006_0225dfe0, return 1.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, =data_ov006_0225dfe0
 *     mov   r0, #0x0
 *     mov   r2, #0x2c
 *     bl    Fill32              ; memfill(value, dest, count)
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void Fill32(int value, void *dest, int count);
extern char data_ov006_0225dfe0[];

int func_ov006_021cab04(void) {
    Fill32(0, data_ov006_0225dfe0, 0x2c);
    return 1;
}
