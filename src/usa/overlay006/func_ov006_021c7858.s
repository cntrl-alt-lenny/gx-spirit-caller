; func_ov006_021c7858 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020fe050
        .extern data_02104e6c
        .extern data_ov006_021ce530
        .extern data_ov006_0224f328
        .extern func_02021174
        .extern func_02021428
        .extern func_020221e0
        .extern func_ov006_021b6e50
        .extern func_ov006_021c7c54
        .extern func_ov006_021c7dd0
        .extern func_ov006_021c80b4
        .extern func_ov006_021c8110
        .extern func_ov006_021c816c
        .extern func_ov006_021c81a0
        .extern func_ov006_021c8a68
        .extern func_ov006_021c8d8c
        .extern func_ov006_021c8f24
        .global func_ov006_021c7858
        .arm
func_ov006_021c7858:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, _LIT0
    mov r7, r0
    ldr r0, [r4, #0x4]
    mov r6, r3
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r3, _LIT1
    mov r0, #0x14
    ldrne r3, _LIT2
    str r1, [r7, #0x74]
    mla r5, r1, r0, r3
    ldrb r0, [r5, #0x6]
    ldr r4, _LIT3
    str r0, [r7, #0x78]
    ldrb r0, [r5, #0x7]
    str r0, [r7, #0x7c]
    ldrb r0, [r5, #0xa]
    str r0, [r7, #0x80]
    ldrb r0, [r5, #0xb]
    str r0, [r7, #0x84]
    ldr r0, [r7, #0x74]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_a8
    b .L_80
    b .L_80
    b .L_80
    b .L_80
    b .L_80
    b .L_80
    b .L_80
.L_80:
    ldr r0, [r7, #0x58]
    cmp r0, #0x0
    beq .L_a8
    ldr r0, [r7, #0x5c]
    cmp r0, #0x0
    movne r1, #0x2
    ldr r0, [r7, #0x78]
    moveq r1, #0x1
    add r0, r0, r1
    str r0, [r7, #0x78]
.L_a8:
    cmp r2, #0x0
    blt .L_bc
    mov r0, r7
    mov r1, r2
    bl func_ov006_021c7dd0
.L_bc:
    ldrsh r0, [r5, #0x2]
    cmp r0, #0x3
    bne .L_e0
    ldr r0, [r7, #0x78]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    mvnne r0, #0x3
    bne .L_e4
.L_e0:
    mov r0, #0x0
.L_e4:
    str r0, [r7, #0x90]
    ldrsh r0, [r5, #0x2]
    cmp r0, #0x0
    mvneq r0, #0x14
    beq .L_11c
    cmp r0, #0x1
    bne .L_118
    ldr r0, [r7, #0x7c]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    mvnne r0, #0x3
    bne .L_11c
.L_118:
    mov r0, #0x0
.L_11c:
    str r0, [r7, #0x94]
    ldr r0, [r7, #0x80]
    mov r1, #0x1
    str r0, [r7, #0xa0]
    ldr r2, [r7, #0x84]
    mov r0, #0x0
    str r2, [r7, #0xa4]
    str r1, [r7, #0xa8]
    str r0, [r7, #0x114]
    str r0, [r7, #0x118]
    str r0, [r7, #0x11c]
    add r1, r7, #0x64
    mov r2, #0x8
    bl Fill32
    ldr r0, [r7, #0x74]
    cmp r0, #0x7
    beq .L_16c
    cmp r0, #0x8
    beq .L_250
    b .L_2e4
.L_16c:
    ldr r2, [r7, #0x54]
    mov r0, r4
    mov r1, #0x0
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ldreq r0, [r7, #0x64]
    mov r1, #0x1
    orreq r0, r0, #0x7
    streq r0, [r7, #0x64]
    ldr r2, [r7, #0x54]
    mov r0, r4
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ldreq r0, [r7, #0x64]
    mov r1, #0x2
    orreq r0, r0, #0x38
    streq r0, [r7, #0x64]
    ldr r2, [r7, #0x54]
    mov r0, r4
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ldreq r0, [r7, #0x64]
    mov r1, #0x0
    orreq r0, r0, #0x1c0
    streq r0, [r7, #0x64]
    ldr r2, [r7, #0x54]
    mov r0, r4
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ble .L_1f8
    mov r0, #0x1
    str r0, [r7, #0x80]
    mov r0, #0x0
    str r0, [r7, #0x84]
    b .L_2e4
.L_1f8:
    ldr r2, [r7, #0x54]
    mov r0, r4
    mov r1, #0x1
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ble .L_224
    mov r0, #0x0
    str r0, [r7, #0x80]
    mov r0, #0x1
    str r0, [r7, #0x84]
    b .L_2e4
.L_224:
    ldr r2, [r7, #0x54]
    mov r0, r4
    mov r1, #0x2
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ble .L_2e4
    mov r0, #0x1
    str r0, [r7, #0x80]
    mov r0, #0x2
    str r0, [r7, #0x84]
    b .L_2e4
.L_250:
    ldr r2, [r7, #0x54]
    mov r0, r4
    mov r1, #0x0
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ldreq r0, [r7, #0x64]
    mov r1, #0x3
    orreq r0, r0, #0x3
    streq r0, [r7, #0x64]
    ldr r2, [r7, #0x54]
    mov r0, r4
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ldreq r0, [r7, #0x64]
    mov r1, #0x0
    orreq r0, r0, #0xc
    streq r0, [r7, #0x64]
    ldr r2, [r7, #0x54]
    mov r0, r4
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ble .L_2bc
    mov r0, #0x1
    str r0, [r7, #0x80]
    mov r0, #0x0
    str r0, [r7, #0x84]
    b .L_2e4
.L_2bc:
    ldr r2, [r7, #0x54]
    mov r0, r4
    mov r1, #0x3
    bl func_ov006_021b6e50
    cmp r0, #0x0
    ble .L_2e4
    mov r0, #0x0
    str r0, [r7, #0x80]
    mov r0, #0x1
    str r0, [r7, #0x84]
.L_2e4:
    ldr r2, [sp, #0x18]
    mov r0, r7
    mov r1, r6
    bl func_ov006_021c7c54
    mov r0, r7
    bl func_ov006_021c816c
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    bne .L_318
    ldr r0, [r7, #0x74]
    sub r0, r0, #0x15
    cmp r0, #0x8
    bhi .L_320
.L_318:
    mov r0, r7
    bl func_ov006_021c81a0
.L_320:
    mov r0, r7
    bl func_ov006_021c8d8c
    mov r0, r7
    bl func_ov006_021c8a68
    mov r0, r7
    mov r1, #0x1
    bl func_ov006_021c80b4
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    bne .L_358
    ldr r0, [r7, #0x74]
    sub r0, r0, #0x15
    cmp r0, #0x8
    bhi .L_364
.L_358:
    mov r0, r7
    mov r1, #0x1
    bl func_ov006_021c8110
.L_364:
    ldr r0, _LIT4
    bl func_02021174
    str r0, [r7]
    bl func_02021428
    ldrsh r1, [r5]
    mov r0, #0x5
    bl func_020221e0
    mov r0, r7
    bl func_ov006_021c8f24
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov006_021ce530
_LIT2: .word data_ov006_021ce530+0x258
_LIT3: .word data_ov006_0224f328
_LIT4: .word data_020fe050
