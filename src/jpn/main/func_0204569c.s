; func_0204569c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9f0
        .extern func_0203cc08
        .extern func_0207b510
        .global func_0204569c
        .arm
func_0204569c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldrh r0, [r1, #0x4]
    cmp r0, #0x2
    bne .L_10c
    bl func_0203cc08
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r1, [r1]
    str r0, [r1]
    ldmfd sp!, {pc}
.L_10c:
    cmp r0, #0x4
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldrh r0, [r1, #0x6]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_0207b510
    cmp r0, #0x9
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, _LIT0
    mov r3, #0x0
    ldr r2, [r0]
    mov r1, #0x6
    strh r3, [r2, #0x6]
    ldr r0, [r0]
    strh r1, [r0, #0x4]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219d9f0
