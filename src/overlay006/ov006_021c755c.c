/* func_ov006_021c755c: zero-fill 0x120 bytes of data_ov006_0225df3c, return 1.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, =data_ov006_0225df3c
 *     mov   r0, #0x0
 *     mov   r2, #0x120
 *     bl    Fill32              ; memfill(value, dest, count)
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void Fill32(int value, void *dest, int count);
extern char data_ov006_0225df3c[];

int func_ov006_021c755c(void) {
    Fill32(0, data_ov006_0225df3c, 0x120);
    return 1;
}
