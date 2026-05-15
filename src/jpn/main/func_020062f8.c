/* func_020062f8: read+disable IME register, tail-call OS_DisableIrq.
 *
 *     ldr   r2, .L_0200632c       ; r2 = 0x4000208 (REG_IME or similar)
 *     ldr   ip, .L_02006330       ; ip = OS_DisableIrq
 *     ldrh  r1, [r2, #0x0]
 *     mov   r0, #0x0
 *     strh  r0, [r2, #0x0]
 *     bx    ip
 */

typedef volatile unsigned short vu16;
extern int OS_DisableIrq(void);

asm void func_020062f8(void) {
    nofralloc
    ldr   r2, =0x04000208
    ldr   ip, =OS_DisableIrq
    ldrh  r1, [r2, #0x0]
    mov   r0, #0x0
    strh  r0, [r2, #0x0]
    bx    ip
}
