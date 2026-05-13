/* func_ov002_0228dde0: stack-buffer call + diff of two int fields.
 * Local int[11] receives output from helper; returns diff buf[6] - buf[5].
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x2c
 *     add   r2, sp, #0x0
 *     bl    func_ov002_021c4c9c
 *     ldr   r1, [sp, #0x18]
 *     ldr   r0, [sp, #0x14]
 *     sub   r0, r1, r0
 *     add   sp, sp, #0x2c
 *     ldmia sp!, {pc}
 */

extern void func_ov002_021c4c9c(int a, int b, int *buf);

int func_ov002_0228dde0(int a, int b) {
    int buf[11];
    func_ov002_021c4c9c(a, b, buf);
    return buf[6] - buf[5];
}
