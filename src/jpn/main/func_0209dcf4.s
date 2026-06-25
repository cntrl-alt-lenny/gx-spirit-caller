; func_0209dcf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8c50
        .extern func_02092324
        .extern func_020923d8
        .extern func_020927e4
        .global func_0209dcf4
        .arm
func_0209dcf4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    add r1, sp, #0x0
    mov r2, #0x0
    bl func_020923d8
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {lr}
    bxeq lr
    ldr r0, [sp]
    mov r1, #0x2
    bl func_020927e4
    ldr r1, [sp]
    ldrh r0, [r1]
    ands r0, r0, #0x8000
    addne sp, sp, #0x4
    movne r0, r1
    ldmnefd sp!, {lr}
    bxne lr
    ldr r0, _LIT0
    mov r2, #0x1
    bl func_02092324
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a8c50
