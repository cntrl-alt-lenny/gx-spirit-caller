; func_020186b0: bit 0 extract of state[0x8d8] — shipped as .s because
; mwcc's `(v << 31) >> 31` optimizes to `and r0, r0, #1` (1 insn)
; instead of the baserom's `lsl #31; movs ..., lsr #31` (2 insns).
; Both forms are semantically equivalent; the baserom shape survives
; in .s only.
;
;     stmdb sp!, {r3, lr}
;     bl    GetSystemWork
;     ldr   r0, [r0, #0x8d8]
;     mov   r0, r0, lsl #0x1f
;     movs  r0, r0, lsr #0x1f
;     ldmia sp!, {r3, pc}
;
; 6 ARM instructions, 0x18 bytes.

        .text

        .extern GetSystemWork
        .global func_020186b0
        .arm
func_020186b0:
        stmdb   sp!, {r3, lr}
        bl      GetSystemWork
        ldr     r0, [r0, #0x8d8]
        mov     r0, r0, lsl #0x1f
        movs    r0, r0, lsr #0x1f
        ldmia   sp!, {r3, pc}
