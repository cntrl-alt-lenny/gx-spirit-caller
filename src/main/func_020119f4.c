/* func_020119f4: indexed halfword table lookup + tail-call (C-16 family).
 * mwcc emits multiplication for non-power-of-2 stride (0xc).
 *
 *     mov   r1, #0xc
 *     mul   r1, r0, r1
 *     ldr   r0, .L_02011a0c       ; r0 = data_020b52d4
 *     ldr   ip, .L_02011a10       ; ip = func_0201934c
 *     ldrh  r0, [r0, r1]
 *     bx    ip
 */

extern unsigned short data_020b52d4[];
extern int func_0201934c(unsigned int x);

int func_020119f4(int i) {
    return func_0201934c(*(unsigned short *)((char *)data_020b52d4 + i * 12));
}
