; func_020a309c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9770
        .extern data_021a97a0
        .extern func_020a0698
        .extern func_020a31f0
        .extern func_020a35c0
        .extern func_020a35d4
        .global func_020a309c
        .arm
func_020a309c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    bne .L_54
    bl func_020a35d4
    mov r4, r0
    bl func_020a35c0
    str r0, [sp]
    mov ip, #0x8
    ldr r1, _LIT1
    mov r3, r4
    mov r0, #0x0
    mov r2, #0x70
    str ip, [sp, #0x4]
    bl func_020a0698
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
.L_54:
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_70
    ldr r0, [r0, #0x4bc]
    cmp r0, #0x0
    beq .L_70
    mov r1, r0
.L_70:
    ldr r0, _LIT0
    str r1, [r0, #0x4]
    bl func_020a31f0
    ldr r1, _LIT0
    mov r2, #0x2
    ldr r3, [r1, #0x4]
    mov r0, #0x1
    ldrb r3, [r3, #0x4b4]
    strb r3, [r1, #0xe]
    strb r2, [r1, #0xc]
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a9770
_LIT1: .word data_021a97a0
