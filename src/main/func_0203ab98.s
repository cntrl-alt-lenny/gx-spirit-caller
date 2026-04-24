; func_0203ab98: epilogue-only stub — full callee-saved ldmia + pc.
;
;     ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
;
; 1 ARM instruction, 0x4 bytes. Branch target for shared-epilogue
; pattern — a sibling function sets up {r4..r10, lr} on the stack
; and `b`s here to unwind + return.

        .text
        .global func_0203ab98
        .arm
func_0203ab98:
        ldmia   sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
