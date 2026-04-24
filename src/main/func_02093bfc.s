; func_02093bfc: paired-call idle loop. Both calls are inside the
; loop body (unlike func_02091700 where the first call was one-shot
; init). Differentiated from 02091700 via the branch target: `b #-0x8`
; jumps back 8 bytes past the second bl, landing at the FIRST bl —
; so every iteration calls func_020937a4 followed by func_02093bf0.
;
; Disassembly (build/eur/asm/_dsd_gap@main_*.s):
;
;     stmdb sp!, {lr}
;     sub   sp, sp, #0x4             ; unused 4-byte frame slot
;   .L_02093c04:
;     bl    func_020937a4            ; IRQ-disable primitive — same
;                                    ; one named in #149's func_02006870
;                                    ; as enter-critical-section
;     bl    func_02093bf0            ; per-tick worker (same as
;                                    ; func_02091700's loop body)
;     b     .L_02093c04              ; encoded as b #-0x8 (target =
;                                    ; this_insn + 8 + (-4 * 4)
;                                    ;                = this_insn - 8)
;
; 5 ARM instructions, 0x14 bytes.
;
; Same asm-vs-C tradeoff as func_02091700 — the 4-byte unused frame
; slot survives into codegen from what was presumably a local variable
; in the original source. mwcc's current DCE elides both the variable
; and its frame slot, so the plain C form produces 0x10 not 0x14.
;
; Semantically this is a `while (1) { disable_irqs(); f(); }` loop —
; odd because disable_irqs's return value is discarded, and if f()
; itself re-enables IRQs, the loop keeps toggling. More likely this
; is an "assertion-style" busy-wait that should never actually run
; (the outer caller might only hit it on unrecoverable failure), and
; the disable-IRQs call is there to stop interrupt handlers from
; trying to recover. An error-state idle.

        .text

        .extern OS_DisableIrq
        .extern func_02093bf0

        .global func_02093bfc
        .arm
func_02093bfc:
        stmdb   sp!, {lr}
        sub     sp, sp, #0x4
loop_top:
        bl      OS_DisableIrq
        bl      func_02093bf0
        b       loop_top
