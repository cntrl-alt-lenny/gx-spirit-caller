; func_020a49a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9818
        .global func_020a49a0
        .arm
func_020a49a0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r1, r0
    ldrh r0, [r1, #0x2]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldrh r0, [r1, #0x4]
    cmp r0, #0x15
    bgt .L_910
    cmp r0, #0x15
    bge .L_950
    cmp r0, #0x9
    addgt sp, sp, #0x4
    ldmgtfd sp!, {lr}
    bxgt lr
    cmp r0, #0x7
    addlt sp, sp, #0x4
    ldmltfd sp!, {lr}
    bxlt lr
    cmp r0, #0x7
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    add sp, sp, #0x4
    cmp r0, #0x9
    ldmfd sp!, {lr}
    bx lr
.L_910:
    cmp r0, #0x1a
    addgt sp, sp, #0x4
    ldmgtfd sp!, {lr}
    bxgt lr
    cmp r0, #0x19
    addlt sp, sp, #0x4
    ldmltfd sp!, {lr}
    bxlt lr
    cmp r0, #0x19
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    add sp, sp, #0x4
    cmp r0, #0x1a
    ldmfd sp!, {lr}
    bx lr
.L_950:
    ldr r2, _LIT0
    mov r0, #0x9
    ldr r2, [r2]
    ldr r2, [r2, #0x51c]
    blx r2
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a9818
