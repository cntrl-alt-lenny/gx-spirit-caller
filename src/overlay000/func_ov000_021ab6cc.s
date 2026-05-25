; func_ov000_021ab6cc: byte-zero check at offset 0x58 — returns 1 if byte
; is zero, 0 otherwise. Same `lsl/movs lsr; movne/moveq` shape as
; func_020a584c that mwcc 2.0 doesn't reach from plain C — ship as `.s`.

        .text
        .extern data_ov000_021c7530
        .global func_ov000_021ab6cc
        .arm
func_ov000_021ab6cc:
        ldr     r0, .L_021ab6e8
        ldr     r0, [r0, #0x58]
        mov     r0, r0, lsl #0x18
        movs    r0, r0, lsr #0x18
        moveq   r0, #0x1
        movne   r0, #0x0
        bx      lr
.L_021ab6e8:
        .word   data_ov000_021c7530
