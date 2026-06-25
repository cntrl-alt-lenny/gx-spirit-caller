; func_020702b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .extern func_02074850
        .global func_020702b4
        .arm
func_020702b4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0xa4]
    cmp r0, #0x0
    beq .L_80
    ldrb r1, [r0, #0x9]
    cmp r1, #0x0
    beq .L_38
    bl func_02074850
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_38:
    ldr r1, [r0, #0x44]
    cmp r1, #0x0
    bne .L_60
    ldrb r0, [r0, #0x8]
    cmp r0, #0x4
    beq .L_60
    add r0, r0, #0xf6
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_70
.L_60:
    add sp, sp, #0x4
    mov r0, r1
    ldmfd sp!, {lr}
    bx lr
.L_70:
    add sp, sp, #0x4
    mvn r0, #0x0
    ldmfd sp!, {lr}
    bx lr
.L_80:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a62f0
