; func_02069ec4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101db0
        .extern data_02101dc0
        .extern data_0219eccc
        .extern func_0205407c
        .extern func_02054140
        .extern func_020541b8
        .extern func_02067870
        .extern func_0206a314
        .extern func_0206a31c
        .extern func_0206a984
        .extern func_0206b44c
        .extern func_0206b4fc
        .extern func_020a6d54
        .extern func_020a7388
        .global func_02069ec4
        .arm
func_02069ec4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r8, r0
    ldr r1, [r8, #0x5c8]
    ldr r7, [r8, #0x7c]
    ldr r6, [r8, #0x80]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_132c
    b .L_f84
    b .L_fe4
    b .L_10f4
    b .L_11e8
    b .L_129c
.L_f84:
    cmp r6, #0x1
    blt .L_132c
    ldrb r1, [r7]
    eor r1, r1, #0xec
    add r3, r1, #0x2
    cmp r6, r3
    blt .L_132c
    sub r1, r3, #0x1
    ldrb r1, [r7, r1]
    eor r2, r1, #0xea
    add r4, r3, r2
    cmp r6, r4
    blt .L_132c
    add r1, r7, r3
    bl func_0206a984
    ldr r0, _LIT0
    add r7, r7, r4
    sub r6, r6, r4
    mov r3, #0x1
    mov r1, r7
    mov r2, r6
    add r0, r8, r0
    str r3, [r8, #0x5c8]
    bl func_02067870
.L_fe4:
    cmp r6, #0x6
    blt .L_132c
    ldrb r1, [r7]
    ldrb r0, [r7, #0x1]
    add r5, r8, #0x4a0
    ldr r2, _LIT1
    strb r1, [r8, #0x4a0]
    strb r0, [r5, #0x1]
    ldrb r4, [r7, #0x2]
    ldrb r3, [r7, #0x3]
    mov r0, r8
    mov r1, #0x6
    strb r4, [r5, #0x2]
    strb r3, [r5, #0x3]
    ldr r2, [r2]
    ldr r3, [r8, #0x494]
    ldr r4, [r8, #0x488]
    blx r4
    add r1, r7, #0x4
    ldr r0, _LIT2
    ldrb r2, [r7, #0x4]
    ldrb r1, [r1, #0x1]
    add r3, r8, r0
    add r0, r8, #0x400
    strb r2, [r8, #0x4a8]
    strb r1, [r3, #0x1]
    ldrh r1, [r0, #0xa8]
    ldr r0, _LIT3
    cmp r1, r0
    bne .L_10a8
    add r0, r7, #0x6
    sub r1, r6, #0x6
    bl func_0206b44c
    mvn r1, #0x0
    cmp r0, r1
    beq .L_132c
    mov r0, r8
    add r1, r7, #0x6
    bl func_0206a314
    ldr r0, _LIT1
    ldr r3, [r8, #0x494]
    ldr r2, [r0]
    ldr r4, [r8, #0x488]
    mov r0, r8
    mov r1, #0x5
    blx r4
    ldr r0, [r8, #0x7c]
    cmp r0, #0x0
    beq .L_132c
.L_10a8:
    ldr r0, [r8, #0x5c4]
    add r7, r7, #0x6
    sub r6, r6, #0x6
    ands r0, r0, #0x2
    bne .L_10d0
    add r0, r8, #0x400
    ldrh r1, [r0, #0xa8]
    ldr r0, _LIT3
    cmp r1, r0
    bne .L_10e4
.L_10d0:
    mov r0, #0x5
    str r0, [r8, #0x5c8]
    mov r0, #0x2
    str r0, [r8]
    b .L_132c
.L_10e4:
    mov r0, #0x2
    str r0, [r8, #0x5c8]
    mvn r0, #0x0
    str r0, [r8, #0x484]
.L_10f4:
    ldr r1, [r8, #0x484]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_1144
    cmp r6, #0x1
    blt .L_132c
    ldrb r1, [r7]
    mov r0, #0x8
    mov r2, #0x0
    str r1, [r8, #0x484]
    ldr r1, [r8, #0x484]
    bl func_020541b8
    str r0, [r8, #0x8]
    ldr r0, [r8, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r7, r7, #0x1
    sub r6, r6, #0x1
.L_1144:
    ldr r0, [r8, #0x8]
    bl func_02054140
    ldr r1, [r8, #0x484]
    cmp r1, r0
    ble .L_11c4
    add r5, sp, #0x0
    mvn r4, #0x0
.L_1160:
    cmp r6, #0x2
    blt .L_11c4
    add r0, r7, #0x1
    sub r1, r6, #0x1
    bl func_0206b44c
    mov r9, r0
    cmp r9, r4
    beq .L_11c4
    ldrb r2, [r7]
    mov r0, r8
    add r1, r7, #0x1
    str r2, [sp, #0x4]
    bl func_0206b4fc
    str r0, [sp]
    ldr r0, [r8, #0x8]
    mov r1, r5
    bl func_0205407c
    add r1, r9, #0x1
    ldr r0, [r8, #0x8]
    add r7, r7, r1
    sub r6, r6, r1
    bl func_02054140
    ldr r1, [r8, #0x484]
    cmp r1, r0
    bgt .L_1160
.L_11c4:
    ldr r0, [r8, #0x8]
    bl func_02054140
    ldr r1, [r8, #0x484]
    cmp r1, r0
    bgt .L_132c
    mov r0, #0x3
    str r0, [r8, #0x5c8]
    mvn r0, #0x0
    str r0, [r8, #0x484]
.L_11e8:
    ldr r1, [r8, #0x484]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_1218
    cmp r6, #0x1
    blt .L_132c
    ldrb r1, [r7]
    mov r0, #0x0
    add r7, r7, #0x1
    str r1, [r8, #0x484]
    str r0, [r8, #0x480]
    sub r6, r6, #0x1
.L_1218:
    ldr r1, [r8, #0x484]
    ldr r0, [r8, #0x480]
    cmp r1, r0
    ble .L_1284
    add r4, r8, #0x480
    mvn r9, #0x0
.L_1230:
    mov r0, r7
    mov r1, r6
    bl func_0206b44c
    mov r5, r0
    cmp r5, r9
    beq .L_1284
    mov r0, r8
    mov r1, r7
    bl func_0206b4fc
    ldr r1, [r4]
    ldr r2, [r8, #0x480]
    add r1, r1, #0x1
    str r1, [r4]
    add r1, r8, r2, lsl #0x2
    str r0, [r1, #0x84]
    ldr r1, [r8, #0x484]
    ldr r0, [r8, #0x480]
    add r7, r7, r5
    cmp r1, r0
    sub r6, r6, r5
    bgt .L_1230
.L_1284:
    ldr r1, [r8, #0x484]
    ldr r0, [r8, #0x480]
    cmp r1, r0
    bgt .L_132c
    mov r0, #0x4
    str r0, [r8, #0x5c8]
.L_129c:
    cmp r6, #0x5
    blt .L_132c
    mov r9, #0x0
    mvn r4, #0x0
    mvn r5, #0x1
.L_12b0:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_0206a31c
    cmp r0, r5
    addeq sp, sp, #0xc
    moveq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    cmp r0, r4
    bne .L_1310
    mov r0, #0x5
    str r0, [r8, #0x5c8]
    mov r0, #0x2
    str r0, [r8]
    ldr r0, _LIT1
    ldr r3, [r8, #0x494]
    ldr r2, [r0]
    ldr r4, [r8, #0x488]
    mov r0, r8
    mov r1, #0x3
    sub r6, r6, #0x5
    add r7, r7, #0x5
    blx r4
    b .L_132c
.L_1310:
    ldr r1, [r8, #0x7c]
    add r7, r7, r0
    cmp r1, #0x0
    sub r6, r6, r0
    moveq r0, r9
    cmp r0, #0x0
    bne .L_12b0
.L_132c:
    cmp r6, #0x0
    bge .L_1348
    ldr r0, _LIT4
    ldr r1, _LIT5
    ldr r3, _LIT6
    mov r2, #0x0
    bl func_020a6d54
.L_1348:
    ldr r0, [r8, #0x7c]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    cmp r6, #0x0
    beq .L_1370
    mov r1, r7
    mov r2, r6
    bl func_020a7388
.L_1370:
    str r6, [r8, #0x80]
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x000004bc
_LIT1: .word data_0219eccc
_LIT2: .word 0x000004a8
_LIT3: .word 0x0000ffff
_LIT4: .word data_02101dc0
_LIT5: .word data_02101db0
_LIT6: .word 0x000004af
