/* func_020119c0: indexed halfword table lookup + tail-call (C-16 family).
 * mwcc emits multiplication for non-power-of-2 stride (0xc).
 *
 *     mov   r1, #0xc
 *     mul   r1, r0, r1
 *     ldr   r0, .L_02011a0c       ; r0 = data_020b51e0
 *     ldr   ip, .L_02011a10       ; ip = func_02019318
 *     ldrh  r0, [r0, r1]
 *     bx    ip
 */

extern unsigned short data_020b51e0[];
extern int func_02019318(unsigned int x);

int func_020119c0(int i) {
    return func_02019318(*(unsigned short *)((char *)data_020b51e0 + i * 12));
}
