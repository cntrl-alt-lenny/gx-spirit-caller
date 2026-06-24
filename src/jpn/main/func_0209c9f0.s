; func_0209c9f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83e0
        .extern data_021a8a00
        .extern data_021a8a20
        .extern func_0209bfe8
        .extern func_0209c9d8
        .extern func_0209d570
        .global func_0209c9f0
        .arm
func_0209c9f0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr ip, _LIT0
    ldr r0, [ip, #0x114]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    mov r0, #0x1
    str r0, [ip, #0x114]
    mov r3, #0x0
    str r3, [ip, #0x24]
    ldr r0, [ip, #0x24]
    mvn r1, #0x0
    str r0, [ip, #0x20]
    ldr r2, [ip, #0x20]
    ldr r0, _LIT1
    str r2, [ip, #0x1c]
    str r1, [ip, #0x28]
    str r3, [ip, #0x38]
    str r3, [ip, #0x3c]
    str r3, [r0]
    bl func_0209bfe8
    bl func_0209c9d8
    ldr r1, _LIT2
    str r0, [r1]
    bl func_0209d570
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a83e0
_LIT1: .word data_021a8a00
_LIT2: .word data_021a8a20
