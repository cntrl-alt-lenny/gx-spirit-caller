; func_02008d44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e5c
        .extern func_02007214
        .extern func_02007224
        .extern func_02020fa4
        .extern func_02090780
        .extern func_020907d8
        .extern func_0209281c
        .extern func_0209bee0
        .extern func_0209bef0
        .extern func_0209bfd8
        .extern func_0209c6e8
        .global func_02008d44
        .arm
func_02008d44:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    mov r6, r0
    mov r7, r1
    mov r4, #0x0
    bl func_0209bfd8
    cmp r0, #0x0
    beq .L_1a0
    bl func_02090780
    mov r5, r0
    mvn r0, #0x2
    cmp r5, r0
    beq .L_1a0
    mov r0, r5, lsl #0x10
    mov r1, r6, lsl #0x9
    mov r0, r0, lsr #0x10
    add r6, r1, #0x10000
    bl func_0209bef0
    add r0, sp, #0x18
    mov r1, #0x8
    bl func_0209281c
    mov r0, r7
    mov r1, #0x124
    bl func_0209281c
    mov r3, r4
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, r6
    add r1, sp, #0x18
    mov r2, #0x8
    str r3, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT0
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, r4
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    ldreq r1, [sp, #0x18]
    ldreq r0, _LIT1
    cmpeq r1, r0
    bne .L_188
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r1, r7
    add r0, r6, #0x8
    mov r2, #0x124
    str r3, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT0
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    bne .L_188
    ldrsb r0, [r7, #0x1]
    cmp r0, #0x0
    beq .L_150
    ldr r0, [r7, #0x1c]
    cmp r0, #0x50
    ldrls r0, [r7, #0x24]
    cmpls r0, #0x1e
    ldrls r0, [r7, #0x20]
    cmpls r0, #0xf
    bhi .L_150
    mov r0, r7
    mov r1, #0x124
    bl func_02007224
    ldr r1, [sp, #0x1c]
    cmp r1, r0
    moveq r4, #0x1
    beq .L_188
.L_150:
    mov r3, #0x0
    str r3, [sp, #0x14]
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x7
    str r0, [sp, #0x8]
    mov r2, #0xa
    mov r1, r6
    str r2, [sp, #0xc]
    mov r6, #0x2
    add r0, sp, #0x14
    mov r2, #0x4
    str r6, [sp, #0x10]
    bl func_0209c6e8
.L_188:
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bee0
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020907d8
.L_1a0:
    bl func_02007214
    cmp r0, #0x0
    beq .L_1b0
    bl func_02020fa4
.L_1b0:
    mov r0, r4
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104e5c
_LIT1: .word 0x59475243
