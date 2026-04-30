; func_02092860: invalidate entire instruction cache (mcr c7, c5, #0).
;
;     mov r0, #0x0
;     mcr p15, #0, r0, c7, c5, #0     ; invalidate ICache
;     bx lr
;
; mcr is privileged — must ship as .s.

        .text
        .global func_02092860
        .arm
func_02092860:
        mov     r0, #0x0
        mcr     p15, 0, r0, c7, c6, 0
        bx      lr
