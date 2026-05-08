/* func_0203eee0: byte-arg dispatcher returning constant 0x10.
 * Reads a byte at offset 0xd0d in the arg, passes it to
 * func_0203c824, returns 0x10. sp3 signature (sub sp + 1-step
 * pop into pc).
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldrb  r0, [r0, #0xd0d]
 *     bl    func_0203c824
 *     mov   r0, #0x10
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_0203c824(int x);

int func_0203eee0(unsigned char *p) {
    func_0203c824(p[0xd0d]);
    return 0x10;
}
