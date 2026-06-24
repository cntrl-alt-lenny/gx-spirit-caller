; func_02045830 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff7b0
        .extern data_020ff7d8
        .extern data_020ff7fc
        .extern func_0204062c
        .global func_02045830
        .arm
func_02045830:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_d8
    cmp r0, #0x1
    beq .L_e8
    cmp r0, #0x2
    beq .L_f8
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_d8:
    ldr r0, _LIT0
    bl func_0204062c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_e8:
    ldr r0, _LIT1
    bl func_0204062c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_f8:
    ldr r0, _LIT2
    bl func_0204062c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ff7b0
_LIT1: .word data_020ff7d8
_LIT2: .word data_020ff7fc
