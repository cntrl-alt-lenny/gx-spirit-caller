/* func_020097b8: byte read of stride-0x1c table indexed by `arg - 1`.
 *
 *     sub r1, r0, #0x1
 *     mov r0, #0x1c
 *     mul r2, r1, r0           ; r2 = (arg-1) * 0x1c
 *     ldr r0, .L_020097ec
 *     ldrb r0, [r0, r2]
 *     bx  lr
 *
 * mwcc folds the subtract-by-1 ahead of the multiply; the indexed
 * load uses register-form addressing (no immediate offset).
 */

extern unsigned char data_021063f0[];

unsigned char func_020097b8(int idx) {
    return data_021063f0[(idx - 1) * 0x1c];
}
