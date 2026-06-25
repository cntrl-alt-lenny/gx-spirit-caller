; func_0201c254 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02008cb8
        .extern func_0200a180
        .extern func_02018dcc
        .extern func_02018f4c
        .extern func_02018f5c
        .extern func_020191dc
        .extern func_020193f8
        .extern func_02019888
        .extern func_02019ac0
        .extern func_02019cac
        .extern func_02019e70
        .extern func_0201a100
        .extern func_0201bd9c
        .extern func_0201c18c
        .extern func_0201c1d0
        .global func_0201c254
        .arm
func_0201c254:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    bl GetSystemWork
    ldr r1, [r5, #0xc]
    mov r0, r5
    bic r1, r1, #0xf
    orr r1, r1, #0x7
    str r1, [r5, #0xc]
    bl func_0201bd9c
    ldr r0, [r5, #0x14]
    ldr r1, [r5, #0x10]
    mov r0, r0, lsl #0x18
    cmp r1, #0x0
    mov r4, r0, lsr #0x18
    bne .L_80
    mov r0, r4
    bl func_020193f8
    cmp r0, #0x0
    beq .L_74
    bl func_02018f4c
    mov r6, r0
    bl func_02018f5c
    mov r1, r0
    mov r0, r6
    mov r2, r4
    mov r3, #0x2
    .word 0xeb065b60
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_74:
    mov r0, r5
    bl func_0201c18c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_80:
    tst r1, #0x2
    beq .L_118
    mov r0, r4
    bl func_02019e70
    mov r6, r0
    add r1, sp, #0x0
    mov r0, r4
    bl func_02019cac
    tst r6, #0x1
    movne r6, #0x1
    mov r0, r4
    moveq r6, #0x2
    bl func_020191dc
    cmp r0, #0x5
    bne .L_cc
    tst r6, #0x1
    movne r7, #0xc
    moveq r7, #0xd
    b .L_e4
.L_cc:
    add r0, sp, #0x0
    sub r1, r6, #0x1
    ldrb r0, [r0, r1]
    cmp r0, #0x10
    movcs r7, #0x7
    movcc r7, #0x6
.L_e4:
    mov r0, r4
    mov r1, r6
    bl func_02019ac0
    bl func_02018f4c
    mov r6, r0
    bl func_02018f5c
    mov r1, r0
    mov r2, r4
    mov r3, r7
    mov r0, r6
    .word 0xeb065b37
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_118:
    tst r1, #0x4
    beq .L_15c
    bl func_02018f4c
    mov r6, r0
    bl func_02018f5c
    mov r1, r0
    mov r0, r6
    mov r2, r4
    mov r3, #0x8
    .word 0xeb065b2b
    str r0, [r5]
    mov r0, r4
    mov r1, #0x1
    bl func_02018dcc
    mov r0, r4
    bl func_0200a180
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_15c:
    tst r1, #0x8
    beq .L_1a0
    mov r0, r4
    bl func_02008cb8
    mov r0, r4
    mov r1, #0x1
    bl func_02019888
    bl func_02018f4c
    mov r6, r0
    bl func_02018f5c
    mov r1, r0
    mov r2, r4
    mov r0, r6
    mov r3, #0x9
    .word 0xeb065b15
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1a0:
    tst r1, #0x10
    beq .L_1b8
    mov r0, r5
    mov r1, r4
    bl func_0201c1d0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b8:
    tst r1, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    bl func_0201a100
    bl func_02018f4c
    mov r6, r0
    bl func_02018f5c
    mov r2, r4
    mov r1, r0
    mov r0, r6
    mov r3, #0xe
    .word 0xeb065b01
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
