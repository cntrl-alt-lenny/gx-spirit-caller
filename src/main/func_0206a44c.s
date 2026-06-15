; func_0206a44c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020540d0
        .extern func_02054140
        .extern func_0206849c
        .extern func_020684a4
        .extern func_020684ac
        .extern func_020684b4
        .extern func_020684c0
        .extern func_02068b1c
        .extern func_02068b54
        .extern func_020aaddc
        .global func_0206a44c
        .arm
func_0206a44c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r8, r2
    ldrb r2, [r8]
    mov r9, r1
    mov sl, r0
    mov r7, r3
    str r2, [sp, #0x4]
    mov r0, r9
    mov r1, r2
    str r7, [sp]
    ldr r6, [sp, #0x38]
    bl func_020684c0
    ldr r0, [sp, #0x4]
    add r8, r8, #0x5
    ands r0, r0, #0x10
    sub r7, r7, #0x5
    ldr r0, [sp, #0x4]
    addne r8, r8, #0x2
    subne r7, r7, #0x2
    ands r0, r0, #0x2
    moveq r0, #0x0
    streq r0, [sp, #0xc]
    beq .L_1bc
    ldrb r1, [r8]
    ldrb r0, [r8, #0x1]
    add r2, sp, #0xc
    sub r7, r7, #0x4
    strb r1, [r2]
    strb r0, [r2, #0x1]
    ldrb r1, [r8, #0x2]
    ldrb r0, [r8, #0x3]
    add r8, r8, #0x4
    strb r1, [r2, #0x2]
    strb r0, [r2, #0x3]
.L_1bc:
    ldr r0, [sp, #0x4]
    ands r0, r0, #0x20
    addeq r0, sl, #0x400
    ldreqh r0, [r0, #0xa8]
    streqh r0, [sp, #0xa]
    beq .L_1f0
    ldrb r1, [r8]
    ldrb r0, [r8, #0x1]
    add r2, sp, #0xa
    add r8, r8, #0x2
    strb r1, [r2]
    strb r0, [r2, #0x1]
    sub r7, r7, #0x2
.L_1f0:
    ldrh r2, [sp, #0xa]
    ldr r1, [sp, #0xc]
    mov r0, r9
    bl func_020684b4
    ldr r0, [sp, #0x4]
    ands r0, r0, #0x8
    beq .L_244
    ldrb r2, [r8]
    ldrb r1, [r8, #0x1]
    add r3, sp, #0xc
    mov r0, r9
    strb r2, [r3]
    strb r1, [r3, #0x1]
    ldrb r2, [r8, #0x2]
    ldrb r1, [r8, #0x3]
    add r8, r8, #0x4
    sub r7, r7, #0x4
    strb r2, [r3, #0x2]
    strb r1, [r3, #0x3]
    ldr r1, [sp, #0xc]
    bl func_020684ac
.L_244:
    ldr r0, [sp, #0x4]
    ands r0, r0, #0x40
    beq .L_37c
    ldr r0, [sl, #0x8]
    bl func_02054140
    mov r5, r0
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_364
    mov fp, #0xff
.L_26c:
    ldr r0, [sl, #0x8]
    mov r1, r4
    bl func_020540d0
    mov r1, r0
    ldr r0, [r1, #0x4]
    cmp r0, #0x0
    beq .L_304
    cmp r0, #0x1
    beq .L_29c
    cmp r0, #0x2
    beq .L_2b8
    b .L_358
.L_29c:
    ldrb r2, [r8]
    ldr r1, [r1]
    mov r0, r9
    bl func_02068b1c
    add r8, r8, #0x1
    sub r7, r7, #0x1
    b .L_358
.L_2b8:
    ldrb ip, [r8]
    ldrb r3, [r8, #0x1]
    add r2, sp, #0x8
    mov r0, r9
    strb ip, [r2]
    strb r3, [r2, #0x1]
    ldrh r3, [sp, #0x8]
    ldr r1, [r1]
    mov r2, r3, asr #0x8
    mov r3, r3, lsl #0x8
    and r2, r2, #0xff
    and r3, r3, #0xff00
    orr r2, r2, r3
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_02068b1c
    add r8, r8, #0x2
    sub r7, r7, #0x2
    b .L_358
.L_304:
    cmp r6, #0x0
    ldrneb r0, [r8], #0x1
    subne r7, r7, #0x1
    moveq r0, fp
    cmp r0, #0xff
    bne .L_344
    ldr r1, [r1]
    mov r0, r9
    mov r2, r8
    bl func_02068b54
    mov r0, r8
    bl func_020aaddc
    add r0, r0, #0x1
    add r8, r8, r0
    sub r7, r7, r0
    b .L_358
.L_344:
    add r0, sl, r0, lsl #0x2
    ldr r1, [r1]
    ldr r2, [r0, #0x84]
    mov r0, r9
    bl func_02068b54
.L_358:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_26c
.L_364:
    mov r0, r9
    bl func_0206849c
    orr r1, r0, #0x1
    mov r0, r9
    and r1, r1, #0xff
    bl func_020684a4
.L_37c:
    ldr r0, [sp, #0x4]
    ands r0, r0, #0x80
    beq .L_3f8
    b .L_3c8
.L_38c:
    mov r0, r8
    mov r4, r8
    bl func_020aaddc
    add r3, r0, #0x1
    add r8, r8, r3
    mov r0, r9
    mov r1, r4
    mov r2, r8
    sub r7, r7, r3
    bl func_02068b54
    mov r0, r8
    bl func_020aaddc
    add r0, r0, #0x1
    add r8, r8, r0
    sub r7, r7, r0
.L_3c8:
    ldrsb r0, [r8]
    cmp r0, #0x0
    beq .L_3dc
    cmp r7, #0x0
    bgt .L_38c
.L_3dc:
    mov r0, r9
    sub r7, r7, #0x1
    bl func_0206849c
    orr r1, r0, #0x2
    mov r0, r9
    and r1, r1, #0xff
    bl func_020684a4
.L_3f8:
    ldr r0, [sp]
    sub r0, r0, r7
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
