; func_0204989c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204ffe0
        .global func_0204989c
        .arm
func_0204989c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x1
    ldmnefd sp!, {pc}
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_38
    bl func_0204987c
    ldrb r1, [r0, #0x175]
    add r1, r1, #0x1
    strb r1, [r0, #0x175]
.L_38:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_58
    bl func_0204987c
    ldrb r0, [r0, #0x175]
    cmp r0, #0x5
    bcc .L_70
.L_58:
    ldr r1, _LIT0
    mov r0, #0x6
    bl func_0204ffe0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmfd sp!, {pc}
.L_70:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0xfffeae6c
