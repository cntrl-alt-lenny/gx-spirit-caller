; func_02092d20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6628
        .extern func_02092a34
        .extern func_02092a48
        .extern func_02092a5c
        .extern func_02092b48
        .global func_02092d20
        .arm
func_02092d20:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r0, [r1]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    mov r2, #0x1
    mov r0, #0x0
    str r2, [r1]
    bl func_02092b48
    mov r1, r0
    mov r0, #0x0
    bl func_02092a48
    mov r0, #0x0
    bl func_02092a5c
    mov r1, r0
    mov r0, #0x0
    bl func_02092a34
    mov r0, #0x2
    mov r1, #0x0
    bl func_02092a34
    mov r0, #0x2
    mov r1, #0x0
    bl func_02092a48
    mov r0, #0x3
    bl func_02092b48
    mov r1, r0
    mov r0, #0x3
    bl func_02092a48
    mov r0, #0x3
    bl func_02092a5c
    mov r1, r0
    mov r0, #0x3
    bl func_02092a34
    mov r0, #0x4
    bl func_02092b48
    mov r1, r0
    mov r0, #0x4
    bl func_02092a48
    mov r0, #0x4
    bl func_02092a5c
    mov r1, r0
    mov r0, #0x4
    bl func_02092a34
    mov r0, #0x5
    bl func_02092b48
    mov r1, r0
    mov r0, #0x5
    bl func_02092a48
    mov r0, #0x5
    bl func_02092a5c
    mov r1, r0
    mov r0, #0x5
    bl func_02092a34
    mov r0, #0x6
    bl func_02092b48
    mov r1, r0
    mov r0, #0x6
    bl func_02092a48
    mov r0, #0x6
    bl func_02092a5c
    mov r1, r0
    mov r0, #0x6
    bl func_02092a34
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6628
