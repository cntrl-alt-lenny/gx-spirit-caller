/* func_020467ec: read byte 0 of *func_02062424(). sp3 signature
 * (sub sp + 1-step pop into pc).
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_02062424
 *     ldrb  r0, [r0, #0x0]
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern unsigned char *func_02062424(void);

unsigned char func_020467ec(void) {
    return func_02062424()[0];
}
