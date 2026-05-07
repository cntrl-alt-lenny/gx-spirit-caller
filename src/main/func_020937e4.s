; func_020937e4: replace the IRQ+FIQ mask bits (6, 7) of CPSR with the
; bits passed in r0; return the previous mask bits as r0.
;
;     mrs r1, cpsr
;     bic r2, r1, #0xc0          ; clear current bits 6+7
;     orr r2, r2, r0              ; set new bits from arg
;     msr cpsr_c, r2
;     and r0, r1, #0xc0           ; return previous mask
;     bx  lr
;
; 6 ARM instructions, 0x18 bytes. Companion to OS_DisableIrq /
; func_020937d0 — those force-disable IRQ/FIQ; this one restores
; whatever the caller passes (use with brief-029 func_020937d0
; / OS_DisableIrq's saved-mask result).

        .text

        .global func_020937e4
        .arm
func_020937e4:
        mrs     r1, cpsr
        bic     r2, r1, #0xc0
        orr     r2, r2, r0
        msr     cpsr_c, r2
        and     r0, r1, #0xc0
        bx      lr
