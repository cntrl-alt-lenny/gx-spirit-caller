; func_02083aa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102250
        .extern data_02102254
        .extern data_0210225c
        .extern data_02102280
        .extern data_0210228c
        .extern data_021a18b8
        .extern data_021a1904
        .extern func_020820b8
        .extern func_020820f8
        .extern func_02082198
        .extern func_02084e0c
        .extern func_02084fe0
        .extern MTX_Copy43To44_
        .extern func_0208b980
        .extern func_0208c2e0
        .extern func_0208e664
        .extern func_020944ec
        .global func_02083aa8
        .arm
func_02083aa8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc8
    mov r9, r0
    ldr r2, [r9, #0x8]
    mov r8, r1
    ands r0, r2, #0x200
    mov r6, #0x2
    ldr r5, _LIT0
    ldr r4, _LIT1
    beq .L_1258
    cmp r8, #0x40
    beq .L_122c
    cmp r8, #0x60
    bne .L_1230
.L_122c:
    add r6, r6, #0x1
.L_1230:
    cmp r8, #0x20
    beq .L_1240
    cmp r8, #0x60
    bne .L_1244
.L_1240:
    add r6, r6, #0x1
.L_1244:
    ldr r0, [r9]
    add sp, sp, #0xc8
    add r0, r0, r6
    str r0, [r9]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1258:
    cmp r8, #0x40
    beq .L_1268
    cmp r8, #0x60
    bne .L_12a0
.L_1268:
    add r6, r6, #0x1
    ands r0, r2, #0x100
    bne .L_12a0
    cmp r8, #0x40
    ldreq r0, [r9]
    add r1, sp, #0x0
    ldreqb r0, [r0, #0x2]
    mov r2, #0x1
    streq r0, [sp]
    ldrne r0, [r9]
    ldrneb r0, [r0, #0x3]
    strne r0, [sp]
    mov r0, #0x14
    bl func_02084e0c
.L_12a0:
    ldr r0, [r9, #0x28]
    cmp r0, #0x0
    ldrneb r7, [r9, #0x93]
    moveq r7, #0x0
    cmp r7, #0x1
    bne .L_12ec
    ldr r1, [r9, #0x8]
    mov r0, r9
    bic r1, r1, #0x40
    str r1, [r9, #0x8]
    ldr r1, [r9, #0x28]
    blx r1
    ldr r0, [r9, #0x28]
    cmp r0, #0x0
    ldrneb r7, [r9, #0x93]
    ldr r0, [r9, #0x8]
    moveq r7, #0x0
    and r1, r0, #0x40
    b .L_12f0
.L_12ec:
    mov r1, #0x0
.L_12f0:
    ldr r0, [r9, #0x8]
    ands r0, r0, #0x100
    bne .L_1474
    cmp r1, #0x0
    bne .L_1474
    bl func_02084fe0
    ldr r2, _LIT2
    ldr r1, _LIT3
    mov r0, #0x0
    str r2, [r1]
    str r0, [r1]
    str r0, [r1]
    add sl, sp, #0x8
.L_1324:
    mov r0, sl
    bl func_0208e664
    cmp r0, #0x0
    bne .L_1324
    ldr r0, _LIT4
    ldr r1, [r0, #0xfc]
    ands r0, r1, #0x1
    beq .L_1364
    bl func_020820f8
    add r1, sp, #0x48
    bl MTX_Copy43To44_
    add r0, sp, #0x8
    add r1, sp, #0x48
    mov r2, r0
    bl func_0208b980
    b .L_1388
.L_1364:
    ands r0, r1, #0x2
    beq .L_1388
    ldr r0, _LIT5
    add r1, sp, #0x88
    bl MTX_Copy43To44_
    add r0, sp, #0x8
    add r1, sp, #0x88
    mov r2, r0
    bl func_0208b980
.L_1388:
    ldr r1, [sp, #0x38]
    add r0, sp, #0x8
    str r1, [r5]
    ldr r1, [sp, #0x3c]
    str r1, [r5, #0x4]
    ldr r1, [sp, #0x40]
    str r1, [r5, #0x8]
    bl func_0208c2e0
    str r0, [r4]
    add r0, sp, #0x18
    bl func_0208c2e0
    str r0, [r4, #0x4]
    add r0, sp, #0x28
    bl func_0208c2e0
    ldr r1, _LIT4
    str r0, [r4, #0x8]
    ldr r1, [r1, #0xfc]
    ands r0, r1, #0x1
    beq .L_1418
    ldr r3, _LIT6
    ldr r1, _LIT3
    ldr r0, _LIT7
    mov r2, #0x8
    str r3, [r1]
    bl func_020944ec
    bl func_020820b8
    ldr r1, _LIT3
    mov r2, #0x30
    bl func_020944ec
    ldr r2, _LIT8
    ldr r1, _LIT3
    ldr r0, _LIT9
    str r2, [r1]
    mov r2, #0x3c
    bl func_020944ec
    b .L_1474
.L_1418:
    ands r0, r1, #0x2
    beq .L_1464
    ldr r3, _LIT6
    ldr r1, _LIT3
    ldr r0, _LIT7
    mov r2, #0x8
    str r3, [r1]
    bl func_020944ec
    bl func_02082198
    ldr r1, _LIT3
    mov r2, #0x30
    bl func_020944ec
    ldr r2, _LIT8
    ldr r1, _LIT3
    ldr r0, _LIT9
    str r2, [r1]
    mov r2, #0x3c
    bl func_020944ec
    b .L_1474
.L_1464:
    ldr r0, _LIT10
    ldr r1, _LIT3
    mov r2, #0x48
    bl func_020944ec
.L_1474:
    cmp r7, #0x3
    movne r0, #0x0
    bne .L_14a0
    ldr r1, [r9, #0x8]
    mov r0, r9
    bic r1, r1, #0x40
    str r1, [r9, #0x8]
    ldr r1, [r9, #0x28]
    blx r1
    ldr r0, [r9, #0x8]
    and r0, r0, #0x40
.L_14a0:
    cmp r8, #0x20
    beq .L_14b0
    cmp r8, #0x60
    bne .L_14e4
.L_14b0:
    cmp r0, #0x0
    add r6, r6, #0x1
    bne .L_14e4
    ldr r0, [r9, #0x8]
    ands r0, r0, #0x100
    bne .L_14e4
    ldr r0, [r9]
    add r1, sp, #0x4
    ldrb r3, [r0, #0x2]
    mov r0, #0x13
    mov r2, #0x1
    str r3, [sp, #0x4]
    bl func_02084e0c
.L_14e4:
    ldr r0, [r9]
    add r0, r0, r6
    str r0, [r9]
    add sp, sp, #0xc8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02102280
_LIT1: .word data_0210228c
_LIT2: .word 0x00151110
_LIT3: .word 0x04000400
_LIT4: .word data_021a18b8
_LIT5: .word data_021a1904
_LIT6: .word 0x00171012
_LIT7: .word data_02102254
_LIT8: .word 0x00001b19
_LIT9: .word data_0210225c
_LIT10: .word data_02102250
