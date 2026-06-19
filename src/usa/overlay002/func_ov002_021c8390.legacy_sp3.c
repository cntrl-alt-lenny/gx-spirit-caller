/* func_ov002_021c8390: stack-based out-param read. Reserves a
 * 0x2c-byte stack buffer, calls callee with (a, b, &buf), reads
 * buf[+0x14] as the return value. sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x2c
 *     add   r2, sp, #0x0
 *     bl    func_ov002_021c4bbc
 *     ldr   r0, [sp, #0x14]
 *     add   sp, sp, #0x2c
 *     ldmia sp!, {pc}
 */

extern void func_ov002_021c4bbc(int a, int b, int *out);

int func_ov002_021c8390(int a, int b) {
    int buf[11];
    func_ov002_021c4bbc(a, b, buf);
    return buf[5];
}
