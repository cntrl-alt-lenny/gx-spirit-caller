; func_02093bf0: wait-for-interrupt (mcr c7, c0, #4) — halts CPU until
; an interrupt fires.
;
;     mov r0, #0x0
;     mcr p15, #0, r0, c7, c0, #4     ; wait for IRQ
;     bx lr
;
; Same as ARM946E-S "Wait For Interrupt" coprocessor write.

        .text
        .global func_02093bf0
        .arm
func_02093bf0:
        mov     r0, #0x0
        mcr     p15, 0, r0, c7, c0, 4
        bx      lr
