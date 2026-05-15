/* func_0206ee2c: byte-swap halfword + tail-call. C-20 drop-in per
 * brief 056 — routed via .legacy.c so mwcc 1.2 preserves the
 * explicit lsl/lsr mask pair that mwcc 2.0 would elide.
 *
 *     ldrh  r1, [r1, #0x2]
 *     ldr   ip, .L_0206eec8           ; func_0206c93c
 *     mov   r2, r1, asr #0x8
 *     mov   r1, r1, lsl #0x8
 *     and   r2, r2, #0xff
 *     and   r1, r1, #0xff00
 *     orr   r1, r2, r1
 *     mov   r1, r1, lsl #0x10
 *     mov   r1, r1, lsr #0x10
 *     bx    ip
 */

extern void func_0206c93c(int p, unsigned int swapped);

void func_0206ee2c(int p, void *src) {
    int h = *(unsigned short *)((char *)src + 2);
    func_0206c93c(p,
        (unsigned int)(unsigned short)(((h >> 8) & 0xff) | ((h << 8) & 0xff00)));
}
