; func_0201c2a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02008cd4
        .extern func_0200a19c
        .extern func_02018e00
        .extern func_02018f80
        .extern func_02018f90
        .extern func_02019210
        .extern func_0201942c
        .extern func_020198bc
        .extern func_02019af4
        .extern func_02019ce0
        .extern func_02019ea4
        .extern func_0201a134
        .extern func_0201bddc
        .extern func_0201c1e0
        .extern func_0201c224
        .global func_0201c2a8
        .arm
func_0201c2a8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    bl GetSystemWork
    ldr r1, [r5, #0xc]
    mov r0, r5
    bic r1, r1, #0xf
    orr r1, r1, #0x7
    str r1, [r5, #0xc]
    bl func_0201bddc
    ldr r0, [r5, #0x14]
    ldr r1, [r5, #0x10]
    mov r0, r0, lsl #0x18
    cmp r1, #0x0
    mov r4, r0, lsr #0x18
    bne .L_16c
    mov r0, r4
    bl func_0201942c
    cmp r0, #0x0
    beq .L_160
    bl func_02018f80
    mov r6, r0
    bl func_02018f90
    mov r1, r0
    mov r0, r6
    mov r2, r4
    mov r3, #0x2
    .word 0xeb065b86
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_160:
    mov r0, r5
    bl func_0201c1e0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_16c:
    tst r1, #0x2
    beq .L_204
    mov r0, r4
    bl func_02019ea4
    mov r6, r0
    add r1, sp, #0x0
    mov r0, r4
    bl func_02019ce0
    tst r6, #0x1
    movne r6, #0x1
    mov r0, r4
    moveq r6, #0x2
    bl func_02019210
    cmp r0, #0x5
    bne .L_1b8
    tst r6, #0x1
    movne r7, #0xc
    moveq r7, #0xd
    b .L_1d0
.L_1b8:
    add r0, sp, #0x0
    sub r1, r6, #0x1
    ldrb r0, [r0, r1]
    cmp r0, #0x10
    movcs r7, #0x7
    movcc r7, #0x6
.L_1d0:
    mov r0, r4
    mov r1, r6
    bl func_02019af4
    bl func_02018f80
    mov r6, r0
    bl func_02018f90
    mov r1, r0
    mov r2, r4
    mov r3, r7
    mov r0, r6
    .word 0xeb065b5d
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_204:
    tst r1, #0x4
    beq .L_248
    bl func_02018f80
    mov r6, r0
    bl func_02018f90
    mov r1, r0
    mov r0, r6
    mov r2, r4
    mov r3, #0x8
    .word 0xeb065b51
    str r0, [r5]
    mov r0, r4
    mov r1, #0x1
    bl func_02018e00
    mov r0, r4
    bl func_0200a19c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_248:
    tst r1, #0x8
    beq .L_28c
    mov r0, r4
    bl func_02008cd4
    mov r0, r4
    mov r1, #0x1
    bl func_020198bc
    bl func_02018f80
    mov r6, r0
    bl func_02018f90
    mov r1, r0
    mov r2, r4
    mov r0, r6
    mov r3, #0x9
    .word 0xeb065b3b
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_28c:
    tst r1, #0x10
    beq .L_2a4
    mov r0, r5
    mov r1, r4
    bl func_0201c224
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2a4:
    tst r1, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    bl func_0201a134
    bl func_02018f80
    mov r6, r0
    bl func_02018f90
    mov r2, r4
    mov r1, r0
    mov r0, r6
    mov r3, #0xe
    .word 0xeb065b27
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
