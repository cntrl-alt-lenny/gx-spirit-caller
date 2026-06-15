; func_ov006_021c7964 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020fe130
        .extern data_02104f4c
        .extern data_ov006_021ce650
        .extern data_ov006_021ce8a8
        .extern data_ov006_0224f448
        .extern func_020211c8
        .extern func_0202147c
        .extern func_02022234
        .extern func_ov006_021b6f50
        .extern func_ov006_021c7d60
        .extern func_ov006_021c7edc
        .extern func_ov006_021c81c0
        .extern func_ov006_021c821c
        .extern func_ov006_021c8278
        .extern func_ov006_021c82ac
        .extern func_ov006_021c8b74
        .extern func_ov006_021c8e98
        .extern func_ov006_021c9030
        .global func_ov006_021c7964
        .arm
func_ov006_021c7964:
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
    b .L_488
    b .L_460
    b .L_460
    b .L_460
    b .L_460
    b .L_460
    b .L_460
    b .L_460
.L_460:
    ldr r0, [r7, #0x58]
    cmp r0, #0x0
    beq .L_488
    ldr r0, [r7, #0x5c]
    cmp r0, #0x0
    movne r1, #0x2
    ldr r0, [r7, #0x78]
    moveq r1, #0x1
    add r0, r0, r1
    str r0, [r7, #0x78]
.L_488:
    cmp r2, #0x0
    blt .L_49c
    mov r0, r7
    mov r1, r2
    bl func_ov006_021c7edc
.L_49c:
    ldrsh r0, [r5, #0x2]
    cmp r0, #0x3
    bne .L_4c0
    ldr r0, [r7, #0x78]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    mvnne r0, #0x3
    bne .L_4c4
.L_4c0:
    mov r0, #0x0
.L_4c4:
    str r0, [r7, #0x90]
    ldrsh r0, [r5, #0x2]
    cmp r0, #0x0
    mvneq r0, #0x14
    beq .L_4fc
    cmp r0, #0x1
    bne .L_4f8
    ldr r0, [r7, #0x7c]
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    mvnne r0, #0x3
    bne .L_4fc
.L_4f8:
    mov r0, #0x0
.L_4fc:
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
    beq .L_54c
    cmp r0, #0x8
    beq .L_630
    b .L_6c4
.L_54c:
    ldr r2, [r7, #0x54]
    mov r0, r4
    mov r1, #0x0
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ldreq r0, [r7, #0x64]
    mov r1, #0x1
    orreq r0, r0, #0x7
    streq r0, [r7, #0x64]
    ldr r2, [r7, #0x54]
    mov r0, r4
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ldreq r0, [r7, #0x64]
    mov r1, #0x2
    orreq r0, r0, #0x38
    streq r0, [r7, #0x64]
    ldr r2, [r7, #0x54]
    mov r0, r4
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ldreq r0, [r7, #0x64]
    mov r1, #0x0
    orreq r0, r0, #0x1c0
    streq r0, [r7, #0x64]
    ldr r2, [r7, #0x54]
    mov r0, r4
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ble .L_5d8
    mov r0, #0x1
    str r0, [r7, #0x80]
    mov r0, #0x0
    str r0, [r7, #0x84]
    b .L_6c4
.L_5d8:
    ldr r2, [r7, #0x54]
    mov r0, r4
    mov r1, #0x1
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ble .L_604
    mov r0, #0x0
    str r0, [r7, #0x80]
    mov r0, #0x1
    str r0, [r7, #0x84]
    b .L_6c4
.L_604:
    ldr r2, [r7, #0x54]
    mov r0, r4
    mov r1, #0x2
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ble .L_6c4
    mov r0, #0x1
    str r0, [r7, #0x80]
    mov r0, #0x2
    str r0, [r7, #0x84]
    b .L_6c4
.L_630:
    ldr r2, [r7, #0x54]
    mov r0, r4
    mov r1, #0x0
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ldreq r0, [r7, #0x64]
    mov r1, #0x3
    orreq r0, r0, #0x3
    streq r0, [r7, #0x64]
    ldr r2, [r7, #0x54]
    mov r0, r4
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ldreq r0, [r7, #0x64]
    mov r1, #0x0
    orreq r0, r0, #0xc
    streq r0, [r7, #0x64]
    ldr r2, [r7, #0x54]
    mov r0, r4
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ble .L_69c
    mov r0, #0x1
    str r0, [r7, #0x80]
    mov r0, #0x0
    str r0, [r7, #0x84]
    b .L_6c4
.L_69c:
    ldr r2, [r7, #0x54]
    mov r0, r4
    mov r1, #0x3
    bl func_ov006_021b6f50
    cmp r0, #0x0
    ble .L_6c4
    mov r0, #0x0
    str r0, [r7, #0x80]
    mov r0, #0x1
    str r0, [r7, #0x84]
.L_6c4:
    ldr r2, [sp, #0x18]
    mov r0, r7
    mov r1, r6
    bl func_ov006_021c7d60
    mov r0, r7
    bl func_ov006_021c8278
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    bne .L_6f8
    ldr r0, [r7, #0x74]
    sub r0, r0, #0x15
    cmp r0, #0x8
    bhi .L_700
.L_6f8:
    mov r0, r7
    bl func_ov006_021c82ac
.L_700:
    mov r0, r7
    bl func_ov006_021c8e98
    mov r0, r7
    bl func_ov006_021c8b74
    mov r0, r7
    mov r1, #0x1
    bl func_ov006_021c81c0
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    bne .L_738
    ldr r0, [r7, #0x74]
    sub r0, r0, #0x15
    cmp r0, #0x8
    bhi .L_744
.L_738:
    mov r0, r7
    mov r1, #0x1
    bl func_ov006_021c821c
.L_744:
    ldr r0, _LIT4
    bl func_020211c8
    str r0, [r7]
    bl func_0202147c
    ldrsh r1, [r5]
    mov r0, #0x5
    bl func_02022234
    mov r0, r7
    bl func_ov006_021c9030
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov006_021ce650
_LIT2: .word data_ov006_021ce8a8
_LIT3: .word data_ov006_0224f448
_LIT4: .word data_020fe130
