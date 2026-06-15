; func_0207af28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a088c
        .extern func_02079e78
        .extern func_0207b038
        .extern func_0207b13c
        .extern func_0209f030
        .global func_0207af28
        .arm
func_0207af28:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    add r1, r0, #0x2000
    ldrb r0, [r1, #0x26b]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r0, _LIT1
    mov r2, #0x1
    strb r2, [r1, #0x26b]
    bl func_0209f030
    cmp r0, #0x2
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    mov r0, #0xb
    bl func_0207b038
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x7
    mov r3, #0x610
    bl func_0207b13c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word func_02079e78
