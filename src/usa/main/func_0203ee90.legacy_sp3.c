/* func_0203ee90: byte-arg dispatcher returning constant 0x10.
 * Reads a byte at offset 0xd0d in the arg, passes it to
 * func_0203c7d4, returns 0x10. sp3 signature (sub sp + 1-step
 * pop into pc).
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldrb  r0, [r0, #0xd0d]
 *     bl    func_0203c7d4
 *     mov   r0, #0x10
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_0203c7d4(int x);

int func_0203ee90(unsigned char *p) {
    func_0203c7d4(p[0xd0d]);
    return 0x10;
}
