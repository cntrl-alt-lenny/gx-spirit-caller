; func_0203c7d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9b8
        .extern data_0219d9c4
        .extern func_0203ca78
        .global func_0203c7d0
        .arm
func_0203c7d0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r0, #0x8
    ldr r1, [r1]
    mov r2, #0xc
    bl func_0203ca78
    ldr r0, _LIT1
    ldr r2, _LIT2
    ldr r1, [r0]
    mov r0, #0x10
    bl func_0203ca78
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219d9c4
_LIT1: .word data_0219d9b8
_LIT2: .word 0x00000d18
