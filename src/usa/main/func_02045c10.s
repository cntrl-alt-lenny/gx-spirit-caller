; func_02045c10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern data_0219da10
        .extern func_0204520c
        .extern func_02054b88
        .extern func_0206249c
        .global func_02045c10
        .arm
func_02045c10:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0206249c
    bl func_02054b88
    ldr r2, _LIT0
    ldr r1, _LIT1
    str r0, [r2]
    mov r0, #0x9
    bl func_0204520c
    ldr r0, _LIT2
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219da10
_LIT1: .word 0xfffe8515
_LIT2: .word data_0219da0c
