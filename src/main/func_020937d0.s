; func_020937d0: set both IRQ (bit 7) and FIQ (bit 6) mask bits of CPSR
; (disable both interrupts). Returns the previous values of bits 6+7
; as r0.
;
;     mrs r0, cpsr
;     orr r1, r0, #0xc0           ; 0xc0 = bit 7 (I) | bit 6 (F)
;     msr cpsr_c, r1
;     and r0, r0, #0xc0
;     bx  lr
;
; 5 ARM instructions, 0x14 bytes. Companion to OS_DisableIrq (which
; only sets bit 7); this one disables both interrupt classes
; atomically.

        .text

        .global func_020937d0
        .arm
func_020937d0:
        mrs     r0, cpsr
        orr     r1, r0, #0xc0
        msr     cpsr_c, r1
        and     r0, r0, #0xc0
        bx      lr
