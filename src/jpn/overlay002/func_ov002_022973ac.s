; func_ov002_022973ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_0202e1e0
        .extern func_ov002_021afab0
        .extern func_ov002_021afae4
        .extern func_ov002_021afaf4
        .extern func_ov002_021bbc34
        .extern func_ov002_021bbe70
        .extern func_ov002_021bc0f0
        .extern func_ov002_021bce38
        .extern func_ov002_021c317c
        .extern func_ov002_021c3a04
        .extern func_ov002_022535a4
        .extern func_ov002_02253600
        .extern func_ov002_0225968c
        .extern func_ov002_02259e00
        .extern func_ov002_0226f3ec
        .extern func_ov002_0227d918
        .extern func_ov002_0228119c
        .global func_ov002_022973ac
        .arm
func_ov002_022973ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    mov sl, r0
    ldr r2, _LIT0
    and r0, sl, #0x1
    mul r3, r0, r2
    ldr r0, _LIT1
    str r1, [sp]
    ldr r0, [r0, r3]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_3a4
    rsb r8, sl, #0x1
    and r0, r8, #0x1
    mul r4, r0, r2
    ldr r0, _LIT2
    add fp, r2, #0xd10
    add r9, r0, r3
    add r0, r2, #0x350
    str r0, [sp, #0x40]
    add r0, r2, #0xc20
    str r0, [sp, #0x20]
    add r0, r2, #0xd10
    str r0, [sp, #0x4]
    add r0, r2, #0xc20
    str r0, [sp, #0x1c]
    ldr r0, _LIT3
    add r7, r9, #0x120
    sub r0, r0, #0x2ac
    str r0, [sp, #0x24]
    ldr r0, _LIT4
    sub r0, r0, #0x26
    str r0, [sp, #0x18]
    ldr r0, _LIT4
    sub r0, r0, #0x27
    str r0, [sp, #0x14]
    ldr r0, _LIT4
    sub r0, r0, #0x28
    str r0, [sp, #0x10]
    ldr r0, _LIT3
    add r0, r0, #0xbe
    str r0, [sp, #0x2c]
    ldr r0, _LIT3
    add r0, r0, #0x9e
    str r0, [sp, #0x30]
    ldr r0, _LIT4
    add r0, r0, #0x700
    str r0, [sp, #0x38]
    ldr r0, _LIT3
    add r0, r0, #0xbe
    str r0, [sp, #0x28]
    ldr r0, _LIT4
    add r0, r0, #0x700
    str r0, [sp, #0x34]
    ldr r0, _LIT3
    add r0, r0, #0x29c
    str r0, [sp, #0x3c]
    ldr r0, _LIT4
    sub r0, r0, #0x28
    str r0, [sp, #0xc]
    ldr r0, _LIT4
    sub r0, r0, #0x26
    str r0, [sp, #0x8]
.L_fc:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_390
    cmp r6, fp
    mov r0, #0x1
    bgt .L_1a4
    ldr r1, [sp, #0x4]
    cmp r6, r1
    bge .L_218
    ldr r1, _LIT4
    cmp r6, r1
    bgt .L_178
    bge .L_294
    ldr r1, [sp, #0x8]
    cmp r6, r1
    bgt .L_324
    ldr r1, [sp, #0xc]
    cmp r6, r1
    blt .L_324
    ldr r1, [sp, #0x10]
    cmp r6, r1
    ldrne r1, [sp, #0x14]
    cmpne r6, r1
    ldrne r1, [sp, #0x18]
    cmpne r6, r1
    beq .L_294
    b .L_324
.L_178:
    ldr r1, [sp, #0x1c]
    cmp r6, r1
    bgt .L_194
    ldr r1, [sp, #0x20]
    cmp r6, r1
    beq .L_27c
    b .L_324
.L_194:
    ldr r1, [sp, #0x24]
    cmp r6, r1
    beq .L_294
    b .L_324
.L_1a4:
    ldr r1, [sp, #0x28]
    cmp r6, r1
    bgt .L_1cc
    ldr r1, [sp, #0x2c]
    cmp r6, r1
    bge .L_1f8
    ldr r1, [sp, #0x30]
    cmp r6, r1
    beq .L_2d8
    b .L_324
.L_1cc:
    ldr r1, [sp, #0x34]
    cmp r6, r1
    bgt .L_1e8
    ldr r1, [sp, #0x38]
    cmp r6, r1
    beq .L_2f4
    b .L_324
.L_1e8:
    ldr r1, [sp, #0x3c]
    cmp r6, r1
    beq .L_310
    b .L_324
.L_1f8:
    mov r1, r6
    mov r0, sl
    mov r2, #0x0
    bl func_ov002_02253600
    cmp r0, #0x4
    movge r0, #0x1
    movlt r0, #0x0
    b .L_324
.L_218:
    ldr r0, _LIT2
    ldr r0, [r0, r4]
    cmp r0, #0x3e8
    ble .L_26c
    mov r1, #0x0
    mov r0, sl
    mov r2, #0x1
    mov r3, r1
    bl func_ov002_021bce38
    cmp r0, #0x0
    bgt .L_26c
    mov r0, sl
    mov r1, r8
    bl func_ov002_0228119c
    ldr r1, [sp, #0x40]
    cmp r0, r1
    blt .L_274
    mov r0, sl
    bl func_ov002_021bbe70
    cmp r0, #0x0
    bne .L_274
.L_26c:
    mov r0, #0x1
    b .L_324
.L_274:
    mov r0, #0x0
    b .L_324
.L_27c:
    mov r0, r8
    bl func_ov002_021c317c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_324
.L_294:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_2d0
    ldr r3, [r7]
    mov r0, sl
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r2, #0x1
    add r1, r3, r1, lsr #0x1f
    bl func_ov002_0227d918
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_324
.L_2d0:
    mov r0, #0x0
    b .L_324
.L_2d8:
    ldr r1, _LIT3
    mov r0, sl
    bl func_ov002_021c3a04
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_324
.L_2f4:
    mov r1, r6
    mov r0, sl
    bl func_ov002_021bbc34
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_324
.L_310:
    mov r0, sl
    bl func_ov002_021bbe70
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
.L_324:
    cmp r0, #0x0
    beq .L_390
    mov r0, sl
    ldr r1, [r7]
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_0226f3ec
    cmp r0, #0x0
    beq .L_390
    ldr r4, _LIT5
    mov r0, sl
    mov r2, r5
    mov r1, #0xb
    mov r3, #0x2
    str sl, [r4, #0xd6c]
    bl func_ov002_0225968c
    mov r2, r4
    mov r0, #0x1
    str r0, [r2, #0xd54]
    ldr r1, _LIT6
    mov r2, #0x0
    str r2, [r1, #0x1cc]
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_390:
    add r7, r7, #0x4
    add r5, r5, #0x1
    ldr r0, [r9, #0xc]
    cmp r5, r0
    bcc .L_fc
.L_3a4:
    ldr r1, _LIT7
    mov r0, sl
    mov r2, #0xc
    bl func_ov002_022535a4
    cmp r0, #0x0
    beq .L_4d0
    mov r9, #0x0
    bl func_ov002_021afae4
    cmp r0, #0x0
    ble .L_4d0
    ldr fp, _LIT8
    rsb r8, sl, #0x1
    add r4, fp, #0x1
    sub r5, fp, #0x48
    mov r6, #0x1
.L_3e0:
    mov r0, r9
    bl func_ov002_021afaf4
    mov r7, r0
    cmp r7, r5
    mov r0, r6
    beq .L_40c
    cmp r7, fp
    beq .L_430
    cmp r7, r4
    beq .L_454
    b .L_46c
.L_40c:
    mov r0, r8
    mov r1, r6
    mov r2, #0x0
    mov r3, r6
    bl func_ov002_021bce38
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    b .L_46c
.L_430:
    mov r0, r8
    mov r1, #0x0
    mov r2, r6
    mov r3, r6
    bl func_ov002_021bce38
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    b .L_46c
.L_454:
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_021bc0f0
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
.L_46c:
    cmp r0, #0x0
    beq .L_4c0
    mov r0, r9
    bl func_ov002_021afab0
    mov r4, r0
    mov r0, r9
    bl func_ov002_021afab0
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r3, r1, r3, lsr #0x1f
    mov r0, sl
    mov r2, r7
    mov r1, #0xc
    bl func_ov002_02259e00
    add sp, sp, #0x44
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4c0:
    add r9, r9, #0x1
    bl func_ov002_021afae4
    cmp r9, r0
    blt .L_3e0
.L_4d0:
    mov r0, #0x0
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x000017f6
_LIT4: .word 0x000012a5
_LIT5: .word data_ov002_022d008c
_LIT6: .word data_ov002_022cd444
_LIT7: .word 0x0000fffe
_LIT8: .word 0x000015f9
