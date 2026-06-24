; func_0207ad8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07ac
        .extern func_0207ae40
        .extern func_0207af50
        .global func_0207ad8c
        .arm
func_0207ad8c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh r1, [r0, #0x2]
    cmp r1, #0x8
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldrh r1, [r0, #0x4]
    cmp r1, #0x16
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldrh r0, [r0, #0x6]
    cmp r0, #0x25
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0x260]
    sub r0, r0, #0x8
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_6b0
    b .L_684
    b .L_698
    b .L_6a8
    b .L_6b0
    b .L_698
.L_684:
    mov r0, #0xc
    bl func_0207af50
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_698:
    bl func_0207ae40
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_6a8:
    mov r0, #0xc
    bl func_0207af50
.L_6b0:
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a07ac
