; func_020444e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da78
        .extern func_02043ca4
        .global func_020444e4
        .arm
func_020444e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x20
    mov r1, r0
    mov r2, r4
    bl func_02043ca4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4]
    ldr r1, _LIT0
    mov r0, #0x1
    mov r2, r2, lsl #0x3
    sub r2, r2, #0x400
    str r2, [r1]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219da78
