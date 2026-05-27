/* func_0208df40 — VRAM page address derived from VRAMCNT_C/D OFS field.
 * Brief 234 Part B — mechanical cleanup using brief 233 C-40 recipe.
 *
 *     ldr   r0, .L_pool                ; load MMIO addr 0x04001008
 *     ldrh  r0, [r0, #0]               ; read VRAMCNT_C/D u16
 *     and   r0, r0, #0x3c              ; mask OFS field (bits 5:2)
 *     mov   r0, r0, asr #2             ; signed shift to bits 3:0
 *     mov   r0, r0, lsl #0xe           ; scale by 16 KB
 *     add   r0, r0, #0x6200000         ; add VRAM-B base
 *     bx    lr
 *     .word 0x04001008                 ; VRAMCNT_C/D
 *
 * Brief 233 recipe (`docs/research/mmio-bit-extract.md`): macro-wrap
 * the MMIO cast + single-expression nested shifts + cast to void *.
 * Sibling of `func_0208deec.c` (VRAMCNT_E, 0x0400100a) with the
 * pool addr swapped.
 */

#define VRAMCNT_CD (*(volatile unsigned short *)0x04001008)

void *func_0208df40(void) {
    return (void *)((((VRAMCNT_CD & 0x3c) >> 2) << 0xe) + 0x6200000);
}
