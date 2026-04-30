; func_02093808: read CPSR processor mode (low 5 bits).
;
;     mrs r0, cpsr
;     and r0, r0, #0x1f
;     bx  lr

        .text
        .global func_02093808
        .arm
func_02093808:
        mrs     r0, cpsr
        and     r0, r0, #0x1f
        bx      lr
