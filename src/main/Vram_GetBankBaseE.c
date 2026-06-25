/* Vram_GetBankBaseE — VRAM bank base address derived from a VRAMCNT_x
 * MMIO register's OFS field. Returns the VRAM page address for the
 * configured slot.
 *
 *     ldr   r0, .L_pool                ; load MMIO address
 *     ldrh  r0, [r0, #0]               ; read u16 register
 *     and   r0, r0, #0x3c              ; mask bits 5:2 (OFS field)
 *     mov   r0, r0, asr #2             ; shift to bits 3:0 (signed)
 *     mov   r0, r0, lsl #0xe           ; scale by 0x4000 (16 KB)
 *     add   r0, r0, #0x6200000         ; add VRAM base (0x06200000)
 *     bx    lr
 *     .word 0x0400100a                 ; VRAMCNT_E (or similar)
 *
 * Brief 219 shipped this as `.s` — the MMIO bit-extract shape
 * didn't have a documented C recipe. Brief 233 found the orig
 * shape reaches under EVERY mwccarm tier (1.2/base through
 * 2.0/sp2p4) from a single-expression bit-extract idiom around
 * a `volatile unsigned short *` MMIO cast.
 *
 * Three structural elements are jointly required:
 *   1. **Macro wrap of the MMIO cast** (`#define REG (*(volatile
 *      unsigned short *)0xADDR)`) — equivalent to inline
 *      `*(volatile unsigned short *)0xADDR` but the macro form
 *      keeps the source readable; both forms produce the same
 *      asm. The volatile-cast embedded directly in the
 *      expression keeps mwcc from materialising an intermediate
 *      named-temp load (which would emit `lsr` instead of the
 *      orig's `asr`).
 *   2. **Single-expression nested shifts**: `((REG & MASK) >>
 *      SHIFT1) << SHIFT2`. Splitting into a temp collapses
 *      both shifts into one `lsl/lsr` of the combined offset
 *      (loses the explicit `asr` + `lsl` pair the orig has).
 *   3. **`+ BASE` directly on the shift result**: stays as
 *      `add r0, r0, #0x6200000` (with rotate-encoded
 *      immediate 0x662). Casting to `void *` keeps the
 *      pointer-arithmetic semantics without altering the asm.
 *
 * The orig uses `asr` (signed shift right) for the field
 * normalisation step. mwcc emits `asr` when the masked value
 * is treated as a signed quantity in-expression — which the
 * direct `(REG & MASK)` form does because `REG` reads as
 * `unsigned short` (promotes to signed int for arithmetic per
 * C integer-promotion rules), and the `>> SHIFT1` on a signed
 * int is implementation-defined-as-arithmetic on mwccarm.
 *
 * Sibling picks shipping the same recipe (decomper followup):
 *   - Vram_GetBankBaseCD: same shape, pool 0x04001008 (VRAMCNT_C/D)
 *   - func_0208e1ac: mask 0x1f00, asr #8, lsl #0xb, pool 0x0400100a
 *   - func_0208e200: same as e1ac with pool 0x04001008
 *
 * Routing: plain `.c` (mwcc 2.0/sp1p5). See
 * `docs/research/mmio-bit-extract.md` for the full variant
 * matrix and detector spec.
 */

#define VRAMCNT_E (*(volatile unsigned short *)0x0400100a)

void *Vram_GetBankBaseE(void) {
    return (void *)((((VRAMCNT_E & 0x3c) >> 2) << 0xe) + 0x6200000);
}
