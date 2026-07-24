; func_0204991c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff888
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204989c
        .extern func_0204a848
        .extern func_0204a8ec
        .extern func_0204a93c
        .extern func_0204cae0
        .extern func_0204cbac
        .extern func_0204ec1c
        .extern func_0206258c
        .extern func_02064f10
        .extern OS_SNPrintf
        .extern func_02092fc8
        .global func_0204991c
        .arm
func_0204991c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r5, r0
    mov r6, r2
    mov r4, r3
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x6
    beq .L_38
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xb
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
.L_38:
    cmp r4, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r5, #0x0
    bne .L_234
    mov r0, #0x0
    str r0, [r4, #0x8]
    bl func_0204987c
    ldrb r1, [r0, #0x14]
    add r1, r1, #0x1
    strb r1, [r0, #0x14]
    bl func_0204987c
    ldrb r1, [r4]
    ldrb r5, [r0, #0x14]
    cmp r1, #0x0
    beq .L_1cc
    bl func_0204987c
    ldr r1, [r6, #0x4]
    add r0, r0, r5, lsl #0x2
    str r1, [r0, #0x208]
    ldrh r4, [r6, #0x2]
    bl func_0204987c
    mov r2, r4, asr #0x8
    mov r1, r4, lsl #0x8
    add r0, r0, r5, lsl #0x1
    and r2, r2, #0xff
    and r1, r1, #0xff00
    orr r1, r2, r1
    add r0, r0, #0x200
    strh r1, [r0, #0x88]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x174]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x178]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x17c]
    str r1, [r0, #0x180]
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xb
    bne .L_f4
    mov r0, #0xc
    bl func_02049868
    b .L_fc
.L_f4:
    mov r0, #0x7
    bl func_02049868
.L_fc:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0xc]
    bl func_0204987c
    ldr r3, [r0, #0x1f8]
    ldr r2, _LIT0
    add r0, sp, #0x10
    mov r1, #0xc
    bl OS_SNPrintf
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    add r1, r6, r5, lsl #0x2
    mov r2, r0
    ldr r0, [r1, #0x208]
    add r1, r2, r5, lsl #0x1
    add r1, r1, #0x200
    ldrh r1, [r1, #0x88]
    mov r2, #0x0
    bl func_02064f10
    mov r6, r0
    bl func_0204987c
    mvn r1, #0x0
    str r1, [sp]
    ldr r3, _LIT1
    mov r1, #0x0
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x8]
    mov r2, r6
    str r0, [sp, #0x8]
    str r1, [sp, #0xc]
    ldr r0, [r4, #0x4]
    add r3, sp, #0x10
    ldr r0, [r0]
    bl func_0206258c
    cmp r0, #0x1
    bne .L_1a4
    bl func_0204a848
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_1a4:
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_0204987c
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cbac
    add sp, sp, #0x20
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1cc:
    cmp r6, #0x0
    beq .L_210
    sub r4, r5, #0x1
    bl func_0204987c
    ldr r1, [r6, #0x4]
    add r0, r0, r4, lsl #0x2
    str r1, [r0, #0x208]
    ldrh r5, [r6, #0x2]
    bl func_0204987c
    mov r2, r5, asr #0x8
    mov r1, r5, lsl #0x8
    add r0, r0, r4, lsl #0x1
    and r2, r2, #0xff
    and r1, r1, #0xff00
    orr r1, r2, r1
    add r0, r0, #0x200
    strh r1, [r0, #0x88]
.L_210:
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x184]
    mov r0, #0x7
    str r1, [r4, #0x188]
    bl func_02049868
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_234:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_0204a8ec
    mov r6, r0
    cmp r6, #0x2
    beq .L_264
    cmp r6, #0x1
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
.L_264:
    ldrb r0, [r4]
    cmp r0, #0x0
    bne .L_2f0
    cmp r6, #0x1
    beq .L_28c
    cmp r6, #0x2
    bne .L_2cc
    ldrb r0, [r4, #0x1]
    cmp r0, #0x1
    bcc .L_2cc
.L_28c:
    mov r0, #0x0
    str r0, [r4, #0x8]
    bl func_0204989c
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cae0
    add sp, sp, #0x20
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_2cc:
    ldrb r1, [r4, #0x1]
    mov r0, r4
    add r1, r1, #0x1
    strb r1, [r4, #0x1]
    bl func_0204ec1c
    bl func_0204a93c
    add sp, sp, #0x20
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_2f0:
    bl func_0204987c
    mov r5, r0
    bl func_02092fc8
    str r0, [r5, #0x17c]
    str r1, [r5, #0x180]
    cmp r6, #0x1
    beq .L_32c
    cmp r6, #0x2
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, pc}
    bl func_0204987c
    ldrb r0, [r0, #0x174]
    cmp r0, #0x1
    addcc sp, sp, #0x20
    ldmccia sp!, {r4, r5, r6, pc}
.L_32c:
    mov r0, #0x0
    str r0, [r4, #0x8]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_354
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_36c
.L_354:
    mov r0, #0x1
    bl func_0204989c
    cmp r0, #0x0
    bne .L_380
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_36c:
    mov r0, #0x0
    bl func_0204989c
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, pc}
.L_380:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x174]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x178]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x17c]
    str r1, [r0, #0x180]
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cbac
    cmp r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ff888
_LIT1: .word 0x00001388
