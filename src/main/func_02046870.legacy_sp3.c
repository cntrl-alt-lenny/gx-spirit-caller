/* func_02046870: twin of func_02046858 — byte 1 of
 * *func_02062498(). sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_02062498
 *     ldrb  r0, [r0, #0x1]
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern unsigned char *func_02062498(void);

unsigned char func_02046870(void) {
    return func_02062498()[1];
}
