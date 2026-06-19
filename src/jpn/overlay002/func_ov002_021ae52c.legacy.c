/* func_ov002_021ae52c: pack 2 halfwords + tail-call. C-20 unblock per
 * brief 056 — route via .legacy.c (mwcc 1.2/sp2p3) with the double-cast
 * `(unsigned int)(unsigned short)c` so mwcc 1.2 preserves the explicit
 * lsl/lsr mask pair that mwcc 2.0 elides.
 *
 *     mov   r2, r2, lsl #0x10
 *     mov   r2, r2, lsr #0x10
 *     mov   r3, r2, lsl #0x10
 *     mov   r1, r1, lsl #0x10
 *     mov   r2, r0
 *     orr   r3, r3, r1, lsr #0x10
 *     ldr   ip, .L_021ae634           ; func_ov002_0229acd0
 *     mov   r0, #0x31
 *     mov   r1, #0x6
 *     bx    ip
 */

extern void func_ov002_0229acd0(int kind, int subkind, int p, unsigned int packed);

void func_ov002_021ae52c(int p, unsigned int b, unsigned int c) {
    func_ov002_0229acd0(0x31, 6, p,
        ((unsigned int)(unsigned short)c << 16) | (unsigned int)(unsigned short)b);
}
