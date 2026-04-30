; func_020937fc: read CPSR I-bit (IRQ disable bit).
;
; mrs is privileged — must ship as .s. Returns 0x80 if IRQs disabled,
; 0 if enabled. NitroSDK convention: this is essentially OS_GetIrqDisableState.
;
;     mrs r0, cpsr
;     and r0, r0, #0x80
;     bx  lr
;
; 3 ARM instructions, 0xc bytes.

        .text
        .global func_020937fc
        .arm
func_020937fc:
        mrs     r0, cpsr
        and     r0, r0, #0x80
        bx      lr
