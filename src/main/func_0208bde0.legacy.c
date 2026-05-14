/* func_0208bde0: 32-bit signed integer divide using the DS hardware
 * divider. Returns the quotient.
 *
 *     stmfd sp!, {lr}
 *     sub   sp, sp, #0x4              ; align/scratch
 *     ldr   ip, .L_DIVCNT             ; ip = 0x04000280 (DIVCNT)
 *     mov   lr, #0x0
 *     ldr   r3, .L_NUMER              ; r3 = 0x04000290 (DIV_NUMER lo)
 *     strh  lr, [ip]                  ; DIVCNT = 0  (mode 0: 32/32 → 32)
 *     ldr   r2, .L_DENOM              ; r2 = 0x04000298 (DIV_DENOM lo)
 *     str   r0, [r3, #0x0]             ; *NUMER = arg0
 *     str   r1, [r2, #0x0]             ; *DENOM = arg1
 *     str   lr, [r2, #0x4]             ; *(DENOM+4) = 0  (clear DENOM high)
 * .L_wait:
 *     ldrh  r0, [ip]                  ; r0 = DIVCNT
 *     tst   r0, #0x8000               ; BUSY bit
 *     bne   .L_wait
 *     ldr   r0, .L_RESULT             ; r0 = 0x040002a0 (DIV_RESULT lo)
 *     ldr   r0, [r0]                  ; r0 = *RESULT
 *     add   sp, sp, #0x4
 *     ldmfd sp!, {lr}
 *     bx    lr
 * .L_DIVCNT:  .word 0x04000280
 * .L_NUMER:   .word 0x04000290
 * .L_DENOM:   .word 0x04000298
 * .L_RESULT:  .word 0x040002a0
 *
 * 18 insns + 4 pool words = 0x58 bytes. Companion to func_0208bd88, which
 * returns the remainder (reads 0x040002a8 instead). The two share their
 * setup and wait loop and differ only in the final pool word.
 *
 * Note: DIVCNT is a halfword register; the mode field is in the low byte.
 * The double-volatile reads of DIVCNT in the wait loop are what produces
 * the explicit `ldrh` + `tst` + `bne` sequence (vs. a folded version).
 */

#include <nitro/types.h>

int func_0208bde0(int numer, int denom) {
    vu16 *p_divcnt  = (vu16 *)0x04000280;
    vs32 *p_numer   = (vs32 *)0x04000290;
    vs32 *p_denom   = (vs32 *)0x04000298;
    vs32 *p_result  = (vs32 *)0x040002a0;
    *p_divcnt = 0;
    *p_numer  = numer;
    *p_denom  = denom;
    p_denom[1] = 0;
    while (*p_divcnt & 0x8000)
        ;
    return *p_result;
}
