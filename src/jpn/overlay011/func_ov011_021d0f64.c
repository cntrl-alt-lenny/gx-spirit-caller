/* func_ov011_021d0f64: look up a byte in the per-mode 0x72-stride table,
 * indexed by (arg0 - 0x11). The mode row is the 4-bit field at bits 12:9
 * of data_ov011_021d3f5c+0x268.
 *
 *     ldr   r1, =data_ov011_021d3f5c ; ldr r2, =data_ov011_021d31e9
 *     ldr   r3, [r1, #0x268]
 *     mov   r1, #0x72
 *     mov   r3, r3, lsl #0x17 ; mov r3, r3, lsr #0x1c   ; (x >> 9) & 0xf
 *     mla   r1, r3, r1, r2
 *     sub   r0, r0, #0x11
 *     ldrb  r0, [r0, r1]
 *     bx    lr
 */

extern char data_ov011_021d3f5c[];
extern char data_ov011_021d31e9[];

int func_ov011_021d0f64(int arg0) {
    int row = (*(unsigned int *)(data_ov011_021d3f5c + 0x268) << 23) >> 28;
    return *(unsigned char *)(data_ov011_021d31e9 + row * 0x72 + (arg0 - 0x11));
}
