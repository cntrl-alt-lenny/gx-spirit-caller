/* func_ov002_021ae5c4: clone of 021ae60c with subkind constant #9.
 * C-20 unblock via .legacy.c routing.
 *
 *     mov   r2, r2, lsl #0x10
 *     mov   r2, r2, lsr #0x10
 *     mov   r3, r2, lsl #0x10
 *     mov   r1, r1, lsl #0x10
 *     mov   r2, r0
 *     orr   r3, r3, r1, lsr #0x10
 *     ldr   ip, .L_021ae6cc           ; func_ov002_0229acd0
 *     mov   r0, #0x31
 *     mov   r1, #0x9
 *     bx    ip
 */

extern void func_ov002_0229acd0(int kind, int subkind, int p, unsigned int packed);

void func_ov002_021ae5c4(int p, unsigned int b, unsigned int c) {
    func_ov002_0229acd0(0x31, 9, p,
        ((unsigned int)(unsigned short)c << 16) | (unsigned int)(unsigned short)b);
}
