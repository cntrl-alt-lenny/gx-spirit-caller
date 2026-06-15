; func_0207ae74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a088c
        .extern func_0207af28
        .extern func_0207b038
        .global func_0207ae74
        .arm
func_0207ae74:
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
    b .L_10a0
    b .L_1074
    b .L_1088
    b .L_1098
    b .L_10a0
    b .L_1088
.L_1074:
    mov r0, #0xc
    bl func_0207b038
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_1088:
    bl func_0207af28
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_1098:
    mov r0, #0xc
    bl func_0207b038
.L_10a0:
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a088c
