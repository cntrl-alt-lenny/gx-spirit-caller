/* func_ov000_021ab21c: zero-fill state + clear bits 13..15 of two
 * I/O registers at 0x04000000 and 0x04001000 (NDS DISPCNT_A /
 * DISPCNT_B engine-control registers).
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, .L_021ab254            ; r1 = &data_ov000_021c7530
 *     mov   r0, #0x0
 *     mov   r2, #0x5c
 *     bl    Fill32                     ; zero 0x5c bytes of state
 *     mov   r2, #0x4000000             ; r2 = REG_DISPCNT_A base
 *     ldr   r0, [r2, #0x0]             ; r0 = *DISPCNT_A
 *     add   r1, r2, #0x1000            ; r1 = REG_DISPCNT_B base
 *     bic   r0, r0, #0xe000            ; clear bits 13..15 (bgMode)
 *     str   r0, [r2, #0x0]
 *     ldr   r0, [r1, #0x0]             ; same for engine B
 *     bic   r0, r0, #0xe000
 *     str   r0, [r1, #0x0]
 *     ldmia sp!, {r3, pc}
 */

extern void Fill32(unsigned int value, void *dest, int size_bytes);
extern char data_ov000_021c7530[];

void func_ov000_021ab21c(void) {
    volatile unsigned int *dispcnt_a = (volatile unsigned int *)0x04000000;
    volatile unsigned int *dispcnt_b = (volatile unsigned int *)0x04001000;
    Fill32(0, data_ov000_021c7530, 0x5c);
    *dispcnt_a &= ~0xe000u;
    *dispcnt_b &= ~0xe000u;
}
