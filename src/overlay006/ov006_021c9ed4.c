/* func_ov006_021c9ed4: zero-fill 0x8c bytes of data_ov006_0225e068, return 1.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, =data_ov006_0225e068
 *     mov   r0, #0x0
 *     mov   r2, #0x8c
 *     bl    func_020944c0              ; memfill(value, dest, count)
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void func_020944c0(int value, void *dest, int count);
extern char data_ov006_0225e068[];

int func_ov006_021c9ed4(void) {
    func_020944c0(0, data_ov006_0225e068, 0x8c);
    return 1;
}
