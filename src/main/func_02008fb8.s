; func_02008fb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern .L_02021008
        .extern data_02104f3c
        .extern func_02007230
        .extern func_02007240
        .extern func_02008c84
        .extern func_02090868
        .extern func_020908c0
        .extern func_020928e8
        .extern func_0209bfd4
        .extern func_0209bfe4
        .extern func_0209c0cc
        .extern func_0209c7dc
        .global func_02008fb8
        .arm
func_02008fb8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    mov r7, r0
    mov r6, r1
    bl func_0209c0cc
    cmp r0, #0x0
    beq .L_484
    bl func_02090868
    mov r4, r0
    mvn r0, #0x2
    cmp r4, r0
    beq .L_484
    mov r0, r4, lsl #0x10
    mov r1, r7, lsl #0x9
    mov r0, r0, lsr #0x10
    add r5, r1, #0x10000
    bl func_0209bfe4
    cmp r6, #0x0
    ldrnesb r0, [r6, #0x1]
    cmpne r0, #0x0
    beq .L_418
    ldr r2, _LIT0
    mov r0, r6
    mov r1, #0x124
    str r2, [sp, #0x1c]
    bl func_02007240
    str r0, [sp, #0x20]
    add r0, sp, #0x1c
    mov r1, #0x8
    bl func_020928e8
    mov r0, r6
    mov r1, #0x124
    bl func_020928e8
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
    bl func_0209c7dc
    cmp r0, #0x0
    ldr r0, _LIT1
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    bne .L_46c
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
    bl func_0209c7dc
    cmp r0, #0x0
    ldr r0, _LIT1
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orrs r1, r1, r2
    str r1, [r0, #0x4]
    bne .L_46c
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
    bl func_0209c7dc
    cmp r0, #0x0
    ldr r0, _LIT1
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orr r1, r1, r2
    str r1, [r0, #0x4]
    b .L_46c
.L_418:
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
    bl func_0209c7dc
    cmp r0, #0x0
    ldr r0, _LIT1
    moveq r2, #0x1
    ldr r1, [r0, #0x4]
    movne r2, #0x0
    orr r1, r1, r2
    str r1, [r0, #0x4]
.L_46c:
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bfd4
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020908c0
.L_484:
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    bne .L_4a4
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x1
    bl func_02008c84
.L_4a4:
    bl func_02007230
    cmp r0, #0x0
    beq .L_4b4
    bl .L_02021008
.L_4b4:
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x59475243
_LIT1: .word data_02104f3c
