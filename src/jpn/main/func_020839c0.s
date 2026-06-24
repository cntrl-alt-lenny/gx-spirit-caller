; func_020839c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102170
        .extern data_02102174
        .extern data_0210217c
        .extern data_021021a0
        .extern data_021021ac
        .extern data_021a17d8
        .extern data_021a1824
        .extern func_02081fd0
        .extern func_02082010
        .extern func_020820b0
        .extern func_02084d24
        .extern func_02084ef8
        .extern func_0208b2cc
        .extern func_0208b898
        .extern func_0208c1f8
        .extern func_0208e57c
        .extern func_020943f8
        .global func_020839c0
        .arm
func_020839c0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc8
    mov r9, r0
    ldr r2, [r9, #0x8]
    mov r8, r1
    ands r0, r2, #0x200
    mov r6, #0x2
    ldr r5, _LIT0
    ldr r4, _LIT1
    beq .L_a60
    cmp r8, #0x40
    beq .L_a34
    cmp r8, #0x60
    bne .L_a38
.L_a34:
    add r6, r6, #0x1
.L_a38:
    cmp r8, #0x20
    beq .L_a48
    cmp r8, #0x60
    bne .L_a4c
.L_a48:
    add r6, r6, #0x1
.L_a4c:
    ldr r0, [r9]
    add sp, sp, #0xc8
    add r0, r0, r6
    str r0, [r9]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a60:
    cmp r8, #0x40
    beq .L_a70
    cmp r8, #0x60
    bne .L_aa8
.L_a70:
    add r6, r6, #0x1
    ands r0, r2, #0x100
    bne .L_aa8
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
    bl func_02084d24
.L_aa8:
    ldr r0, [r9, #0x28]
    cmp r0, #0x0
    ldrneb r7, [r9, #0x93]
    moveq r7, #0x0
    cmp r7, #0x1
    bne .L_af4
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
    b .L_af8
.L_af4:
    mov r1, #0x0
.L_af8:
    ldr r0, [r9, #0x8]
    ands r0, r0, #0x100
    bne .L_c7c
    cmp r1, #0x0
    bne .L_c7c
    bl func_02084ef8
    ldr r2, _LIT2
    ldr r1, _LIT3
    mov r0, #0x0
    str r2, [r1]
    str r0, [r1]
    str r0, [r1]
    add sl, sp, #0x8
.L_b2c:
    mov r0, sl
    bl func_0208e57c
    cmp r0, #0x0
    bne .L_b2c
    ldr r0, _LIT4
    ldr r1, [r0, #0xfc]
    ands r0, r1, #0x1
    beq .L_b6c
    bl func_02082010
    add r1, sp, #0x48
    bl func_0208b2cc
    add r0, sp, #0x8
    add r1, sp, #0x48
    mov r2, r0
    bl func_0208b898
    b .L_b90
.L_b6c:
    ands r0, r1, #0x2
    beq .L_b90
    ldr r0, _LIT5
    add r1, sp, #0x88
    bl func_0208b2cc
    add r0, sp, #0x8
    add r1, sp, #0x88
    mov r2, r0
    bl func_0208b898
.L_b90:
    ldr r1, [sp, #0x38]
    add r0, sp, #0x8
    str r1, [r5]
    ldr r1, [sp, #0x3c]
    str r1, [r5, #0x4]
    ldr r1, [sp, #0x40]
    str r1, [r5, #0x8]
    bl func_0208c1f8
    str r0, [r4]
    add r0, sp, #0x18
    bl func_0208c1f8
    str r0, [r4, #0x4]
    add r0, sp, #0x28
    bl func_0208c1f8
    ldr r1, _LIT4
    str r0, [r4, #0x8]
    ldr r1, [r1, #0xfc]
    ands r0, r1, #0x1
    beq .L_c20
    ldr r3, _LIT6
    ldr r1, _LIT3
    ldr r0, _LIT7
    mov r2, #0x8
    str r3, [r1]
    bl func_020943f8
    bl func_02081fd0
    ldr r1, _LIT3
    mov r2, #0x30
    bl func_020943f8
    ldr r2, _LIT8
    ldr r1, _LIT3
    ldr r0, _LIT9
    str r2, [r1]
    mov r2, #0x3c
    bl func_020943f8
    b .L_c7c
.L_c20:
    ands r0, r1, #0x2
    beq .L_c6c
    ldr r3, _LIT6
    ldr r1, _LIT3
    ldr r0, _LIT7
    mov r2, #0x8
    str r3, [r1]
    bl func_020943f8
    bl func_020820b0
    ldr r1, _LIT3
    mov r2, #0x30
    bl func_020943f8
    ldr r2, _LIT8
    ldr r1, _LIT3
    ldr r0, _LIT9
    str r2, [r1]
    mov r2, #0x3c
    bl func_020943f8
    b .L_c7c
.L_c6c:
    ldr r0, _LIT10
    ldr r1, _LIT3
    mov r2, #0x48
    bl func_020943f8
.L_c7c:
    cmp r7, #0x3
    movne r0, #0x0
    bne .L_ca8
    ldr r1, [r9, #0x8]
    mov r0, r9
    bic r1, r1, #0x40
    str r1, [r9, #0x8]
    ldr r1, [r9, #0x28]
    blx r1
    ldr r0, [r9, #0x8]
    and r0, r0, #0x40
.L_ca8:
    cmp r8, #0x20
    beq .L_cb8
    cmp r8, #0x60
    bne .L_cec
.L_cb8:
    cmp r0, #0x0
    add r6, r6, #0x1
    bne .L_cec
    ldr r0, [r9, #0x8]
    ands r0, r0, #0x100
    bne .L_cec
    ldr r0, [r9]
    add r1, sp, #0x4
    ldrb r3, [r0, #0x2]
    mov r0, #0x13
    mov r2, #0x1
    str r3, [sp, #0x4]
    bl func_02084d24
.L_cec:
    ldr r0, [r9]
    add r0, r0, r6
    str r0, [r9]
    add sp, sp, #0xc8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_021021a0
_LIT1: .word data_021021ac
_LIT2: .word 0x00151110
_LIT3: .word 0x04000400
_LIT4: .word data_021a17d8
_LIT5: .word data_021a1824
_LIT6: .word 0x00171012
_LIT7: .word data_02102174
_LIT8: .word 0x00001b19
_LIT9: .word data_0210217c
_LIT10: .word data_02102170
