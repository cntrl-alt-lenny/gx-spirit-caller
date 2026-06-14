; func_ov006_021c0dc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cc08c
        .extern data_ov006_021cc0a0
        .extern data_ov006_021cc0b4
        .extern data_ov006_021cc0c8
        .extern data_ov006_0224f448
        .extern data_ov006_0225e138
        .extern func_0208dd9c
        .extern func_02094504
        .extern func_020b3870
        .extern func_ov006_021b6d00
        .extern func_ov006_021cb0d8
        .extern func_ov006_021cb158
        .global func_ov006_021c0dc8
        .arm
func_ov006_021c0dc8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    str r0, [sp, #0x4]
    ldr sl, _LIT0
    bl func_0208dd9c
    ldr r1, [sp, #0x4]
    add r4, r0, #0x40
    ldr r1, [r1, #0x40]
    cmp r1, #0x6
    addeq sp, sp, #0x2c
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r1, r4, #0x5c00
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    ldr r1, [sp, #0x4]
    mov r0, sl
    mov r2, r4
    add r1, r1, #0x4
    bl func_ov006_021cb0d8
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_199c
    b .L_1950
    b .L_1964
    b .L_1978
    b .L_1950
    b .L_199c
    b .L_1950
    b .L_198c
.L_1950:
    mov r0, #0x0
    str r0, [sp, #0x1c]
    mov r0, #0x3
    str r0, [sp, #0x20]
    b .L_19ac
.L_1964:
    mov r0, #0x1
    str r0, [sp, #0x1c]
    mov r0, #0x2
    str r0, [sp, #0x20]
    b .L_19ac
.L_1978:
    mov r0, #0x0
    str r0, [sp, #0x1c]
    mov r0, #0x1
    str r0, [sp, #0x20]
    b .L_19ac
.L_198c:
    mov r0, #0x0
    str r0, [sp, #0x1c]
    str r0, [sp, #0x20]
    b .L_19ac
.L_199c:
    mov r0, #0x1
    str r0, [sp, #0x1c]
    mov r0, #0x3
    str r0, [sp, #0x20]
.L_19ac:
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x20]
    cmp r1, r0
    bgt .L_1ca0
    ldr r4, _LIT1
    ldr r0, [sp, #0x1c]
    ldr r3, _LIT2
    add r0, r4, r0, lsl #0x2
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x1c]
    ldr r2, _LIT3
    add r0, r3, r0, lsl #0x2
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x1c]
    ldr r1, _LIT4
    add r0, r2, r0, lsl #0x2
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x1c]
    add r0, r1, r0, lsl #0x2
    str r0, [sp, #0xc]
.L_19fc:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_1a44
    b .L_1a2c
    b .L_1a34
    b .L_1a3c
    b .L_1a2c
    b .L_1a44
    b .L_1a2c
    b .L_1a44
.L_1a2c:
    ldr r5, [sp, #0x18]
    b .L_1a48
.L_1a34:
    ldr r5, [sp, #0x14]
    b .L_1a48
.L_1a3c:
    ldr r5, [sp, #0x10]
    b .L_1a48
.L_1a44:
    ldr r5, [sp, #0xc]
.L_1a48:
    ldr r1, _LIT5
    ldr r0, [sp, #0x1c]
    ldrsh r3, [r5, #0x2]
    add r1, r1, r0, lsl #0x1
    add r0, r1, #0x8100
    add r2, r1, #0x6a
    ldrsh r1, [r5]
    ldrh r4, [r0, #0x6a]
    add r6, r2, #0x8100
    str r1, [sp, #0x24]
    ldr r0, _LIT5
    ldr r1, [sp, #0x1c]
    mov r2, #0x1
    add r5, r3, #0x3
    bl func_ov006_021b6d00
    cmp r0, r4
    ldr r0, [sp, #0x24]
    ldrh r7, [r6]
    movlt fp, #0x1
    ldr r4, _LIT6
    add r8, r0, #0xf
    mov r9, r0
    add r0, r5, #0x1
    movge fp, #0x0
    mov r6, #0x0
    str r0, [sp, #0x28]
.L_1ab0:
    cmp r7, r4
    bge .L_1ac4
    cmp r7, #0x0
    cmpeq r4, #0x1
    bne .L_1b44
.L_1ac4:
    cmp fp, #0x0
    beq .L_1b10
    cmp r7, #0x64
    blt .L_1b10
    mov r1, #0xa
    mul r1, r4, r1
    mov r0, r7
    bl func_020b3870
    mov r0, r1
    mov r1, r4
    bl func_020b3870
    ldr r1, [sp, #0x28]
    mov r2, r0
    str r1, [sp]
    mov r0, sl
    mov r1, #0x2
    mov r3, r8
    bl func_ov006_021cb158
    b .L_1b44
.L_1b10:
    mov r1, #0xa
    mul r1, r4, r1
    mov r0, r7
    bl func_020b3870
    mov r0, r1
    mov r1, r4
    bl func_020b3870
    mov r2, r0
    mov r0, sl
    mov r1, #0x0
    mov r3, r9
    str r5, [sp]
    bl func_ov006_021cb158
.L_1b44:
    ldr r0, _LIT7
    mov r2, r4
    smull r1, r4, r0, r2
    mov r0, r2, lsr #0x1f
    add r6, r6, #0x1
    add r4, r0, r4, asr #0x2
    add r8, r8, #0x4
    add r9, r9, #0x7
    cmp r6, #0x5
    blt .L_1ab0
    cmp fp, #0x0
    beq .L_1c58
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bne .L_1ba0
    ldr r0, _LIT6
    cmp r7, r0
    mvnge r4, #0xa
    bge .L_1ba4
    cmp r7, #0x3e8
    mvnge r4, #0x7
    mvnlt r4, #0x5
    b .L_1ba4
.L_1ba0:
    mvn r4, #0x5
.L_1ba4:
    ldr r0, _LIT5
    ldr r1, [sp, #0x1c]
    mov r2, #0x1
    bl func_ov006_021b6d00
    ldr r1, [sp, #0x24]
    ldr r7, _LIT6
    add r1, r1, r4
    ldr fp, _LIT7
    str r1, [sp, #0x8]
    mov r4, r0
    mov r6, r1
    mov r8, #0x0
    mov r9, #0xa
.L_1bd8:
    cmp r4, r7
    bge .L_1bec
    cmp r4, #0x0
    cmpeq r7, #0x1
    bne .L_1c1c
.L_1bec:
    mul r1, r7, r9
    mov r0, r4
    bl func_020b3870
    mov r0, r1
    mov r1, r7
    bl func_020b3870
    mov r2, r0
    mov r0, sl
    mov r1, #0x2
    mov r3, r6
    str r5, [sp]
    bl func_ov006_021cb158
.L_1c1c:
    mov r1, r7
    smull r0, r7, fp, r1
    mov r0, r1, lsr #0x1f
    add r7, r0, r7, asr #0x2
    add r6, r6, #0x4
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_1bd8
    ldr r1, [sp, #0x8]
    mov r0, sl
    add r3, r1, #0x15
    mov r1, #0x2
    mov r2, #0xe
    str r5, [sp]
    bl func_ov006_021cb158
.L_1c58:
    ldr r0, [sp, #0x1c]
    add r1, r0, #0x1
    ldr r0, [sp, #0x20]
    str r1, [sp, #0x1c]
    cmp r1, r0
    ldr r0, [sp, #0x18]
    add r0, r0, #0x4
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x14]
    add r0, r0, #0x4
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x10]
    add r0, r0, #0x4
    str r0, [sp, #0x10]
    ldr r0, [sp, #0xc]
    add r0, r0, #0x4
    str r0, [sp, #0xc]
    ble .L_19fc
.L_1ca0:
    mov r0, #0x1
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0225e138
_LIT1: .word data_ov006_021cc08c
_LIT2: .word data_ov006_021cc0a0
_LIT3: .word data_ov006_021cc0b4
_LIT4: .word data_ov006_021cc0c8
_LIT5: .word data_ov006_0224f448
_LIT6: .word 0x00002710
_LIT7: .word 0x66666667
