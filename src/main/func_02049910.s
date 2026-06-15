; func_02049910 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_02050054
        .global func_02049910
        .arm
func_02049910:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmnefd sp!, {pc}
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_38
    bl func_020498f0
    ldrb r1, [r0, #0x17d]
    add r1, r1, #0x1
    strb r1, [r0, #0x17d]
.L_38:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_58
    bl func_020498f0
    ldrb r0, [r0, #0x17d]
    cmp r0, #0x5
    bcc .L_70
.L_58:
    ldr r1, _LIT0
    mov r0, #0x6
    bl func_02050054
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_70:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0xfffeae6c
