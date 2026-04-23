; func_0207708c: 2-instruction epilogue-only stub — pure `ldmia; bx lr`
; with no prologue. Can't be expressed in C because any C function
; with C-level scope ends up with mwcc generating a matched prologue.
;
; Disassembly (build/eur/asm/_dsd_gap@main_*.s):
;
;     ldmia sp!, {r4, r5, r6, lr}
;     bx    lr
;
; 2 ARM instructions, 0x8 bytes.
;
; What this is: a standalone function-tail that happens to be branched
; to from elsewhere in the image. In the baserom, some other function
; ends with `b 0x0207708c` (a `b`, not `bl`) after setting up callee-
; saved registers on the stack — this stub is where that branch lands
; to unwind those registers and return to the real caller.
;
; This is the ARM equivalent of a PIC "longjump-target" or a shared
; epilogue between multiple sibling functions. mwcc doesn't emit such
; shared tails from plain C — each function gets its own inline
; epilogue. The existence of this stub means someone hand-wrote a
; branch that happens to hit this tail.
;
; As .s: natural fit. No frame (no pushes in this function's own
; scope), no locals, no parameters — just a bare pop-and-return.

        .text

        .global func_0207708c
        .arm
func_0207708c:
        ldmia   sp!, {r4, r5, r6, lr}
        bx      lr
