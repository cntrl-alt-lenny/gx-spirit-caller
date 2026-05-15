/* func_0201107c: bounds-check (0..1) + table lookup with stride 0xb8.
 *
 *     cmp   r0, #0x0
 *     blt   .L_020110a8
 *     cmp   r0, #0x2
 *     blt   .L_020110b0
 *   .L_020110a8:
 *     mov   r0, #0x0
 *     bx    lr
 *   .L_020110b0:
 *     ldr   r2, .L_020110c0       ; r2 = &data_0218fc30
 *     mov   r1, #0xb8
 *     mla   r0, r1, r0, r2        ; r0 = data_0218fc30 + i * 0xb8
 *     bx    lr
 */

extern char data_0218fc30[];

void *func_0201107c(int i) {
    if (i < 0 || i >= 2) return 0;
    return data_0218fc30 + i * 0xb8;
}
