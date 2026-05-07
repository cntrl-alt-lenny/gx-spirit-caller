/* func_020a60a8: extract bit 0 of byte at hardware addr 0x027ffc35.
 *
 *     ldr  r0, .L_020a60bc
 *     ldrb r0, [r0, #0x5]
 *     mov  r0, r0, lsl #0x1f
 *     mov  r0, r0, lsr #0x1f
 *     bx   lr
 *  .L_020a60bc: .word 0x27ffc30
 *
 * Reads the byte at +0x5 of the hardware page at 0x027ffc30 (the
 * NDS shared-WRAM control region) and returns its bit 0 via the
 * `(x << 31) >> 31` shift-pair (preserved here because the result
 * is the function's return value rather than feeding a comparison).
 */

unsigned int func_020a60a8(void) {
    volatile unsigned char *p = (volatile unsigned char *)0x027ffc30;
    return ((unsigned int)p[5] << 31) >> 31;
}
