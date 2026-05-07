; func_020928e8: cache-line clean loop — clean (write-back without
; invalidate) D-cache lines covering `[r0, r0+r1)`.
;
;     add r1, r1, r0
;     bic r0, r0, #0x1f
;  .L_020928f0:
;     mcr p15, #0, r0, c7, c10, #1     ; clean D-cache line by MVA
;     add r0, r0, #0x20
;     cmp r0, r1
;     blt .L_020928f0
;     bx  lr

        .text

        .global func_020928e8
        .arm
func_020928e8:
        add     r1, r1, r0
        bic     r0, r0, #0x1f
.L_020928f0:
        mcr     p15, 0, r0, c7, c10, 1
        add     r0, r0, #0x20
        cmp     r0, r1
        blt     .L_020928f0
        bx      lr
