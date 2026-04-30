; func_02092934: invalidate ICache (mcr c7, c5, #0).
;
;     mov r0, #0x0
;     mcr p15, #0, r0, c7, c5, #0
;     bx lr

        .text
        .global func_02092934
        .arm
func_02092934:
        mov     r0, #0x0
        mcr     p15, 0, r0, c7, c5, 0
        bx      lr
