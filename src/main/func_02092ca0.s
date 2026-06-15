; func_02092ca0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a662c
        .extern func_02092368
        .extern func_02092a34
        .extern func_02092a48
        .extern func_02092a5c
        .extern func_02092b48
        .extern func_02092e80
        .extern func_02092e88
        .global func_02092ca0
        .arm
func_02092ca0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r0, #0x2
    bl func_02092b48
    mov r1, r0
    mov r0, #0x2
    bl func_02092a48
    mov r0, #0x2
    bl func_02092a5c
    mov r1, r0
    mov r0, #0x2
    bl func_02092a34
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_58
    bl func_02092368
    and r0, r0, #0x3
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
.L_58:
    ldr r0, _LIT1
    bl func_02092e80
    ldr r0, _LIT2
    bl func_02092e88
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a662c
_LIT1: .word 0x0200002b
_LIT2: .word 0x023e0021
