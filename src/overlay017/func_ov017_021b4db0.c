/* func_ov017_021b4db0: clear bit 2 of the BG control field (bits 12:8) of the
 * sub-display 0x04001000 register, then clear the 0x800-byte VRAM block from
 * func_0208e0a0. Returns 1.
 *
 *     ldr r1,[r2]; ldr r0,[r2]; and r1,#0x1f00; mov r3,r1,lsr#8
 *     bic r1,r0,#0x1f00; bic r0,r3,#4; orr r0,r1,r0,lsl#8; str r0,[r2]
 */

extern void *func_0208e0a0(void);
extern void func_02094504(int val, void *dst, unsigned int size);

int func_ov017_021b4db0(void) {
    volatile unsigned int *reg = (volatile unsigned int *)0x04001000;
    unsigned int field = (*reg & 0x1f00) >> 8;
    *reg = (*reg & ~0x1f00) | ((field & ~4) << 8);
    func_02094504(0, func_0208e0a0(), 0x800);
    return 1;
}
