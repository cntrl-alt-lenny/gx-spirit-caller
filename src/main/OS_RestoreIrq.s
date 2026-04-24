; OS_RestoreIrq (was func_020937b8): NitroSDK-standard IRQ-restore
; primitive. Takes a saved mask in r0 (typically the return of
; OS_DisableIrq), writes it back into CPSR bit 7 (I bit), and returns
; the pre-restore value of that bit — letting callers chain nested
; disable/restore pairs.
;
; Disassembly:
;
;     mrs r1, cpsr                  ; r1 = current CPSR
;     bic r2, r1, #0x80             ; r2 = current CPSR with bit 7 cleared
;     orr r2, r2, r0                ; r2 |= saved mask (bit 7 from arg)
;     msr cpsr_c, r2                ; write control byte → restores IRQ state
;     and r0, r1, #0x80             ; return pre-restore bit 7 of mask
;     bx  lr
;
; 6 ARM instructions, 0x18 bytes.
;
; Ships as `.s` for the same reason as OS_DisableIrq — `mrs`/`msr` are
; privileged. Standard NitroSDK identity confirmed by verbatim match
; with other NDS decomps.

        .text

        .global OS_RestoreIrq
        .arm
OS_RestoreIrq:
        mrs     r1, cpsr
        bic     r2, r1, #0x80
        orr     r2, r2, r0
        msr     cpsr_c, r2
        and     r0, r1, #0x80
        bx      lr
