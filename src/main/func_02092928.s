; func_02092928: drain write buffer (mcr c7, c10, #4).
;
;     mov r0, #0x0
;     mcr p15, #0, r0, c7, c10, #4    ; data sync barrier / drain WB
;     bx lr

        .text
        .global func_02092928
        .arm
func_02092928:
        mov     r0, #0x0
        mcr     p15, 0, r0, c7, c10, 4
        bx      lr
