/* func_02046804: twin of func_020467ec — byte 1 of
 * *func_02062424(). sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_02062424
 *     ldrb  r0, [r0, #0x1]
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern unsigned char *func_02062424(void);

unsigned char func_02046804(void) {
    return func_02062424()[1];
}
