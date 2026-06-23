; func_ov006_021bd7a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cbfbc
        .extern data_ov006_021cbfd4
        .extern data_ov006_021cc280
        .extern data_ov006_021cc2ec
        .extern data_ov006_021cc358
        .extern data_ov006_021cc468
        .extern data_ov006_0224f328
        .extern data_ov006_0225de1c
        .extern func_0202bb88
        .extern func_0202de48
        .extern func_ov006_021b6c1c
        .extern func_ov006_021b6e50
        .extern func_ov006_021b7bac
        .extern func_ov006_021b8d4c
        .extern func_ov006_021b8e7c
        .extern func_ov006_021bd5b0
        .extern func_ov006_021c7858
        .extern func_ov006_021c7dd0
        .extern func_ov006_021c7e50
        .extern func_ov006_021c8068
        .extern func_ov006_021c8078
        .extern func_ov006_021c8088
        .extern func_ov006_021c8098
        .global func_ov006_021bd7a0
        .arm
func_ov006_021bd7a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r1, [r5, #0x50]
    add r3, r5, #0xa0
    mov r0, #0x24
    ldr r2, [r5, #0x40]
    mla r6, r1, r0, r3
    cmp r2, #0x0
    beq .L_38
    cmp r2, #0x2
    beq .L_54
    cmp r2, #0x3
    bne .L_70
.L_38:
    ldr r2, [r5, #0x4c]
    ldr r3, _LIT0
    mov r0, #0xc
    mla r7, r2, r0, r3
    ldr r0, _LIT1
    mov r3, #0x9
    b .L_88
.L_54:
    ldr r2, [r5, #0x4c]
    ldr r3, _LIT2
    mov r0, #0xc
    mla r7, r2, r0, r3
    ldr r0, _LIT3
    mov r3, #0x9
    b .L_88
.L_70:
    ldr r2, [r5, #0x4c]
    ldr r3, _LIT4
    mov r0, #0xc
    mla r7, r2, r0, r3
    ldr r0, _LIT5
    mov r3, #0x2
.L_88:
    ldr r2, [r5, #0x48]
    cmp r2, #0x0
    bne .L_18c
    mov r9, #0x0
    cmp r3, #0x0
    mov r4, r9
    ble .L_cc
    ldr sl, [r7, #0x8]
.L_a8:
    ldr r2, [r0, #0x8]
    mov r8, r0
    cmp r2, sl
    moveq r9, #0x1
    beq .L_cc
    add r0, r0, #0xc
    add r4, r4, #0x1
    cmp r4, r3
    blt .L_a8
.L_cc:
    ldr r0, [r7, #0x8]
    cmp r0, #0x4
    bne .L_168
    ldr r0, _LIT6
    bl func_ov006_021b7bac
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_15c
    b .L_114
    b .L_11c
    b .L_124
    b .L_124
    b .L_134
    b .L_13c
    b .L_12c
    b .L_144
    b .L_14c
    b .L_154
.L_114:
    mov r4, #0x15
    b .L_16c
.L_11c:
    mov r4, #0x16
    b .L_16c
.L_124:
    mov r4, #0x17
    b .L_16c
.L_12c:
    mov r4, #0x18
    b .L_16c
.L_134:
    mov r4, #0x19
    b .L_16c
.L_13c:
    mov r4, #0x1a
    b .L_16c
.L_144:
    mov r4, #0x1b
    b .L_16c
.L_14c:
    mov r4, #0x1c
    b .L_16c
.L_154:
    mov r4, #0x1d
    b .L_16c
.L_15c:
    mvn r4, #0x0
    mov r9, #0x0
    b .L_16c
.L_168:
    ldr r4, [r8, #0x4]
.L_16c:
    cmp r9, #0x0
    ldrsh r9, [r8]
    ldrsh r8, [r8, #0x2]
    mov sl, #0x0
    bne .L_350
    add sp, sp, #0x10
    mov r0, sl
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18c:
    mov r0, r5
    bl func_ov006_021bd5b0
    movs r2, r0
    addmi sp, sp, #0x10
    movmi r0, #0x0
    ldmmiia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r6, #0x20]
    ldr r1, [r5, #0x50]
    mov r3, r0, lsl #0x1f
    ldr r0, _LIT6
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6c1c
    mov fp, r0
    ldr r1, [r5, #0x50]
    ldr r0, _LIT6
    mov r2, fp
    bl func_ov006_021b6e50
    ldr r1, [r5, #0x40]
    mov r8, r0
    cmp r1, #0x0
    ldreq r0, [r5, #0x50]
    cmpeq r0, #0x0
    beq .L_1f8
    cmp r8, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f8:
    mov r0, fp
    bl func_0202de48
    ldr r2, [r5, #0x50]
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_294
    b .L_224
    b .L_24c
    b .L_26c
    b .L_280
    b .L_288
.L_224:
    ldr r1, [r5, #0x40]
    cmp r1, #0x2
    moveq r4, #0xb
    beq .L_240
    cmp r0, #0x3
    moveq r4, #0x2
    movne r4, #0x1
.L_240:
    cmp r8, #0x0
    moveq r4, #0x3
    b .L_294
.L_24c:
    ldr r0, [r5, #0x40]
    cmp r0, #0x1
    moveq r4, #0x9
    beq .L_294
    cmp r0, #0x2
    moveq r4, #0xc
    movne r4, #0x4
    b .L_294
.L_26c:
    ldr r0, [r5, #0x40]
    cmp r0, #0x1
    moveq r4, #0xa
    movne r4, #0x5
    b .L_294
.L_280:
    mov r4, #0x6
    b .L_294
.L_288:
    cmp r0, #0x3
    moveq r4, #0x8
    movne r4, #0x7
.L_294:
    ldr r1, [r6]
    mov r0, #0x17
    cmp r2, #0x4
    mul r2, r1, r0
    bne .L_2bc
    ldr r0, [r6, #0x4]
    add r9, r2, #0x4
    mov r0, r0, lsl #0x5
    add r8, r0, #0x34
    b .L_2cc
.L_2bc:
    ldr r0, [r6, #0x4]
    add r9, r2, #0x4
    mov r0, r0, lsl #0x5
    add r8, r0, #0x14
.L_2cc:
    ldr r0, [r5, #0x40]
    mov sl, #0x1
    cmp r0, #0x0
    bne .L_334
    ldr r0, _LIT6
    mov r1, fp
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov006_021b8d4c
    ldr r0, [r5, #0x40]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x8]
    movne r0, #0x0
    strne r0, [sp, #0x8]
    ldr r0, _LIT6
    bl func_ov006_021b8e7c
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [sp, #0x4]
    moveq r0, #0x0
    streq r0, [sp, #0x4]
    mov r0, fp
    bl func_0202bb88
    str r0, [sp, #0xc]
    b .L_350
.L_334:
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r1, [sp, #0x8]
    mov r0, fp
    str r1, [sp, #0x4]
    bl func_0202bb88
    str r0, [sp, #0xc]
.L_350:
    ldr r1, _LIT7
    ldr r0, _LIT8
    mov r2, #0xd
    bl func_ov006_021c8068
    ldr r0, _LIT8
    mov r1, #0x2
    mov r2, #0xe
    bl func_ov006_021c8078
    ldr r1, [r6, #0x20]
    ldr r0, _LIT8
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    ldr r1, [r5, #0x50]
    bl func_ov006_021c8088
    cmp sl, #0x0
    beq .L_3ac
    ldr r0, _LIT8
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0x4]
    ldr r6, [sp, #0xc]
    mov r1, fp
    str r6, [sp]
    bl func_ov006_021c8098
.L_3ac:
    ldr r0, _LIT8
    mov r1, r4
    mov r3, r9
    str r8, [sp]
    mvn r2, #0x0
    bl func_ov006_021c7858
    ldr r0, [r5, #0x48]
    cmp r0, #0x0
    ldreq r0, [r7, #0x8]
    cmpeq r0, #0x3
    bne .L_400
    ldr r1, [r5, #0x50]
    ldr r0, _LIT6
    bl func_ov006_021b7bac
    mov r2, r0
    ldr r0, _LIT8
    mov r1, #0x1
    bl func_ov006_021c7e50
    mov r1, r0
    ldr r0, _LIT8
    bl func_ov006_021c7dd0
.L_400:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_021cc468
_LIT1: .word data_ov006_021cc280
_LIT2: .word data_ov006_021cc358
_LIT3: .word data_ov006_021cc2ec
_LIT4: .word data_ov006_021cbfd4
_LIT5: .word data_ov006_021cbfbc
_LIT6: .word data_ov006_0224f328
_LIT7: .word 0x00000322
_LIT8: .word data_ov006_0225de1c
