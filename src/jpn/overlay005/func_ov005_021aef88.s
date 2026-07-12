; func_ov005_021aef88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern func_020371b8
        .extern func_ov005_021aee6c
        .global func_ov005_021aef88
        .arm
func_ov005_021aef88:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r2, _LIT0
    mov r1, #0x0
    ldr r2, [r2, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1d
    bne .L_250
    ldrh r8, [r0, #0x28]
    cmp r8, #0x0
    beq .L_1bc
    ldr r3, [r0, #0x8]
    mov r6, #0x1
    mov r4, r6, lsl r3
    and ip, r4, #0x19
    mov r2, r8, lsl #0x1
    mov r4, #0xc
    mov r5, #0xa
    mov lr, r1
    b .L_184
.L_168:
    add r7, r0, r2
    ldrsb r7, [r7, #0x48]
    cmp r7, #0x0
    movne r1, #0x1
    bne .L_1ac
    add r2, r2, #0x2
    add r8, r8, #0x1
.L_184:
    mov r7, lr
    cmp r3, #0x4
    bhi .L_198
    cmp ip, #0x0
    movne r7, r6
.L_198:
    cmp r7, #0x0
    movne r7, r5
    moveq r7, r4
    cmp r8, r7
    blt .L_168
.L_1ac:
    cmp r1, #0x0
    ldreqh r1, [r0, #0x28]
    subeq r1, r1, #0x1
    streqh r1, [r0, #0x28]
.L_1bc:
    ldrh r1, [r0, #0x28]
    mov r2, #0x0
    mov r4, #0x1
    add r1, r0, r1, lsl #0x1
    strb r2, [r1, #0x48]
    ldrh r1, [r0, #0x28]
    mov r3, #0xa
    mov ip, #0x0
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1
    add r1, r0, r1
    strb r2, [r1, #0x48]
    ldrh r7, [r0, #0x28]
    mov r2, #0xc
    mov r1, r7, lsl #0x1
    b .L_21c
.L_1fc:
    add r7, r7, #0x1
    add r6, r0, r7, lsl #0x1
    ldrsb r5, [r6, #0x48]
    add lr, r0, r1
    add r1, r1, #0x2
    strb r5, [lr, #0x48]
    ldrsb r5, [r6, #0x49]
    strb r5, [lr, #0x49]
.L_21c:
    ldr r5, [r0, #0x8]
    mov r6, ip
    cmp r5, #0x4
    bhi .L_238
    mov r5, r4, lsl r5
    tst r5, #0x19
    movne r6, r4
.L_238:
    cmp r6, #0x0
    movne r5, r3
    moveq r5, r2
    cmp r7, r5
    blt .L_1fc
    b .L_348
.L_250:
    ldrh r6, [r0, #0x28]
    cmp r6, #0x0
    beq .L_2cc
    ldr r7, [r0, #0x8]
    mov r4, #0x1
    mov r2, r4, lsl r7
    and ip, r2, #0x19
    mov r2, #0xc
    mov r3, #0xa
    mov lr, r1
    b .L_294
.L_27c:
    add r5, r0, r6
    ldrsb r5, [r5, #0x48]
    cmp r5, #0x0
    movne r1, #0x1
    bne .L_2bc
    add r6, r6, #0x1
.L_294:
    mov r5, lr
    cmp r7, #0x4
    bhi .L_2a8
    cmp ip, #0x0
    movne r5, r4
.L_2a8:
    cmp r5, #0x0
    movne r5, r3
    moveq r5, r2
    cmp r6, r5, lsl #0x1
    blt .L_27c
.L_2bc:
    cmp r1, #0x0
    ldreqh r1, [r0, #0x28]
    subeq r1, r1, #0x1
    streqh r1, [r0, #0x28]
.L_2cc:
    ldrh r1, [r0, #0x28]
    mov r2, #0x0
    mov r3, #0x1
    add r1, r0, r1
    strb r2, [r1, #0x48]
    ldrh r1, [r0, #0x28]
    mov lr, #0x0
    add r1, r0, r1
    strb r2, [r1, #0x68]
    ldrh r5, [r0, #0x28]
    mov r1, #0xc
    mov r2, #0xa
    b .L_318
.L_300:
    add r4, r0, r5
    ldrsb ip, [r4, #0x49]
    add r5, r5, #0x1
    strb ip, [r4, #0x48]
    ldrb ip, [r4, #0x69]
    strb ip, [r4, #0x68]
.L_318:
    ldr ip, [r0, #0x8]
    mov r4, lr
    cmp ip, #0x4
    bhi .L_334
    mov ip, r3, lsl ip
    tst ip, #0x19
    movne r4, r3
.L_334:
    cmp r4, #0x0
    movne r4, r2
    moveq r4, r1
    cmp r5, r4, lsl #0x1
    blt .L_300
.L_348:
    bl func_ov005_021aee6c
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02104e6c
