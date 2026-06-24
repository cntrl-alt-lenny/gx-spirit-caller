; func_0209927c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_021025a8
        .global func_0209927c
        .arm
func_0209927c:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, [sp, #0x10]
    mov r6, r1
    ldr r3, [r0, #0x1c]
    add r5, r0, #0x20
    ands r1, r3, #0x3
    mov r0, r3, asr #0x2
    moveq r1, #0x0
    streq r1, [r5, r0, lsl #0x2]
    ldr r2, [sp, #0x10]
    mov r1, #0x80
    add r4, r2, #0x20
    strb r1, [r4, r3]
    add r3, r3, #0x1
    ands r1, r3, #0x3
    beq .L_58
    mov r2, #0x0
.L_48:
    strb r2, [r4, r3]
    add r3, r3, #0x1
    ands r1, r3, #0x3
    bne .L_48
.L_58:
    ldr r1, [sp, #0x10]
    add r0, r0, #0x1
    ldr r1, [r1, #0x1c]
    cmp r1, #0x38
    blt .L_a4
    cmp r0, #0x10
    bge .L_88
    mov r1, #0x0
.L_78:
    str r1, [r5, r0, lsl #0x2]
    add r0, r0, #0x1
    cmp r0, #0x10
    blt .L_78
.L_88:
    ldr r1, _LIT0
    ldr r0, [sp, #0x10]
    ldr r3, [r1]
    mov r1, r5
    mov r2, #0x40
    blx r3
    mov r0, #0x0
.L_a4:
    cmp r0, #0xe
    bge .L_c0
    mov r1, #0x0
.L_b0:
    str r1, [r5, r0, lsl #0x2]
    add r0, r0, #0x1
    cmp r0, #0xe
    blt .L_b0
.L_c0:
    ldr r0, [sp, #0x10]
    mov r1, r5
    ldr r2, [r0, #0x14]
    ldr r3, _LIT0
    strb r2, [r4, #0x3f]
    mov r0, r2, lsr #0x8
    strb r0, [r4, #0x3e]
    mov r0, r2, lsr #0x10
    strb r0, [r4, #0x3d]
    mov r0, r2, lsr #0x18
    strb r0, [r4, #0x3c]
    ldr r0, [sp, #0x10]
    mov r2, #0x40
    ldr r5, [r0, #0x18]
    strb r5, [r4, #0x3b]
    mov r0, r5, lsr #0x8
    strb r0, [r4, #0x3a]
    mov r0, r5, lsr #0x10
    strb r0, [r4, #0x39]
    mov r0, r5, lsr #0x18
    strb r0, [r4, #0x38]
    ldr r0, [sp, #0x10]
    ldr r3, [r3]
    blx r3
    ldr r0, [sp, #0x10]
    add r1, sp, #0x10
    ldr r3, [r0]
    mov r0, #0x0
    mov r2, r3, lsr #0x18
    strb r2, [r6]
    mov r2, r3, lsr #0x10
    strb r2, [r6, #0x1]
    mov r2, r3, lsr #0x8
    strb r2, [r6, #0x2]
    strb r3, [r6, #0x3]
    ldr r3, [sp, #0x10]
    mov r2, #0x4
    ldr r4, [r3, #0x4]
    mov r3, r4, lsr #0x18
    strb r3, [r6, #0x4]
    mov r3, r4, lsr #0x10
    strb r3, [r6, #0x5]
    mov r3, r4, lsr #0x8
    strb r3, [r6, #0x6]
    strb r4, [r6, #0x7]
    ldr r3, [sp, #0x10]
    ldr r4, [r3, #0x8]
    mov r3, r4, lsr #0x18
    strb r3, [r6, #0x8]
    mov r3, r4, lsr #0x10
    strb r3, [r6, #0x9]
    mov r3, r4, lsr #0x8
    strb r3, [r6, #0xa]
    strb r4, [r6, #0xb]
    ldr r3, [sp, #0x10]
    ldr r4, [r3, #0xc]
    mov r3, r4, lsr #0x18
    strb r3, [r6, #0xc]
    mov r3, r4, lsr #0x10
    strb r3, [r6, #0xd]
    mov r3, r4, lsr #0x8
    strb r3, [r6, #0xe]
    strb r4, [r6, #0xf]
    ldr r3, [sp, #0x10]
    ldr r4, [r3, #0x10]
    mov r3, r4, lsr #0x18
    strb r3, [r6, #0x10]
    mov r3, r4, lsr #0x10
    strb r3, [r6, #0x11]
    mov r3, r4, lsr #0x8
    strb r3, [r6, #0x12]
    strb r4, [r6, #0x13]
    ldr r3, [sp, #0x10]
    str r0, [r3, #0x1c]
    bl Fill32
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word data_021025a8
