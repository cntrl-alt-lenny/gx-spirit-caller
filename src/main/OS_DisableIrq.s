; OS_DisableIrq (was func_020937a4): NitroSDK-standard IRQ-disable
; primitive. Sets CPSR bit 7 (I bit — IRQ mask) and returns the
; previous value of that bit as r0 (so callers can use it with
; OS_RestoreIrq to nest enable/disable calls).
;
; Disassembly (build/eur/asm/_dsd_gap@main_*.s):
;
;     mrs r0, cpsr                  ; r0 = current CPSR
;     orr r1, r0, #0x80             ; r1 = r0 | 0x80 (set I bit)
;     msr cpsr_c, r1                ; write control byte → disables IRQs
;     and r0, r0, #0x80             ; return just bit 7 of saved mask
;     bx  lr
;
; 5 ARM instructions, 0x14 bytes.
;
; Ships as `.s` because `mrs`/`msr` are privileged and not accessible
; from C. Standard NitroSDK identity — the same instruction sequence
; appears verbatim in every other NDS decomp that matches this symbol
; (pokeplatinum, dqix, SonicRushAdventure-Decomp, etc). Safe to rename.
;
; Paired with OS_RestoreIrq for the enter/exit critical-section idiom
; used throughout the engine.

        .text

        .global OS_DisableIrq
        .arm
OS_DisableIrq:
        mrs     r0, cpsr
        orr     r1, r0, #0x80
        msr     cpsr_c, r1
        and     r0, r0, #0x80
        bx      lr
