; func_02093790: clear FIQ-mask bit 7 of CPSR (re-enable FIQs); return
; the previous value of bit 7 as r0. Sibling of OS_DisableIrq pair —
; this one is the FIQ counterpart (or the IRQ-enable variant).
;
;     mrs r0, cpsr
;     bic r1, r0, #0x80
;     msr cpsr_c, r1
;     and r0, r0, #0x80
;     bx  lr
;
; 5 ARM instructions, 0x14 bytes. Privileged `mrs`/`msr` instructions
; are not accessible from C with mwcc; ships as `.s`.

        .text

        .global func_02093790
        .arm
func_02093790:
        mrs     r0, cpsr
        bic     r1, r0, #0x80
        msr     cpsr_c, r1
        and     r0, r0, #0x80
        bx      lr
