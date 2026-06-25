; func_020ac378 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c35e0
        .extern data_020c3660
        .extern func_020b3988
        .global func_020ac378
        .arm
func_020ac378:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r4, [sp, #0x38]
    movs r9, r0
    ldr r0, [sp, #0x34]
    str r4, [sp, #0x38]
    mov r4, #0x0
    str r0, [sp, #0x34]
    ldr r0, [sp, #0x38]
    str r1, [sp]
    str r4, [r0]
    mov r0, r4
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x34]
    mov r1, r4
    str r1, [r0]
    ldr r0, [sp, #0x30]
    str r4, [sp, #0x8]
    mov r8, r2
    mov r7, r3
    mov r5, r4
    mov sl, r4
    str r0, [sp, #0x30]
    mov r4, #0x1
    bmi .L_80
    cmp r9, #0x1
    beq .L_80
    cmp r9, #0x24
    bgt .L_80
    ldr r0, [sp]
    cmp r0, #0x1
    bge .L_88
.L_80:
    mov r4, #0x40
    b .L_a4
.L_88:
    ldr r1, [sp, #0x8]
    mov r0, r7
    mov r3, r1
    mov r2, r1
    add r5, r3, #0x1
    blx r8
    mov r6, r0
.L_a4:
    cmp r9, #0x0
    beq .L_bc
    mov r1, r9
    mvn r0, #0x0
    bl func_020b3988
    str r0, [sp, #0x4]
.L_bc:
    mvn fp, #0x0
    b .L_37c
.L_c4:
    cmp r4, #0x8
    bgt .L_fc
    cmp r4, #0x0
    addge pc, pc, r4, lsl #0x2
    b .L_37c
    b .L_37c
    b .L_108
    b .L_1b4
    b .L_37c
    b .L_1f0
    b .L_37c
    b .L_37c
    b .L_37c
    b .L_230
.L_fc:
    cmp r4, #0x10
    beq .L_230
    b .L_37c
.L_108:
    cmp r6, #0x0
    blt .L_118
    cmp r6, #0x80
    blt .L_120
.L_118:
    mov r0, #0x0
    b .L_130
.L_120:
    ldr r0, _LIT0
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x100
.L_130:
    cmp r0, #0x0
    beq .L_15c
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    blx r8
    mov r6, r0
    ldr r0, [sp, #0x8]
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    b .L_37c
.L_15c:
    cmp r6, #0x2b
    bne .L_180
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    add r5, r5, #0x1
    blx r8
    mov r6, r0
    b .L_1ac
.L_180:
    cmp r6, #0x2d
    bne .L_1ac
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    add r5, r5, #0x1
    blx r8
    mov r6, r0
    ldr r0, [sp, #0x34]
    mov r1, #0x1
    str r1, [r0]
.L_1ac:
    mov r4, #0x2
    b .L_37c
.L_1b4:
    cmp r9, #0x0
    cmpne r9, #0x10
    bne .L_1e8
    cmp r6, #0x30
    bne .L_1e8
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    mov r4, #0x4
    add r5, r5, #0x1
    blx r8
    mov r6, r0
    b .L_37c
.L_1e8:
    mov r4, #0x8
    b .L_37c
.L_1f0:
    cmp r6, #0x58
    cmpne r6, #0x78
    bne .L_220
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    mov r9, #0x10
    mov r4, #0x8
    add r5, r5, #0x1
    blx r8
    mov r6, r0
    b .L_37c
.L_220:
    cmp r9, #0x0
    moveq r9, #0x8
    mov r4, #0x10
    b .L_37c
.L_230:
    ldr r0, [sp, #0x4]
    cmp r9, #0x0
    moveq r9, #0xa
    cmp r0, #0x0
    bne .L_254
    mov r0, fp
    mov r1, r9
    bl func_020b3988
    str r0, [sp, #0x4]
.L_254:
    cmp r6, #0x0
    blt .L_264
    cmp r6, #0x80
    blt .L_26c
.L_264:
    mov r0, #0x0
    b .L_27c
.L_26c:
    ldr r0, _LIT0
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x8
.L_27c:
    cmp r0, #0x0
    beq .L_2a4
    sub r6, r6, #0x30
    cmp r6, r9
    blt .L_32c
    cmp r4, #0x10
    moveq r4, #0x20
    movne r4, #0x40
    add r6, r6, #0x30
    b .L_37c
.L_2a4:
    cmp r6, #0x0
    blt .L_2b4
    cmp r6, #0x80
    blt .L_2bc
.L_2b4:
    mov r0, #0x0
    b .L_2cc
.L_2bc:
    ldr r0, _LIT0
    mov r1, r6, lsl #0x1
    ldrh r0, [r0, r1]
    and r0, r0, #0x1
.L_2cc:
    cmp r0, #0x0
    beq .L_300
    cmp r6, #0x0
    blt .L_2e4
    cmp r6, #0x80
    blt .L_2ec
.L_2e4:
    mov r0, r6
    b .L_2f4
.L_2ec:
    ldr r0, _LIT1
    ldrb r0, [r0, r6]
.L_2f4:
    sub r0, r0, #0x37
    cmp r0, r9
    blt .L_310
.L_300:
    cmp r4, #0x10
    moveq r4, #0x20
    movne r4, #0x40
    b .L_37c
.L_310:
    cmp r6, #0x0
    blt .L_328
    cmp r6, #0x80
    bge .L_328
    ldr r0, _LIT1
    ldrb r6, [r0, r6]
.L_328:
    sub r6, r6, #0x37
.L_32c:
    ldr r0, [sp, #0x4]
    mov r4, #0x10
    cmp sl, r0
    ldrhi r0, [sp, #0x38]
    movhi r1, #0x1
    strhi r1, [r0]
    mul r0, sl, r9
    mov sl, r0
    sub r0, fp, r0
    cmp r6, r0
    ldrhi r0, [sp, #0x38]
    movhi r1, #0x1
    strhi r1, [r0]
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    add sl, sl, r6
    add r5, r5, #0x1
    blx r8
    mov r6, r0
.L_37c:
    ldr r0, [sp]
    cmp r5, r0
    bgt .L_398
    cmp r6, fp
    beq .L_398
    tst r4, #0x60
    beq .L_c4
.L_398:
    tst r4, #0x34
    bne .L_3b0
    ldr r0, [sp, #0x30]
    mov sl, #0x0
    str sl, [r0]
    b .L_3c4
.L_3b0:
    ldr r0, [sp, #0x8]
    sub r1, r5, #0x1
    add r1, r1, r0
    ldr r0, [sp, #0x30]
    str r1, [r0]
.L_3c4:
    mov r0, r7
    mov r1, r6
    mov r2, #0x1
    blx r8
    mov r0, sl
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c3660
_LIT1: .word data_020c35e0
