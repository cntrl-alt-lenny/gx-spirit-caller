; func_02083718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102298
        .extern data_0210229c
        .extern data_021022a4
        .extern data_021022c8
        .extern data_021022d4
        .extern data_021a18b8
        .extern data_021a1904
        .extern func_020820b8
        .extern func_020820f8
        .extern func_02082198
        .extern func_02084e0c
        .extern func_02084fe0
        .extern MTX_Copy43To44_
        .extern func_0208b980
        .extern func_0208c1a0
        .extern func_0208c2e0
        .extern func_0208e664
        .extern func_020944ec
        .global func_02083718
        .arm
func_02083718:
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
    beq .L_ecc
    cmp r9, #0x40
    beq .L_ea0
    cmp r9, #0x60
    bne .L_ea4
.L_ea0:
    add r7, r7, #0x1
.L_ea4:
    cmp r9, #0x20
    beq .L_eb4
    cmp r9, #0x60
    bne .L_eb8
.L_eb4:
    add r7, r7, #0x1
.L_eb8:
    ldr r0, [sl]
    add sp, sp, #0xcc
    add r0, r0, r7
    str r0, [sl]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ecc:
    cmp r9, #0x40
    beq .L_edc
    cmp r9, #0x60
    bne .L_f14
.L_edc:
    add r7, r7, #0x1
    ands r0, r2, #0x100
    bne .L_f14
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
    bl func_02084e0c
.L_f14:
    ldr r0, [sl, #0x2c]
    cmp r0, #0x0
    ldrneb r8, [sl, #0x94]
    moveq r8, #0x0
    cmp r8, #0x1
    bne .L_f60
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
    b .L_f64
.L_f60:
    mov r1, #0x0
.L_f64:
    ldr r0, [sl, #0x8]
    ands r0, r0, #0x100
    bne .L_1144
    cmp r1, #0x0
    bne .L_1144
    bl func_02084fe0
    ldr r2, _LIT3
    ldr r1, _LIT4
    mov r0, #0x0
    str r2, [r1]
    str r0, [r1]
    str r0, [r1]
    add r4, sp, #0x8
.L_f98:
    mov r0, r4
    bl func_0208e664
    cmp r0, #0x0
    bne .L_f98
    ldr r0, _LIT5
    ldr r1, [r0, #0xfc]
    ands r0, r1, #0x1
    beq .L_fd8
    bl func_020820f8
    add r1, sp, #0x48
    bl MTX_Copy43To44_
    add r0, sp, #0x8
    add r1, sp, #0x48
    mov r2, r0
    bl func_0208b980
    b .L_ffc
.L_fd8:
    ands r0, r1, #0x2
    beq .L_ffc
    ldr r0, _LIT6
    add r1, sp, #0x88
    bl MTX_Copy43To44_
    add r0, sp, #0x8
    add r1, sp, #0x88
    mov r2, r0
    bl func_0208b980
.L_ffc:
    ldr r1, [sp, #0x38]
    add r0, sp, #0x8
    str r1, [r6]
    ldr r1, [sp, #0x3c]
    str r1, [r6, #0x4]
    ldr r1, [sp, #0x40]
    str r1, [r6, #0x8]
    bl func_0208c2e0
    str r0, [fp]
    add r0, sp, #0x18
    bl func_0208c2e0
    str r0, [fp, #0x4]
    add r0, sp, #0x28
    bl func_0208c2e0
    str r0, [fp, #0x8]
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bne .L_1050
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1074
.L_1050:
    add r0, sp, #0x18
    add r1, r5, #0xc
    bl func_0208c1a0
    ldr r0, [r5, #0x14]
    rsb r0, r0, #0x0
    str r0, [r5, #0x1c]
    ldr r0, [r5, #0x10]
    str r0, [r5, #0x20]
    b .L_1094
.L_1074:
    add r0, sp, #0x28
    add r1, r5, #0x18
    bl func_0208c1a0
    ldr r0, [r5, #0x1c]
    rsb r0, r0, #0x0
    str r0, [r5, #0x14]
    ldr r0, [r5, #0x20]
    str r0, [r5, #0x10]
.L_1094:
    ldr r0, _LIT5
    ldr r1, [r0, #0xfc]
    ands r0, r1, #0x1
    beq .L_10e8
    ldr r3, _LIT7
    ldr r1, _LIT4
    ldr r0, _LIT8
    mov r2, #0x8
    str r3, [r1]
    bl func_020944ec
    bl func_020820b8
    ldr r1, _LIT4
    mov r2, #0x30
    bl func_020944ec
    ldr r2, _LIT9
    ldr r1, _LIT4
    ldr r0, _LIT2
    str r2, [r1]
    mov r2, #0x3c
    bl func_020944ec
    b .L_1144
.L_10e8:
    ands r0, r1, #0x2
    beq .L_1134
    ldr r3, _LIT7
    ldr r1, _LIT4
    ldr r0, _LIT8
    mov r2, #0x8
    str r3, [r1]
    bl func_020944ec
    bl func_02082198
    ldr r1, _LIT4
    mov r2, #0x30
    bl func_020944ec
    ldr r2, _LIT9
    ldr r1, _LIT4
    ldr r0, _LIT2
    str r2, [r1]
    mov r2, #0x3c
    bl func_020944ec
    b .L_1144
.L_1134:
    ldr r0, _LIT10
    ldr r1, _LIT4
    mov r2, #0x48
    bl func_020944ec
.L_1144:
    cmp r8, #0x3
    movne r0, #0x0
    bne .L_1170
    ldr r1, [sl, #0x8]
    mov r0, sl
    bic r1, r1, #0x40
    str r1, [sl, #0x8]
    ldr r1, [sl, #0x2c]
    blx r1
    ldr r0, [sl, #0x8]
    and r0, r0, #0x40
.L_1170:
    cmp r9, #0x20
    beq .L_1180
    cmp r9, #0x60
    bne .L_11b4
.L_1180:
    cmp r0, #0x0
    add r7, r7, #0x1
    bne .L_11b4
    ldr r0, [sl, #0x8]
    ands r0, r0, #0x100
    bne .L_11b4
    ldr r0, [sl]
    add r1, sp, #0x4
    ldrb r3, [r0, #0x2]
    mov r0, #0x13
    mov r2, #0x1
    str r3, [sp, #0x4]
    bl func_02084e0c
.L_11b4:
    ldr r0, [sl]
    add r0, r0, r7
    str r0, [sl]
    add sp, sp, #0xcc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021022c8
_LIT1: .word data_021022d4
_LIT2: .word data_021022a4
_LIT3: .word 0x00151110
_LIT4: .word 0x04000400
_LIT5: .word data_021a18b8
_LIT6: .word data_021a1904
_LIT7: .word 0x00171012
_LIT8: .word data_0210229c
_LIT9: .word 0x00001b19
_LIT10: .word data_02102298
