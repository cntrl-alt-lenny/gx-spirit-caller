/* func_020119e0: indexed halfword table lookup + add-offset + tail-call.
 * Row stride is 12 bytes (not power-of-2) so mwcc emits `mov #0xc; mul`.
 * The +0x8ca constant doesn't fit in one ARM imm so it's split into
 * `+0xca` and `+0x800`.
 *
 *     mov   r1, #0xc
 *     mul   r1, r0, r1
 *     ldr   r0, .L_02011a34           ; data_020b51e2
 *     ldr   ip, .L_02011a38           ; func_0202c06c
 *     ldrh  r0, [r0, r1]
 *     add   r0, r0, #0xca
 *     add   r0, r0, #0x800
 *     bx    ip
 */

extern char data_020b51e2[];
extern int  func_0202c06c(int x);

int func_020119e0(int i) {
    unsigned short *p = (unsigned short *)(data_020b51e2 + i * 12);
    return func_0202c06c(*p + 0x8ca);
}
