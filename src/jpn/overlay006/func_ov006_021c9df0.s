; func_ov006_021c9df0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02104e6c
        .extern data_ov006_021ceae4
        .extern func_020060f4
        .extern func_02006148
        .extern func_02006160
        .extern func_02006178
        .extern func_020371b8
        .extern func_ov006_021ca958
        .extern func_ov006_021caa60
        .global func_ov006_021c9df0
        .arm
func_ov006_021c9df0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, _LIT0
    ldr r1, [r6]
    ldrh r4, [r0, #0x54]
    cmp r1, #0x0
    ldrh r5, [r0, #0x56]
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    mvn r1, #0x0
    str r1, [r6, #0x88]
    ldr r0, _LIT1
    ldr r1, [r6, #0x4c]
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r2, _LIT2
    mov r0, #0x14
    ldrne r2, _LIT3
    mla r2, r1, r0, r2
    ldrsh r0, [r2, #0x4]
    cmp r0, #0x0
    ble .L_bc
    ldr r0, [r6, #0x54]
    add r1, r0, #0x1
    str r1, [r6, #0x54]
    ldrsh r0, [r2, #0x4]
    cmp r1, r0
    blt .L_bc
    ldrsh r0, [r2]
    cmp r0, #0x0
    beq .L_a8
    mov r0, #0x91
    sub r1, r0, #0x92
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_a8:
    mvn r0, #0x0
    str r0, [r6, #0x48]
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_bc:
    bl func_02006178
    cmp r0, #0x0
    bne .L_d4
    bl func_02006160
    cmp r0, #0x0
    beq .L_1d0
.L_d4:
    add r0, sp, #0xc
    add r1, sp, #0x8
    bl func_020060f4
    ldr r1, [sp, #0xc]
    ldr r2, [sp, #0x8]
    add r3, sp, #0x0
    mov r0, r6
    bl func_ov006_021caa60
    bl func_02006148
    cmp r0, #0x0
    beq .L_114
    ldr r0, [sp]
    str r0, [r6, #0x80]
    ldr r0, [sp, #0x4]
    str r0, [r6, #0x84]
    b .L_178
.L_114:
    bl func_02006160
    cmp r0, #0x0
    beq .L_178
    ldr r3, [sp]
    ldr r0, [r6, #0x80]
    mov r2, #0x0
    cmp r3, r0
    ldreq r1, [sp, #0x4]
    ldreq r0, [r6, #0x84]
    cmpeq r1, r0
    moveq r2, #0x1
    cmp r2, #0x0
    beq .L_178
    cmp r3, #0x1
    bne .L_178
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [sp, #0x4]
    add sp, sp, #0x10
    mov r0, #0x1
    str r1, [r6, #0x48]
    ldmia sp!, {r4, r5, r6, pc}
.L_178:
    ldr r0, [sp]
    cmp r0, #0x1
    bne .L_19c
    ldr r1, [sp, #0x4]
    mov r0, #0x0
    str r1, [r6, #0x68]
    str r0, [r6, #0x6c]
    ldr r0, [sp, #0x4]
    str r0, [r6, #0x88]
.L_19c:
    ldr r1, [r6, #0x68]
    ldr r0, [r6, #0x70]
    cmp r1, r0
    ldreq r1, [r6, #0x6c]
    ldreq r0, [r6, #0x74]
    cmpeq r1, r0
    beq .L_334
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_334
.L_1d0:
    tst r4, #0x1
    beq .L_200
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r6, #0x68]
    add sp, sp, #0x10
    mov r0, #0x1
    str r1, [r6, #0x48]
    ldmia sp!, {r4, r5, r6, pc}
.L_200:
    tst r4, #0x2
    beq .L_230
    mov r0, #0x91
    sub r1, r0, #0x92
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mvn r0, #0x0
    str r0, [r6, #0x48]
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_230:
    tst r5, #0xf0
    beq .L_334
    tst r5, #0x40
    beq .L_26c
    ldr r0, [r6, #0x64]
    cmp r0, #0x0
    ble .L_26c
    ldr r0, [r6, #0x6c]
    subs r0, r0, #0x1
    str r0, [r6, #0x6c]
    bpl .L_304
    ldr r0, [r6, #0x64]
    sub r0, r0, #0x1
    str r0, [r6, #0x6c]
    b .L_304
.L_26c:
    tst r5, #0x80
    beq .L_2a0
    ldr r0, [r6, #0x64]
    cmp r0, #0x0
    ble .L_2a0
    ldr r0, [r6, #0x6c]
    add r1, r0, #0x1
    str r1, [r6, #0x6c]
    ldr r0, [r6, #0x64]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r6, #0x6c]
    b .L_304
.L_2a0:
    tst r5, #0x20
    beq .L_2d4
    ldr r0, [r6, #0x60]
    cmp r0, #0x0
    ble .L_2d4
    ldr r0, [r6, #0x68]
    subs r0, r0, #0x1
    str r0, [r6, #0x68]
    bpl .L_304
    ldr r0, [r6, #0x60]
    sub r0, r0, #0x1
    str r0, [r6, #0x68]
    b .L_304
.L_2d4:
    tst r5, #0x10
    beq .L_304
    ldr r0, [r6, #0x60]
    cmp r0, #0x0
    ble .L_304
    ldr r0, [r6, #0x68]
    add r1, r0, #0x1
    str r1, [r6, #0x68]
    ldr r0, [r6, #0x60]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r6, #0x68]
.L_304:
    ldr r1, [r6, #0x68]
    ldr r0, [r6, #0x70]
    cmp r1, r0
    ldreq r1, [r6, #0x6c]
    ldreq r0, [r6, #0x74]
    cmpeq r1, r0
    beq .L_334
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_334:
    ldr r1, [r6, #0x68]
    mov r0, r6
    str r1, [r6, #0x70]
    ldr r1, [r6, #0x6c]
    str r1, [r6, #0x74]
    bl func_ov006_021ca958
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104acc
_LIT1: .word data_02104e6c
_LIT2: .word data_ov006_021ceae4+0x6
_LIT3: .word data_ov006_021ceae4+0x24a
