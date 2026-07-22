; func_ov002_021fe2e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202e21c
        .extern func_0202f994
        .extern IsValue12D3Or147E
        .extern func_ov002_021b2f34
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b3354
        .extern func_ov002_021b3dec
        .extern func_ov002_021b8eec
        .extern func_ov002_021b9dec
        .extern func_ov002_021bb364
        .extern func_ov002_021bd630
        .extern func_ov002_021c2544
        .extern func_ov002_021c8860
        .extern func_ov002_021d88ac
        .extern func_ov002_021fdcac
        .global func_ov002_021fe2e4
        .arm
func_ov002_021fe2e4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x68
    mov r1, #0x0
    add r0, sp, #0x38
    str r1, [sp, #0xc]
    bl func_ov002_021fdcac
    mov r4, #0x0
.L_654:
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r4, #0x1
    mla r0, r2, r1, r0
    str r0, [sp]
    add r0, r0, #0x30
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    mov r5, #0x0
    sub r0, r0, #0xc3
    str r0, [sp, #0x14]
    add r0, sp, #0x38
    add r0, r0, r4, lsl #0x2
    str r0, [sp, #0x10]
    ldr r0, _LIT3
    add r0, r0, #0x50
    str r0, [sp, #0x2c]
    ldr r0, _LIT2
    add r0, r0, #0x16
    str r0, [sp, #0x30]
    ldr r0, _LIT2
    add r0, r0, #0x28
    str r0, [sp, #0x34]
    ldr r0, _LIT3
    sub r0, r0, #0x94
    str r0, [sp, #0x28]
    ldr r0, _LIT3
    sub r0, r0, #0x4c0
    str r0, [sp, #0x24]
    ldr r0, _LIT4
    add r0, r0, #0x4
    str r0, [sp, #0x18]
    ldr r0, _LIT3
    add r0, r0, #0x18c
    str r0, [sp, #0x1c]
    ldr r0, _LIT4
    add r0, r0, #0x590
    str r0, [sp, #0x20]
.L_6ec:
    ldr r0, [sp, #0x4]
    mov sl, #0x0
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    movs fp, r0, lsr #0x13
    ldrne r0, [sp]
    ldrneh r0, [r0, #0x38]
    cmpne r0, #0x0
    beq .L_ba8
    ldr r0, [sp]
    ldr r1, [r0, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_ba8
    mov r0, fp
    bl IsValue12D3Or147E
    cmp r0, #0x0
    bne .L_ba8
    cmp r5, #0x4
    bgt .L_8a0
    mov r0, fp
    bl func_0202e21c
    cmp r0, #0x0
    beq .L_8a0
    ldr r2, _LIT2
    mov r0, r4
    mov r1, r5
    add r2, r2, #0x55
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_8a0
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    ldr r1, [sp, #0x18]
    cmp r0, r1
    ldrne r1, [sp, #0x1c]
    cmpne r0, r1
    ldrne r1, [sp, #0x20]
    cmpne r0, r1
    bne .L_7bc
    ldr r0, [sp, #0x10]
    ldr r1, [r0, #0x10]
    cmp r1, #0x0
    beq .L_7e4
    ldr r0, [sp]
    ldrh r0, [r0, #0x34]
    cmp r1, r0
    movlt sl, #0x1
    movge sl, #0x0
    b .L_7e4
.L_7bc:
    ldr r0, [sp, #0x10]
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    ldr r0, [sp, #0x64]
    movne sl, #0x1
    cmp r0, #0x0
    ldrne r0, [sp]
    ldrneh r0, [r0, #0x36]
    cmpne r0, #0x0
    movne sl, #0x1
.L_7e4:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021bd630
    cmp r0, #0x0
    ldr r0, [sp, #0x4]
    movne sl, #0x1
    ldr r0, [r0]
    mov r0, r0, lsl #0xa
    movs r0, r0, lsr #0x1f
    mov r0, fp
    movne sl, #0x1
    bl func_0202f994
    cmp r0, #0x1
    bne .L_840
    ldr r0, [sp, #0x50]
    ldr r2, _LIT4
    cmp r0, #0x0
    mov r0, r4
    mov r1, r5
    movne sl, #0x1
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne sl, #0x1
.L_840:
    ldr r2, [sp, #0x14]
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    ldr r2, _LIT2
    mov r0, r4
    mov r1, r5
    add r2, r2, #0x66
    movne sl, #0x1
    bl func_ov002_021b2f34
    cmp r0, #0x0
    mov r0, fp
    movne sl, #0x1
    bl func_0202b824
    cmp r0, #0x9
    bne .L_8a0
    ldr r2, _LIT2
    mov r0, r4
    mov r1, r5
    add r2, r2, #0x94
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    movne sl, #0x1
.L_8a0:
    cmp r5, #0x5
    bge .L_8bc
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b8eec
    cmp r0, #0x0
    beq .L_b94
.L_8bc:
    mov r0, fp
    bl func_0202b824
    cmp r0, #0x17
    bne .L_928
    ldr r0, [sp]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsr #0x9
    tst r0, #0x1
    bne .L_928
    add r0, sp, #0x38
    ldr r1, [r0, r4, lsl #0x2]
    cmp r1, #0x2
    bne .L_900
    ldr r0, [sp, #0x24]
    cmp fp, r0
    movne sl, #0x1
    bne .L_908
.L_900:
    cmp r1, #0x1
    moveq sl, #0x1
.L_908:
    ldr r0, [sp, #0x54]
    cmp r0, #0x0
    beq .L_954
    mov r0, fp
    bl func_0202b86c
    cmp r0, #0x4
    moveq sl, #0x1
    b .L_954
.L_928:
    ldr r0, [sp, #0x10]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    ldr r0, [sp, #0x58]
    movne sl, #0x1
    cmp r0, #0x0
    beq .L_954
    mov r0, fp
    bl func_0202b86c
    cmp r0, #0x4
    moveq sl, #0x1
.L_954:
    ldr r0, [sp, #0x60]
    cmp r0, #0x0
    beq .L_978
    mov r0, r4
    mov r1, r5
    mov r2, fp
    bl func_ov002_021c2544
    cmp r0, #0x0
    movne sl, #0x1
.L_978:
    ldr r0, [sp, #0x5c]
    cmp r0, #0x0
    beq .L_98c
    cmp r5, #0xa
    moveq sl, #0x1
.L_98c:
    ldr r2, _LIT3
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne sl, #0x1
    cmp sl, #0x0
    bne .L_b94
    mov r7, #0x0
.L_9b0:
    ldr r1, _LIT2
    mov r0, r7
    bl func_ov002_021bb364
    str r0, [sp, #0x8]
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r7, #0x1
    mla r8, r2, r1, r0
    mov r6, #0x0
    add r9, r8, #0x30
.L_9d8:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9dec
    ldr r1, [sp, #0x28]
    cmp r0, r1
    beq .L_a74
    ldr r1, [sp, #0x2c]
    cmp r0, r1
    beq .L_a0c
    ldr r1, [sp, #0x30]
    cmp r0, r1
    beq .L_acc
    b .L_b28
.L_a0c:
    cmp r7, r4
    beq .L_b28
    mov r0, fp
    bl func_0202b824
    cmp r0, #0x17
    beq .L_b28
    ldr r1, [r8, #0x40]
    ldrh r2, [r8, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_b28
    mov r0, r4
    mov r1, r5
    mov r2, r7
    mov r3, r6
    bl func_ov002_021b3354
    cmp r0, #0x0
    movne sl, #0x1
    b .L_b28
.L_a74:
    cmp r7, r4
    beq .L_b28
    ldr r1, [r8, #0x40]
    ldrh r2, [r8, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_b28
    mov r0, r4
    mov r1, r5
    mov r2, r7
    mov r3, r6
    bl func_ov002_021b3354
    cmp r0, #0x0
    movne sl, #0x1
    b .L_b28
.L_acc:
    ldr r1, [r8, #0x3c]
    ldr r0, [sp, #0x34]
    cmp r1, r0
    bne .L_b28
    ldr r1, [r8, #0x40]
    ldrh r2, [r8, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_b28
    mov r0, r4
    mov r1, r5
    mov r2, r7
    mov r3, r6
    bl func_ov002_021b3354
    cmp r0, #0x0
    movne sl, #0x1
.L_b28:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_b74
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_b74
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c8860
    cmp r0, #0x7
    bne .L_b74
    mov r0, r4
    mov r1, r5
    mov r2, r7
    mov r3, r6
    bl func_ov002_021b3354
    cmp r0, #0x0
    movne sl, #0x1
.L_b74:
    add r8, r8, #0x14
    add r9, r9, #0x14
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_9d8
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_9b0
.L_b94:
    ldr r0, [sp]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsr #0x7
    tst r0, #0x1
    movne sl, #0x1
.L_ba8:
    ldr r0, [sp]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsr #0x6
    and r0, r0, #0x1
    cmp sl, r0
    beq .L_bd8
    mov r2, sl
    mov r0, r4
    mov r1, r5
    bl func_ov002_021d88ac
    mov r0, #0x1
    str r0, [sp, #0xc]
.L_bd8:
    ldr r0, [sp, #0x4]
    add r5, r5, #0x1
    add r0, r0, #0x14
    str r0, [sp, #0x4]
    ldr r0, [sp]
    cmp r5, #0xa
    add r0, r0, #0x14
    str r0, [sp]
    ble .L_6ec
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_654
    ldr r0, [sp, #0xc]
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00001a07
_LIT3: .word 0x000017c2
_LIT4: .word 0x00001433
