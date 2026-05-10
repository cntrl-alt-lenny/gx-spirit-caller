/* func_0202c228: similar to func_0202c208 with offset 0x212.
 * (split as +0x12 + +0x200 because 0x212 doesn't fit in 8-bit
 * rotated immediate.)
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     ldreq r0, .L_0202c248
 *     ldmeqia sp!, {r3, pc}
 *     add   r0, r0, #0x12
 *     add   r0, r0, #0x200
 *     bl    func_0202c0c0
 *     ldmia sp!, {r3, pc}
 *  .L_0202c248: .word data_020c6a9c
 */

extern char data_020c6a9c[];
extern int  func_0202c0c0(void *p);

int func_0202c228(char *p) {
    if (p == 0) return (int)data_020c6a9c;
    return func_0202c0c0(p + 0x212);
}
