; func_02092940: I-cache invalidate loop — invalidate instruction-cache
; lines covering `[r0, r0+r1)`.
;
;     add r1, r1, r0
;     bic r0, r0, #0x1f
;  .L_02092948:
;     mcr p15, #0, r0, c7, c5, #1      ; invalidate I-cache line by MVA
;     add r0, r0, #0x20
;     cmp r0, r1
;     blt .L_02092948
;     bx  lr

        .text

        .global func_02092940
        .arm
func_02092940:
        add     r1, r1, r0
        bic     r0, r0, #0x1f
.L_02092948:
        mcr     p15, 0, r0, c7, c5, 1
        add     r0, r0, #0x20
        cmp     r0, r1
        blt     .L_02092948
        bx      lr
