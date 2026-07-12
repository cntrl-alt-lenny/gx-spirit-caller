; func_ov000_021af634 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c74ac
        .extern func_02006bf0
        .extern func_ov000_021b10e4_unk
        .global func_ov000_021af634
        .arm
func_ov000_021af634:
    stmfd sp!, {lr}
    sub sp, sp, #0x24
    add r1, sp, #0x4
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x28]
    ldr r0, [r0, #0x2c]
    mov r3, r1, lsl #0xc
    mov r2, r0, lsl #0x1b
    mov r1, r1, lsl #0x4
    mov r0, r3, lsr #0x18
    mov r1, r1, lsr #0x18
    mov r2, r2, lsr #0x1b
    mov r3, #0x0
    bl func_ov000_021b10e4_unk
    add r0, sp, #0x4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r1, _LIT0
    str r0, [r1, #0x8]
    add sp, sp, #0x24
    ldmfd sp!, {pc}
_LIT0: .word data_ov000_021c74ac
