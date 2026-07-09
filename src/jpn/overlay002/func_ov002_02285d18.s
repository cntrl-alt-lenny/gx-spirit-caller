; func_ov002_02285d18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021bbe70
        .extern func_ov002_021bc920
        .extern func_ov002_021c4bbc
        .extern func_ov002_0226ea58
        .extern func_ov002_0227b8c8
        .extern func_ov002_0227c588
        .extern func_ov002_0227d608
        .extern func_ov002_0227d7d4
        .extern func_ov002_02285874
        .extern func_ov002_022858a4
        .extern func_ov002_022858d8
        .extern func_ov002_0228598c
        .extern func_ov002_02285ad0
        .extern func_ov002_02285c58
        .global func_ov002_02285d18
        .arm
func_ov002_02285d18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x120
    str r1, [sp, #0x4]
    mvn r1, #0x0
    mov sl, r0
    str r1, [sp, #0x1c]
    bl func_ov002_02285c58
    ldr r1, _LIT0
    and r4, sl, #0x1
    mul r3, r4, r1
    ldr r1, _LIT1
    ldr r2, _LIT2
    str r0, [sp, #0x18]
    ldr r0, [r2, #0x1d4]
    ldr r1, [r1, r3]
    str r0, [sp, #0x14]
    mov r0, #0x0
    cmp r1, #0x0
    str r0, [sp, #0x20]
    bls .L_2cc
    ldr r1, _LIT3
    rsb r0, sl, #0x1
    str r0, [sp, #0xc]
    add r0, r1, r3
    str r0, [sp, #0x8]
    add r9, r0, #0x120
.L_68:
    ldr r3, [r9]
    mov r0, sl
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r3, r3, lsl #0x13
    add r1, r1, r2, lsr #0x1f
    mov r5, r3, lsr #0x13
    bl func_ov002_0226ea58
    tst r0, #0x10
    beq .L_2ac
    mov r1, r5, lsl #0x10
    mov r0, sl
    mov r2, r1, lsr #0x10
    mov r1, #0x2
    bl func_ov002_0227c588
    cmp r0, #0x0
    bne .L_2ac
    mov r2, #0x0
    mov r0, sl
    mov r1, r5
    mov r3, r2
    bl func_ov002_0227b8c8
    cmp r0, #0x1
    beq .L_2ac
    ldr r2, [r9]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_0227d7d4
    movs r6, r0
    mov r0, #0x1
    moveq r1, r0
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x4]
    movne r1, #0x0
    cmp r0, r1
    beq .L_2ac
    cmp r6, #0x0
    mov r8, #0x0
    ble .L_194
    add r4, sp, #0x24
    mov fp, r8
.L_128:
    mov r0, sl
    mov r1, r5
    mov r2, fp
    mov r3, r8
    str r4, [sp]
    bl func_ov002_0227d608
    movs r7, r0
    movmi r0, #0x0
    strmi r0, [sp, #0x10]
    bmi .L_194
    mov r3, r7, lsl #0x10
    mov r3, r3, lsr #0x10
    mov r3, r3, asr #0x8
    mov r0, sl
    mov r1, r5
    and r2, r7, #0xff
    and r3, r3, #0xff
    bl func_ov002_021bc920
    cmp r0, #0x0
    movne r0, r8, lsl #0x1
    addne r8, r8, #0x1
    strneh r7, [r4, r0]
    mov r0, r8, lsl #0x1
    add r8, r8, #0x1
    strh r7, [r4, r0]
    cmp r8, r6
    blt .L_128
.L_194:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_2ac
    add r0, sp, #0x58
    mov r1, sl
    mov r7, #0x0
    bl func_ov002_02285874
    mov r0, sl
    bl func_ov002_022858d8
    add r2, sp, #0x24
    str r2, [sp]
    mov r1, r5
    mov r3, r6
    mov r0, sl
    mov r2, r7
    bl func_ov002_0228598c
    movs r4, r0
    bmi .L_1ec
    add r2, sp, #0x2c
    mov r0, sl
    mov r1, r4
    bl func_ov002_021c4bbc
.L_1ec:
    mov r0, sl
    bl func_ov002_02285ad0
    mov r5, r0
    mov r0, sl
    bl func_ov002_021bbe70
    ldr r1, _LIT2
    str r0, [r1, #0x1d8]
    ldr r0, [sp, #0xc]
    bl func_ov002_021bbe70
    ldr r2, _LIT2
    mov r1, #0x14
    str r0, [r2, #0x1dc]
    ldr r0, [sp, #0x8]
    mla r0, r4, r1, r0
    ldr r1, [r0, #0x40]
    add r0, sp, #0x58
    mov r1, r1, lsr #0x16
    and r6, r1, #0x1
    mov r1, sl
    bl func_ov002_022858a4
    cmp r4, #0x0
    ldrge r0, [sp, #0x40]
    cmpge r0, #0x384
    blt .L_2ac
    cmp r6, #0x0
    beq .L_2ac
    ldr r0, [sp, #0x18]
    cmp r0, r5
    ldr r0, [sp, #0x18]
    movlt r7, #0x1
    cmp r5, r0
    bne .L_28c
    ldr r1, _LIT2
    ldr r0, [sp, #0x14]
    ldr r2, [r1, #0x1d4]
    cmp r0, r2
    bcs .L_28c
    ldr r0, [r1, #0x1d8]
    cmp r0, #0x0
    movne r7, #0x1
.L_28c:
    cmp r7, #0x0
    beq .L_2ac
    ldr r0, _LIT2
    str r5, [sp, #0x18]
    ldr r0, [r0, #0x1d4]
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x20]
    str r0, [sp, #0x1c]
.L_2ac:
    ldr r0, [sp, #0x8]
    add r9, r9, #0x4
    ldr r1, [r0, #0xc]
    ldr r0, [sp, #0x20]
    add r0, r0, #0x1
    str r0, [sp, #0x20]
    cmp r0, r1
    bcc .L_68
.L_2cc:
    ldr r0, [sp, #0x1c]
    add sp, sp, #0x120
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cd444
_LIT3: .word data_ov002_022cf08c
