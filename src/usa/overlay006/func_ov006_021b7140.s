; func_ov006_021b7140 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern func_02005994
        .extern func_ov006_021b8f00
        .global func_ov006_021b7140
        .arm
func_ov006_021b7140:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r4, #0x0
    mov sl, r2
    mov r7, r3
    str r4, [sp, #0x4]
    ldr r6, [sp, #0x28]
    mov r9, r0
    mov r8, r1
    strh r7, [sp, #0x4]
    cmp sl, #0x4
    addls pc, pc, sl, lsl #0x2
    b .L_19c
    b .L_48
    b .L_54
    b .L_60
    b .L_6c
    b .L_78
.L_48:
    add r0, r9, #0x2a0
    add r4, r0, #0x6000
    b .L_80
.L_54:
    add r0, r9, #0xa60
    add r4, r0, #0x7000
    b .L_80
.L_60:
    add r0, r9, #0xc60
    add r4, r0, #0x7000
    b .L_80
.L_6c:
    add r0, r9, #0xe60
    add r4, r0, #0x7000
    b .L_80
.L_78:
    add r0, r9, #0x60
    add r4, r0, #0x8000
.L_80:
    add r0, r9, sl, lsl #0x1
    add r0, r0, #0x8100
    ldrh r5, [r0, #0x60]
    mov r0, #0x0
    cmp r5, #0x0
    ble .L_b8
    mov r2, r5, lsl #0x10
    ldr ip, _LIT0
    add r0, sp, #0x4
    mov r1, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    str ip, [sp]
    bl func_02005994
.L_b8:
    cmp r0, r5
    blt .L_dc
    add r0, r9, #0x6000
    ldr r0, [r0, #0x294]
    cmp r0, #0x0
    bne .L_19c
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_dc:
    add r1, r9, #0x6000
    ldr r1, [r1, #0x294]
    add ip, r4, r0, lsl #0x2
    cmp r1, #0x0
    bne .L_104
    ldrb r1, [ip, #0x2]
    subs r1, r1, r6
    addmi sp, sp, #0x8
    movmi r0, #0x0
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_104:
    ldrb r3, [ip, #0x2]
    sub r1, r3, r6
    cmp r1, #0x0
    bgt .L_180
    add r1, r9, #0x6a
    add r2, r1, #0x8100
    mov lr, sl, lsl #0x1
    ldrh r1, [r2, lr]
    cmp sl, #0x0
    sub r1, r1, r3
    strh r1, [r2, lr]
    addeq r1, r9, #0x6000
    ldreq r1, [r1, #0x298]
    cmpeq r1, #0x0
    moveq r0, #0x0
    streqb r0, [ip, #0x2]
    beq .L_19c
    add r2, r0, #0x1
    cmp r2, r5
    bge .L_16c
.L_154:
    ldr r1, [r4, r2, lsl #0x2]
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #-4]
    cmp r2, r5
    blt .L_154
.L_16c:
    add r0, r9, sl, lsl #0x1
    sub r1, r5, #0x1
    add r0, r0, #0x8100
    strh r1, [r0, #0x60]
    b .L_19c
.L_180:
    add r0, r9, #0x6a
    strb r1, [ip, #0x2]
    add r2, r0, #0x8100
    mov r1, sl, lsl #0x1
    ldrh r0, [r2, r1]
    sub r0, r0, r6
    strh r0, [r2, r1]
.L_19c:
    cmp r8, #0x4
    addls pc, pc, r8, lsl #0x2
    b .L_39c
    b .L_1bc
    b .L_1c8
    b .L_1d4
    b .L_1e0
    b .L_1ec
.L_1bc:
    add r0, r9, #0x2a0
    add r4, r0, #0x6000
    b .L_1f4
.L_1c8:
    add r0, r9, #0xa60
    add r4, r0, #0x7000
    b .L_1f4
.L_1d4:
    add r0, r9, #0xc60
    add r4, r0, #0x7000
    b .L_1f4
.L_1e0:
    add r0, r9, #0xe60
    add r4, r0, #0x7000
    b .L_1f4
.L_1ec:
    add r0, r9, #0x60
    add r4, r0, #0x8000
.L_1f4:
    add r0, r9, r8, lsl #0x1
    add r0, r0, #0x8100
    ldrh r5, [r0, #0x60]
    mov r0, #0x0
    cmp r5, #0x0
    ble .L_22c
    mov r2, r5, lsl #0x10
    ldr sl, _LIT0
    add r0, sp, #0x4
    mov r1, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    str sl, [sp]
    bl func_02005994
.L_22c:
    cmp r0, r5
    blt .L_348
    cmp r5, #0x0
    bne .L_258
    strh r7, [r4]
    add r0, r9, r8, lsl #0x1
    strb r6, [r4, #0x2]
    add r0, r0, #0x8100
    mov r1, #0x1
    strh r1, [r0, #0x60]
    b .L_32c
.L_258:
    ldr r0, _LIT1
    ldr r0, [r0, #0x28]
    mov r1, r0, lsl #0x2
    ldrh r1, [r4, r1]
    cmp r1, r7
    bge .L_2cc
    sub r2, r5, #0x1
    b .L_27c
.L_278:
    add r0, r0, #0x1
.L_27c:
    cmp r0, r2
    bge .L_298
    add r1, r0, #0x1
    mov r1, r1, lsl #0x2
    ldrh r1, [r4, r1]
    cmp r1, r7
    blt .L_278
.L_298:
    sub sl, r5, #0x1
    add r3, r0, #0x1
    cmp sl, r3
    blt .L_2c0
.L_2a8:
    ldr r2, [r4, sl, lsl #0x2]
    add r1, r4, sl, lsl #0x2
    sub sl, sl, #0x1
    str r2, [r1, #0x4]
    cmp sl, r3
    bge .L_2a8
.L_2c0:
    add r0, r0, #0x1
    b .L_30c
.L_2c8:
    sub r0, r0, #0x1
.L_2cc:
    cmp r0, #0x0
    ble .L_2e8
    sub r1, r0, #0x1
    mov r1, r1, lsl #0x2
    ldrh r1, [r4, r1]
    cmp r1, r7
    bgt .L_2c8
.L_2e8:
    sub r3, r5, #0x1
    cmp r3, r0
    blt .L_30c
.L_2f4:
    ldr r2, [r4, r3, lsl #0x2]
    add r1, r4, r3, lsl #0x2
    sub r3, r3, #0x1
    str r2, [r1, #0x4]
    cmp r3, r0
    bge .L_2f4
.L_30c:
    mov r2, r0, lsl #0x2
    add r1, r9, r8, lsl #0x1
    strh r7, [r4, r2]
    add r0, r4, r0, lsl #0x2
    strb r6, [r0, #0x2]
    add r2, r5, #0x1
    add r0, r1, #0x8100
    strh r2, [r0, #0x60]
.L_32c:
    add r0, r9, #0x6a
    add r2, r0, #0x8100
    mov r1, r8, lsl #0x1
    ldrh r0, [r2, r1]
    add r0, r0, r6
    strh r0, [r2, r1]
    b .L_39c
.L_348:
    add r7, r4, r0, lsl #0x2
    ldrb r5, [r7, #0x2]
    add r0, r9, #0x6a
    add r1, r5, r6
    cmp r1, #0x9
    blt .L_384
    add r4, r0, #0x8100
    mov r3, r8, lsl #0x1
    ldrh r2, [r4, r3]
    rsb r1, r5, #0x9
    mov r0, #0x9
    add r1, r2, r1
    strh r1, [r4, r3]
    strb r0, [r7, #0x2]
    b .L_39c
.L_384:
    strb r1, [r7, #0x2]
    add r2, r0, #0x8100
    mov r1, r8, lsl #0x1
    ldrh r0, [r2, r1]
    add r0, r0, r6
    strh r0, [r2, r1]
.L_39c:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word func_ov006_021b8f00
_LIT1: .word data_02103fcc
