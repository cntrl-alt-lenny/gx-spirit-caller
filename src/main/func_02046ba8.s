; func_02046ba8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff908
        .extern data_0219daec
        .extern func_02045280
        .extern func_020466f4
        .extern func_02049038
        .extern func_02062530
        .extern func_02065e40
        .global func_02046ba8
        .arm
func_02046ba8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_108
    bl func_02045280
    cmp r0, #0x0
    bne .L_108
    ldr r0, _LIT0
    ldr r2, [r0]
    ldr r0, [r2, #0x24]
    cmp r0, #0x5
    beq .L_114
    cmp r0, #0x6
    beq .L_114
.L_108:
    add sp, sp, #0x4
    mvn r0, #0x0
    ldmfd sp!, {pc}
.L_114:
    ldrb r0, [r2, #0x361]
    cmp r0, #0x0
    bne .L_148
    ldr r1, _LIT1
    mov r0, #0x1
    mov r2, #0x0
    bl func_02049038
    bl func_02065e40
    mov r0, #0x3
    bl func_020466f4
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {pc}
.L_148:
    mov r1, #0x1
    ldr r0, _LIT0
    strb r1, [r2, #0x2d]
    ldr r0, [r0]
    ldr r0, [r0]
    bl func_02062530
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    strb r0, [r1, #0x2d]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219daec
_LIT1: .word data_020ff908
