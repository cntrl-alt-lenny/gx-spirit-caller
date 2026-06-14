; func_ov006_021bcb94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021cc4fc
        .extern data_ov006_0224f448
        .extern func_02021660
        .extern func_020216b0
        .extern func_ov006_021be8c4
        .global func_ov006_021bcb94
        .arm
func_ov006_021bcb94:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    ldr r3, [r0, #0x40]
    ldr r4, _LIT0
    str r0, [sp]
    cmp r3, #0x1
    str r1, [sp, #0x4]
    str r2, [sp, #0x8]
    addne sp, sp, #0x30
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov006_021be8c4
    ldr r2, _LIT1
    mov r6, r0, lsr #0x1f
    smull r1, r3, r2, r0
    smull r1, r5, r2, r0
    add r3, r0, r3
    add r5, r0, r5
    add r3, r6, r3, asr #0x5
    mov r7, #0x3c
    add r5, r6, r5, asr #0x5
    smull r3, r6, r7, r3
    ldr r1, _LIT2
    sub r3, r0, r3
    add r2, r4, #0x8100
    mov r4, #0xa
    smull r6, r7, r1, r5
    mov r0, r5, lsr #0x1f
    add r7, r0, r7, asr #0x2
    smull r0, r6, r4, r7
    sub r7, r5, r0
    smull r0, r6, r1, r3
    smull r0, r5, r1, r3
    mov r0, r3, lsr #0x1f
    add r6, r0, r6, asr #0x2
    add r5, r0, r5, asr #0x2
    smull r0, r1, r4, r5
    sub r5, r3, r0
    str r5, [sp, #0x2c]
    ldrh r1, [r2, #0x6c]
    ldrh r0, [r2, #0x76]
    ldr r2, _LIT2
    str r6, [sp, #0x28]
    subs r0, r1, r0
    movpl sl, r0
    rsbmi sl, r0, #0x0
    str r0, [sp, #0x14]
    smull r0, r3, r2, sl
    mov r6, sl, lsr #0x1f
    add r3, r6, r3, asr #0x2
    mov r0, #0xa
    smull r1, r3, r0, r3
    ldr r5, _LIT3
    str r4, [sp, #0x24]
    sub r3, sl, r1
    smull r1, r4, r5, sl
    add r4, r6, r4, asr #0x5
    mov r5, #0x64
    smull r1, r4, r5, r4
    sub r4, sl, r1
    str r7, [sp, #0x20]
    smull r7, r5, r2, r4
    str r5, [sp, #0x10]
    mov r5, r4, lsr #0x1f
    ldr r4, [sp, #0x10]
    mov r1, r3, lsr #0x1f
    add r4, r5, r4, asr #0x2
    str r4, [sp, #0x10]
    smull r5, r4, r2, r3
    add r1, r1, r4, asr #0x2
    smull r1, r2, r0, r1
    sub r0, r3, r1
    str r0, [sp, #0xc]
    ldr r0, _LIT4
    ldr r8, _LIT5
    orr r0, r0, #0x2
    mov r6, #0x0
    str r0, [sp, #0x1c]
.L_2ad4:
    cmp r6, #0x0
    blt .L_2af4
    cmp r6, #0x3
    bgt .L_2af4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_2cac
    b .L_2b10
.L_2af4:
    cmp r6, #0x4
    blt .L_2b10
    cmp r6, #0x6
    bgt .L_2b10
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_2cac
.L_2b10:
    cmp r6, #0x4
    ldr r5, _LIT4
    blt .L_2b4c
    cmp r6, #0x6
    bgt .L_2b4c
    cmp r6, #0x4
    ldreq r5, [sp, #0x1c]
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    moveq r5, #0x0
    beq .L_2b4c
    cmp sl, #0xa
    bge .L_2b4c
    cmp r6, #0x5
    moveq r5, #0x0
.L_2b4c:
    ldrsh r0, [r8, #0x2]
    cmp r6, #0x0
    ldr fp, [r8, #0x8]
    ldr r9, [r8, #0xc]
    ldrsh r7, [r8]
    str r0, [sp, #0x18]
    blt .L_2bac
    cmp r6, #0x3
    bgt .L_2bac
    add r0, sp, #0x20
    ldr r1, [r0, r6, lsl #0x2]
    ldr r0, [sp]
    add r9, r9, r1
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    beq .L_2ba4
    ldr r0, _LIT6
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    addne r7, r7, #0x10
    b .L_2c18
.L_2ba4:
    add r7, r7, #0x100
    b .L_2c18
.L_2bac:
    cmp r6, #0x4
    bne .L_2bc8
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    movgt fp, #0x2
    movle fp, #0x1
    b .L_2c18
.L_2bc8:
    cmp r6, #0x5
    bne .L_2bec
    ldr r0, [sp, #0x10]
    cmp sl, #0xa
    add r9, r9, r0
    movge r0, #0x4
    movlt r0, #0x0
    add r7, r7, r0
    b .L_2c18
.L_2bec:
    cmp r6, #0x6
    bne .L_2c18
    ldr r0, [sp, #0xc]
    cmp sl, #0x14
    add r9, r9, r0
    movge r0, #0x4
    bge .L_2c14
    cmp sl, #0xa
    movge r0, #0x3
    movlt r0, #0x0
.L_2c14:
    add r7, r7, r0
.L_2c18:
    ldr r0, [sp]
    mov r1, #0x5
    ldr r0, [r0]
    add r2, r6, #0x64
    bl func_02021660
    mov r4, r0
    mov r1, #0x2
    mov r2, r6
    bl func_020216b0
    mov r2, r7
    mov r0, r4
    mov r1, #0x3
    bl func_020216b0
    ldr r2, [sp, #0x18]
    mov r0, r4
    mov r1, #0x4
    bl func_020216b0
    ldrsh r2, [r8, #0x4]
    mov r0, r4
    mov r1, #0x11
    bl func_020216b0
    ldrsh r2, [r8, #0x6]
    mov r0, r4
    mov r1, #0x12
    bl func_020216b0
    mov r2, fp
    mov r0, r4
    mov r1, #0xc
    bl func_020216b0
    mov r2, r9
    mov r0, r4
    mov r1, #0xd
    bl func_020216b0
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_020216b0
.L_2cac:
    add r8, r8, #0x14
    add r6, r6, #0x1
    cmp r6, #0x7
    blt .L_2ad4
    mov r0, #0x1
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word 0x88888889
_LIT2: .word 0x66666667
_LIT3: .word 0x51eb851f
_LIT4: .word 0x000001c1
_LIT5: .word data_ov006_021cc4fc
_LIT6: .word data_02104f4c
