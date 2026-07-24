; func_02083630 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021021b8
        .extern data_021021bc
        .extern data_021021c4
        .extern data_021021e8
        .extern data_021021f4
        .extern data_021a17d8
        .extern data_021a1824
        .extern func_02081fd0
        .extern func_02082010
        .extern func_020820b0
        .extern func_02084d24
        .extern func_02084ef8
        .extern MTX_Copy43To44_
        .extern func_0208b898
        .extern func_0208c0b8
        .extern func_0208c1f8
        .extern func_0208e57c
        .extern func_020943f8
        .global func_02083630
        .arm
func_02083630:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xcc
    mov sl, r0
    ldr r2, [sl, #0x8]
    mov r9, r1
    ands r0, r2, #0x200
    mov r7, #0x2
    ldr r6, _LIT0
    ldr fp, _LIT1
    ldr r5, _LIT2
    beq .L_6d4
    cmp r9, #0x40
    beq .L_6a8
    cmp r9, #0x60
    bne .L_6ac
.L_6a8:
    add r7, r7, #0x1
.L_6ac:
    cmp r9, #0x20
    beq .L_6bc
    cmp r9, #0x60
    bne .L_6c0
.L_6bc:
    add r7, r7, #0x1
.L_6c0:
    ldr r0, [sl]
    add sp, sp, #0xcc
    add r0, r0, r7
    str r0, [sl]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6d4:
    cmp r9, #0x40
    beq .L_6e4
    cmp r9, #0x60
    bne .L_71c
.L_6e4:
    add r7, r7, #0x1
    ands r0, r2, #0x100
    bne .L_71c
    cmp r9, #0x40
    ldreq r0, [sl]
    add r1, sp, #0x0
    ldreqb r0, [r0, #0x2]
    mov r2, #0x1
    streq r0, [sp]
    ldrne r0, [sl]
    ldrneb r0, [r0, #0x3]
    strne r0, [sp]
    mov r0, #0x14
    bl func_02084d24
.L_71c:
    ldr r0, [sl, #0x2c]
    cmp r0, #0x0
    ldrneb r8, [sl, #0x94]
    moveq r8, #0x0
    cmp r8, #0x1
    bne .L_768
    ldr r1, [sl, #0x8]
    mov r0, sl
    bic r1, r1, #0x40
    str r1, [sl, #0x8]
    ldr r1, [sl, #0x2c]
    blx r1
    ldr r0, [sl, #0x2c]
    cmp r0, #0x0
    ldrneb r8, [sl, #0x94]
    ldr r0, [sl, #0x8]
    moveq r8, #0x0
    and r1, r0, #0x40
    b .L_76c
.L_768:
    mov r1, #0x0
.L_76c:
    ldr r0, [sl, #0x8]
    ands r0, r0, #0x100
    bne .L_94c
    cmp r1, #0x0
    bne .L_94c
    bl func_02084ef8
    ldr r2, _LIT3
    ldr r1, _LIT4
    mov r0, #0x0
    str r2, [r1]
    str r0, [r1]
    str r0, [r1]
    add r4, sp, #0x8
.L_7a0:
    mov r0, r4
    bl func_0208e57c
    cmp r0, #0x0
    bne .L_7a0
    ldr r0, _LIT5
    ldr r1, [r0, #0xfc]
    ands r0, r1, #0x1
    beq .L_7e0
    bl func_02082010
    add r1, sp, #0x48
    bl MTX_Copy43To44_
    add r0, sp, #0x8
    add r1, sp, #0x48
    mov r2, r0
    bl func_0208b898
    b .L_804
.L_7e0:
    ands r0, r1, #0x2
    beq .L_804
    ldr r0, _LIT6
    add r1, sp, #0x88
    bl MTX_Copy43To44_
    add r0, sp, #0x8
    add r1, sp, #0x88
    mov r2, r0
    bl func_0208b898
.L_804:
    ldr r1, [sp, #0x38]
    add r0, sp, #0x8
    str r1, [r6]
    ldr r1, [sp, #0x3c]
    str r1, [r6, #0x4]
    ldr r1, [sp, #0x40]
    str r1, [r6, #0x8]
    bl func_0208c1f8
    str r0, [fp]
    add r0, sp, #0x18
    bl func_0208c1f8
    str r0, [fp, #0x4]
    add r0, sp, #0x28
    bl func_0208c1f8
    str r0, [fp, #0x8]
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bne .L_858
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_87c
.L_858:
    add r0, sp, #0x18
    add r1, r5, #0xc
    bl func_0208c0b8
    ldr r0, [r5, #0x14]
    rsb r0, r0, #0x0
    str r0, [r5, #0x1c]
    ldr r0, [r5, #0x10]
    str r0, [r5, #0x20]
    b .L_89c
.L_87c:
    add r0, sp, #0x28
    add r1, r5, #0x18
    bl func_0208c0b8
    ldr r0, [r5, #0x1c]
    rsb r0, r0, #0x0
    str r0, [r5, #0x14]
    ldr r0, [r5, #0x20]
    str r0, [r5, #0x10]
.L_89c:
    ldr r0, _LIT5
    ldr r1, [r0, #0xfc]
    ands r0, r1, #0x1
    beq .L_8f0
    ldr r3, _LIT7
    ldr r1, _LIT4
    ldr r0, _LIT8
    mov r2, #0x8
    str r3, [r1]
    bl func_020943f8
    bl func_02081fd0
    ldr r1, _LIT4
    mov r2, #0x30
    bl func_020943f8
    ldr r2, _LIT9
    ldr r1, _LIT4
    ldr r0, _LIT2
    str r2, [r1]
    mov r2, #0x3c
    bl func_020943f8
    b .L_94c
.L_8f0:
    ands r0, r1, #0x2
    beq .L_93c
    ldr r3, _LIT7
    ldr r1, _LIT4
    ldr r0, _LIT8
    mov r2, #0x8
    str r3, [r1]
    bl func_020943f8
    bl func_020820b0
    ldr r1, _LIT4
    mov r2, #0x30
    bl func_020943f8
    ldr r2, _LIT9
    ldr r1, _LIT4
    ldr r0, _LIT2
    str r2, [r1]
    mov r2, #0x3c
    bl func_020943f8
    b .L_94c
.L_93c:
    ldr r0, _LIT10
    ldr r1, _LIT4
    mov r2, #0x48
    bl func_020943f8
.L_94c:
    cmp r8, #0x3
    movne r0, #0x0
    bne .L_978
    ldr r1, [sl, #0x8]
    mov r0, sl
    bic r1, r1, #0x40
    str r1, [sl, #0x8]
    ldr r1, [sl, #0x2c]
    blx r1
    ldr r0, [sl, #0x8]
    and r0, r0, #0x40
.L_978:
    cmp r9, #0x20
    beq .L_988
    cmp r9, #0x60
    bne .L_9bc
.L_988:
    cmp r0, #0x0
    add r7, r7, #0x1
    bne .L_9bc
    ldr r0, [sl, #0x8]
    ands r0, r0, #0x100
    bne .L_9bc
    ldr r0, [sl]
    add r1, sp, #0x4
    ldrb r3, [r0, #0x2]
    mov r0, #0x13
    mov r2, #0x1
    str r3, [sp, #0x4]
    bl func_02084d24
.L_9bc:
    ldr r0, [sl]
    add r0, r0, r7
    str r0, [sl]
    add sp, sp, #0xcc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021021e8
_LIT1: .word data_021021f4
_LIT2: .word data_021021c4
_LIT3: .word 0x00151110
_LIT4: .word 0x04000400
_LIT5: .word data_021a17d8
_LIT6: .word data_021a1824
_LIT7: .word 0x00171012
_LIT8: .word data_021021bc
_LIT9: .word 0x00001b19
_LIT10: .word data_021021b8
