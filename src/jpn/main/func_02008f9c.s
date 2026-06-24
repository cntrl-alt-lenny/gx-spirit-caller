; func_02008f9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern .L_02020fb4
        .extern data_02104e5c
        .extern func_02007214
        .extern func_02007224
        .extern func_02008c68
        .extern func_02090780
        .extern func_020907d8
        .extern func_02092800
        .extern func_0209bee0
        .extern func_0209bef0
        .extern func_0209bfd8
        .extern func_0209c6e8
        .global func_02008f9c
        .arm
func_02008f9c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    mov r7, r0
    mov r6, r1
    bl func_0209bfd8
    cmp r0, #0x0
    beq .L_1e8
    bl func_02090780
    mov r4, r0
    mvn r0, #0x2
    cmp r4, r0
    beq .L_1e8
    mov r0, r4, lsl #0x10
    mov r1, r7, lsl #0x9
    mov r0, r0, lsr #0x10
    add r5, r1, #0x10000
    bl func_0209bef0
    cmp r6, #0x0
    ldrnesb r0, [r6, #0x1]
    cmpne r0, #0x0
    beq .L_17c
    ldr r2, _LIT0
    mov r0, r6
    mov r1, #0x124
    str r2, [sp, #0x1c]
    bl func_02007224
    str r0, [sp, #0x20]
    add r0, sp, #0x1c
    mov r1, #0x8
    bl func_02092800
    mov r0, r6
    mov r1, #0x124
    bl func_02092800
    mov r0, #0x0
    str r0, [sp]
    str r0, [sp, #0x4]
    mov r1, #0x6
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    add r1, sp, #0x18
    mov r2, #0x4
    mov r3, r0
    str r0, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT1
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    bne .L_1d0
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x7
    str r0, [sp, #0x8]
    mov r2, #0xa
    str r2, [sp, #0xc]
    mov ip, #0x2
    add r0, sp, #0x1c
    mov r1, r5
    mov r2, #0x8
    str ip, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT1
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    bne .L_1d0
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x7
    str r0, [sp, #0x8]
    mov r1, #0xa
    mov r0, r6
    str r1, [sp, #0xc]
    mov r6, #0x2
    add r1, r5, #0x8
    mov r2, #0x124
    str r6, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT1
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orr r1, r1, r2
    str r1, [r0, #0x4]
    b .L_1d0
.L_17c:
    mov r3, #0x0
    str r3, [sp, #0x14]
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x7
    str r0, [sp, #0x8]
    mov r2, #0xa
    mov r1, r5
    str r2, [sp, #0xc]
    mov r5, #0x2
    add r0, sp, #0x14
    mov r2, #0x4
    str r5, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    ldr r0, _LIT1
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orr r1, r1, r2
    str r1, [r0, #0x4]
.L_1d0:
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bee0
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020907d8
.L_1e8:
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    bne .L_208
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x1
    bl func_02008c68
.L_208:
    bl func_02007214
    cmp r0, #0x0
    beq .L_218
    bl .L_02020fb4
.L_218:
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x59475243
_LIT1: .word data_02104e5c
