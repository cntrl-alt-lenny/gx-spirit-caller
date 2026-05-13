/* func_02095bf8: increment byte at +0x8 of row in 12-byte-strided array.
 * Uses mla to fuse row-address computation (stride 0xc, not power-of-2).
 *
 *     ldr  r2, .L_02095c14            ; data_021a8220
 *     mov  r1, #0xc
 *     mla  r1, r0, r1, r2
 *     ldrb r0, [r1, #0x8]
 *     add  r0, r0, #0x1
 *     strb r0, [r1, #0x8]
 *     bx   lr
 */

extern char data_021a8220[];

void func_02095bf8(int idx) {
    unsigned char *p = (unsigned char *)(data_021a8220 + idx * 0xc + 0x8);
    *p = (unsigned char)(*p + 1);
}
