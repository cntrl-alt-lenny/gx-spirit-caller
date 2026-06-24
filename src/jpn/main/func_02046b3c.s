; func_02046b3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff828
        .extern data_0219da0c
        .extern func_02045230
        .extern func_0204664c
        .extern func_02048fc4
        .extern func_020624bc
        .extern func_02065dcc
        .global func_02046b3c
        .arm
func_02046b3c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_40
    bl func_02045230
    cmp r0, #0x0
    bne .L_40
    ldr r0, _LIT0
    ldr r2, [r0]
    ldr r0, [r2, #0x24]
    cmp r0, #0x5
    beq .L_4c
    cmp r0, #0x6
    beq .L_4c
.L_40:
    add sp, sp, #0x4
    mvn r0, #0x0
    ldmfd sp!, {pc}
.L_4c:
    ldrb r0, [r2, #0x361]
    cmp r0, #0x0
    bne .L_80
    ldr r1, _LIT1
    mov r0, #0x1
    mov r2, #0x0
    bl func_02048fc4
    bl func_02065dcc
    mov r0, #0x3
    bl func_0204664c
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {pc}
.L_80:
    mov r1, #0x1
    ldr r0, _LIT0
    strb r1, [r2, #0x2d]
    ldr r0, [r0]
    ldr r0, [r0]
    bl func_020624bc
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    strb r0, [r1, #0x2d]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219da0c
_LIT1: .word data_020ff828
