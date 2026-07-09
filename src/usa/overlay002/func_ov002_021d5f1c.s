; func_ov002_021d5f1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_0202b83c
        .extern func_ov002_021b9dec
        .extern func_ov002_021c92ec
        .extern func_ov002_021d5c18
        .global func_ov002_021d5f1c
        .arm
func_ov002_021d5f1c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    str r1, [sp, #0x4]
    mov fp, r0
    ldr r0, [sp, #0x4]
    mov r1, #0x14
    mul r1, r0, r1
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r3, fp, #0x1
    mla r0, r3, r0, r2
    ldrh r4, [r1, r0]
    cmp r4, #0x0
    addeq sp, sp, #0x28
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mvn r0, #0x0
    str r0, [sp, #0x8]
    add r0, r0, #0x18c0
    str r0, [sp, #0x20]
    ldr r0, _LIT2
    sub r0, r0, #0x4b
    str r0, [sp, #0x24]
    ldr r0, _LIT3
    sub r0, r0, #0x144
    str r0, [sp, #0x1c]
    ldr r0, _LIT3
    add r0, r0, #0x234
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    add r0, r0, #0x234
    str r0, [sp, #0x10]
    ldr r0, _LIT3
    sub r0, r0, #0x7c
    str r0, [sp, #0x14]
    ldr r0, _LIT3
    sub r0, r0, #0x7c
    str r0, [sp, #0x18]
.L_94:
    ldr r0, _LIT4
    mov r1, r4, lsl #0x3
    ldrh r1, [r0, r1]
    add r5, r0, r4, lsl #0x3
    ldrh sl, [r5, #0x6]
    mov r0, r1, asr #0x8
    and r7, r0, #0xff
    ldrh r0, [r5, #0x2]
    and r6, r1, #0xff
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0xa
    bne .L_21c
    ldr r1, _LIT1
    ldr r0, _LIT5
    and r2, r6, #0x1
    mla r1, r2, r1, r0
    mov r0, #0x14
    mla r9, r7, r0, r1
    ldr r0, [r9, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r9, #0x38]
    cmpne r0, #0x0
    beq .L_21c
    ldr r0, [r9, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_21c
    mov r0, r6
    mov r1, r7
    ldr r8, [sp, #0x8]
    bl func_ov002_021b9dec
    ldr r1, [sp, #0xc]
    cmp r0, r1
    bgt .L_170
    ldr r1, [sp, #0x10]
    cmp r0, r1
    bge .L_1b8
    ldr r1, [sp, #0x14]
    cmp r0, r1
    bgt .L_160
    ldr r1, [sp, #0x18]
    cmp r0, r1
    bge .L_1c0
    ldr r1, [sp, #0x1c]
    cmp r0, r1
    beq .L_1b8
    b .L_1f4
.L_160:
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_1b8
    b .L_1f4
.L_170:
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_1ac
    ldr r1, [sp, #0x20]
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_19c
    b .L_1c8
    b .L_1c8
    b .L_1c8
    b .L_1c8
.L_19c:
    ldr r1, [sp, #0x24]
    cmp r0, r1
    beq .L_1b8
    b .L_1f4
.L_1ac:
    ldr r1, _LIT6
    cmp r0, r1
    bne .L_1f4
.L_1b8:
    mov r8, r6
    b .L_1f4
.L_1c0:
    ldr r8, [r9, #0x3c]
    b .L_1f4
.L_1c8:
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9dec
    bl func_0202b83c
    mov r2, r0
    ldr r1, [sp, #0x4]
    mov r0, fp
    bl func_ov002_021c92ec
    cmp r0, #0x0
    ldrneh r0, [r5, #0x4]
    andne r8, r0, #0x1
.L_1f4:
    cmp r8, #0x0
    blt .L_21c
    mov r0, r8, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldr r1, [sp, #0x4]
    mov r2, r4
    mov r0, fp
    mov r3, #0x5
    bl func_ov002_021d5c18
.L_21c:
    cmp sl, #0x0
    mov r4, sl
    bne .L_94
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf0c6
_LIT1: .word 0x00000868
_LIT2: .word 0x000018c2
_LIT3: .word 0x00001466
_LIT4: .word data_ov002_022d0570
_LIT5: .word data_ov002_022cf08c
_LIT6: .word 0x00001a9c
