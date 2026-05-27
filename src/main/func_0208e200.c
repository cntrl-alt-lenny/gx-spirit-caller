/* func_0208e200 — VRAM page address derived from VRAMCNT_C/D wider field.
 * Brief 234 Part B — mechanical cleanup using brief 233 C-40 recipe.
 *
 *     ldr   r0, .L_pool                ; load MMIO addr 0x04001008
 *     ldrh  r0, [r0, #0]               ; read VRAMCNT_C/D u16
 *     and   r0, r0, #0x1f00            ; mask wider field (bits 12:8)
 *     mov   r0, r0, asr #8             ; signed shift to bits 4:0
 *     mov   r0, r0, lsl #0xb           ; scale by 2 KB
 *     add   r0, r0, #0x6200000         ; add VRAM-B base
 *     bx    lr
 *     .word 0x04001008                 ; VRAMCNT_C/D
 *
 * Brief 233 recipe — wider-field variant on the VRAMCNT_C/D MMIO.
 * Sibling of `func_0208e1ac.c` with pool addr swapped.
 */

#define VRAMCNT_CD (*(volatile unsigned short *)0x04001008)

void *func_0208e200(void) {
    return (void *)((((VRAMCNT_CD & 0x1f00) >> 8) << 0xb) + 0x6200000);
}
