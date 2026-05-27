/* func_0208e1ac — VRAM page address derived from VRAMCNT_E wider field.
 * Brief 234 Part B — mechanical cleanup using brief 233 C-40 recipe.
 *
 *     ldr   r0, .L_pool                ; load MMIO addr 0x0400100a
 *     ldrh  r0, [r0, #0]               ; read VRAMCNT_E u16
 *     and   r0, r0, #0x1f00            ; mask wider field (bits 12:8)
 *     mov   r0, r0, asr #8             ; signed shift to bits 4:0
 *     mov   r0, r0, lsl #0xb           ; scale by 2 KB
 *     add   r0, r0, #0x6200000         ; add VRAM-B base
 *     bx    lr
 *     .word 0x0400100a                 ; VRAMCNT_E
 *
 * Brief 233 recipe with wider mask (0x1f00) and different shift amounts
 * (asr #8 / lsl #0xb) compared to the OFS-field sibling.
 */

#define VRAMCNT_E (*(volatile unsigned short *)0x0400100a)

void *func_0208e1ac(void) {
    return (void *)((((VRAMCNT_E & 0x1f00) >> 8) << 0xb) + 0x6200000);
}
