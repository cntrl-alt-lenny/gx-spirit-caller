; func_0200da18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4908
        .extern data_0210249c
        .extern data_02186ae8
        .extern func_01ff87c0
        .extern func_0200cf88
        .extern func_0208e420
        .extern func_0208ea74
        .global func_0200da18
        .arm
func_0200da18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    movs sl, r0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x68
    mul r0, r1, r0
    ldr r2, [sl, #0x8]
    adds r0, r2, r0
    str r0, [sp, #0xc]
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [sl, #0x60]
    ldrsb r0, [r0, #0x43]
    mov r2, r2, lsl #0x1b
    movs r2, r2, lsr #0x1f
    beq .L_ae4
    ldr r2, [sl, #0x6c]
    mov r0, #0x1
    tst r2, r0, lsl r1
    moveq r0, #0x0
.L_ae4:
    ldr r2, [sl, #0xa4]
    cmp r2, #0x0
    beq .L_b1c
    ldr r3, [r2, #0x4]
    ldr r2, [sl, #0xa8]
    ldr r3, [r3, r1, lsl #0x2]
    add r2, r2, r1, lsl #0x3
    ldr r1, [r3]
    cmp r1, #0x0
    beq .L_b1c
    ldr r0, [r2, #0x4]
    ldr r1, [r3, #0x8]
    mov r0, r0, lsl #0x16
    ldrb r0, [r1, r0, asr #0x16]
.L_b1c:
    ldr r1, [sp, #0xc]
    ldrsh r1, [r1, #0x44]
    cmp r1, #0x0
    ble .L_d6c
    cmp r0, #0x0
    beq .L_d6c
    ldr r0, [sp, #0xc]
    cmp r1, #0x0
    ldrsh r0, [r0, #0x46]
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    ble .L_d6c
.L_b5c:
    ldr r2, [sl, #0x14]
    ldr r1, [sp]
    mov r0, sl
    ldrsb r1, [r2, r1]
    bl func_0200cf88
    cmp r0, #0x0
    beq .L_d34
    ldr r0, [sl, #0x7c]
    ldr r1, [sl, #0x14]
    mov r0, r0, lsl #0x1
    movs r0, r0, lsr #0x1f
    ldr r0, [sp, #0x8]
    ldrsb r4, [r1, r0]
    beq .L_bf8
    ldr r2, [sl, #0x4]
    ldr r0, _LIT0
    add r1, r2, r4, lsl #0x3
    ldr r1, [r1, #0x4]
    ldrh r0, [r0, #0x4]
    mov r3, r1, lsr #0x2
    cmp r3, #0x0
    ldr r1, [r2, r4, lsl #0x3]
    mov r2, #0x0
    ble .L_bf8
    ldr r7, _LIT1
.L_bc0:
    ldr r5, [r1, r2, lsl #0x2]
    cmp r5, #0x30
    ldrsb r8, [r7, r5]
    bne .L_be8
    add r6, r1, r2, lsl #0x2
    ldr r5, [r6, #0x4]
    mov r5, r5, lsl #0x10
    mov r5, r5, lsr #0x10
    orr r5, r5, r0, lsl #0x10
    str r5, [r6, #0x4]
.L_be8:
    add r5, r8, #0x1
    add r2, r2, r5
    cmp r2, r3
    blt .L_bc0
.L_bf8:
    ldr r2, [sl, #0x280]
    cmp r2, #0x0
    beq .L_c2c
    ldr r1, [sl, #0x14]
    ldr r0, [sp]
    ldrsb r0, [r1, r0]
    ldr r0, [r2, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_c2c
    bl func_0208ea74
    ldr r0, _LIT2
    mov r1, #0x2
    str r1, [r0]
.L_c2c:
    ldr r0, [sl, #0x10]
    ldr r1, [sl, #0x4]
    cmp r0, #0x0
    bne .L_c58
    ldr r0, _LIT3
    add r2, r1, r4, lsl #0x3
    ldr r0, [r0]
    ldr r1, [r1, r4, lsl #0x3]
    ldr r2, [r2, #0x4]
    bl func_01ff87c0
    b .L_d28
.L_c58:
    add r0, r1, r4, lsl #0x3
    ldr r0, [r0, #0x4]
    mov r9, #0x0
    mov r7, r0, lsr #0x2
    ldr r5, [r1, r4, lsl #0x3]
    cmp r7, #0x0
    ble .L_d28
    ldr r4, _LIT1
    ldr fp, _LIT2
.L_c7c:
    ldr r8, [r5, r9, lsl #0x2]
    cmp r8, #0x14
    bne .L_cd8
    add r0, r5, r9, lsl #0x2
    ldr r6, [r0, #0x4]
    mov r0, #0x2
    str r0, [fp]
    mov r0, r6, lsl #0x1
    add r1, r0, #0x1
    ldr r2, [sl, #0x10]
    mov r0, #0x30
    mla r0, r1, r0, r2
    bl func_0208e420
    mov r0, #0x1
    str r0, [fp]
    ldr r1, [sl, #0x10]
    mov r0, #0x60
    mla r0, r6, r0, r1
    bl func_0208e420
    ldrsb r0, [r4, r8]
    add r0, r0, #0x1
    add r9, r9, r0
    b .L_d20
.L_cd8:
    cmp r9, r7
    mov r6, r9
    bge .L_d04
.L_ce4:
    ldr r0, [r5, r6, lsl #0x2]
    cmp r0, #0x14
    ldrsb r0, [r4, r0]
    beq .L_d04
    add r0, r0, #0x1
    add r6, r6, r0
    cmp r6, r7
    blt .L_ce4
.L_d04:
    ldr r0, _LIT3
    sub r2, r6, r9
    ldr r0, [r0]
    add r1, r5, r9, lsl #0x2
    mov r2, r2, lsl #0x2
    bl func_01ff87c0
    mov r9, r6
.L_d20:
    cmp r9, r7
    blt .L_c7c
.L_d28:
    ldr r1, _LIT4
    ldr r0, _LIT5
    str r1, [r0]
.L_d34:
    ldr r0, [sp, #0xc]
    ldrsh r1, [r0, #0x44]
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, [sp]
    add r0, r0, #0x2
    str r0, [sp]
    ldr r0, [sp, #0x4]
    cmp r0, r1
    ldr r0, [sp, #0x8]
    add r0, r0, #0x2
    str r0, [sp, #0x8]
    blt .L_b5c
.L_d6c:
    ldr r0, [sp, #0xc]
    ldrsb r1, [r0, #0x41]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_d8c
    ldr r2, [sl, #0x54]
    mov r0, sl
    blx r2
.L_d8c:
    ldr r0, [sp, #0xc]
    ldrsb r1, [r0, #0x42]
    mvn r0, #0x0
    cmp r1, r0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [sl, #0x54]
    mov r0, sl
    blx r2
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02186ae8
_LIT1: .word data_020b4908
_LIT2: .word 0x04000440
_LIT3: .word data_0210249c
_LIT4: .word 0x00007fff
_LIT5: .word 0x04000480
