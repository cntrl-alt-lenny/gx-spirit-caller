/* func_0201174c: null check + table lookup with 4-byte stride at index (2*(i-1)+1)*2.
 *
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     bxeq  lr
 *     sub   r0, r0, #0x1
 *     lsl   r0, r0, #0x1
 *     add   r1, r0, #0x1
 *     ldr   r0, .L_020117a8       ; data_020b4ae0
 *     lsl   r1, r1, #0x1
 *     ldrh  r0, [r0, r1]
 *     bx    lr
 */

extern unsigned short data_020b4ae0[];

unsigned int func_0201174c(int i) {
    if (i == 0) return 0;
    return data_020b4ae0[(i - 1) * 2 + 1];
}
