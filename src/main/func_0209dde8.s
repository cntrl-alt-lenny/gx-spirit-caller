; func_0209dde8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8d30
        .extern func_0209240c
        .extern func_020924c0
        .extern func_020928cc
        .global func_0209dde8
        .arm
func_0209dde8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    add r1, sp, #0x0
    mov r2, #0x0
    bl func_020924c0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {lr}
    bxeq lr
    ldr r0, [sp]
    mov r1, #0x2
    bl func_020928cc
    ldr r1, [sp]
    ldrh r0, [r1]
    ands r0, r0, #0x8000
    addne sp, sp, #0x4
    movne r0, r1
    ldmnefd sp!, {lr}
    bxne lr
    ldr r0, _LIT0
    mov r2, #0x1
    bl func_0209240c
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a8d30
