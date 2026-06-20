; func_ov002_02259b4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c819c
        .extern data_ov002_022cdc78
        .extern data_ov002_022ce288
        .extern data_ov002_022cf282
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern data_ov002_022d0650
        .extern func_ov002_021b99b4
        .extern func_ov002_021c93f0
        .extern func_ov002_021c9504
        .extern func_ov002_021c9a08
        .extern func_ov002_021fd81c
        .extern func_ov002_02259a40
        .global func_ov002_02259b4c
        .arm
func_ov002_02259b4c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x88
    ldr r3, _LIT0
    mov r8, #0x0
    ldr r4, [r3, #0x5d4]
    mov sl, r0
    mov r9, r2
    mov r6, r8
    mov r2, r8
    cmp r4, #0x0
    bls .L_4c
    mov r0, #0x1
.L_30:
    ldrb r1, [r3, #0x5dc]
    add r2, r2, #0x1
    add r3, r3, #0x1
    cmp r1, #0x5
    movhi r6, r0
    cmp r2, r4
    bcc .L_30
.L_4c:
    ldr r0, _LIT1
    ldr r5, _LIT2
    mov r7, #0x0
    add fp, sp, #0x8
    add r4, r0, #0x80
.L_60:
    add r0, r5, r7, lsl #0x4
    ldr r0, [r0, #0x4]
    cmp r9, r0
    bne .L_a4
    cmp r6, #0x0
    ldr r1, [r5, r7, lsl #0x4]
    ldrne r0, _LIT1
    cmpne r1, r0
    cmpne r1, r4
    bne .L_a4
    add r0, r5, r7, lsl #0x4
    ldr r2, [r0, #0x8]
    mov r0, sl
    blx r2
    cmp r0, #0x0
    strne r7, [fp, r8, lsl #0x2]
    addne r8, r8, #0x1
.L_a4:
    add r7, r7, #0x1
    cmp r7, #0x1b
    bcc .L_60
    ldr r0, _LIT3
    ldr r1, [r0, #0xcec]
    cmp r1, sl
    bne .L_1a4
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x2
    cmpne r0, #0x4
    bne .L_1a4
    cmp r6, #0x0
    cmpeq r9, #0xe
    bne .L_1a4
    ldr r0, _LIT4
    and r1, sl, #0x1
    mul r2, r1, r0
    ldr r0, _LIT5
    ldrh r7, [r0, r2]
    cmp r7, #0x0
    beq .L_1a4
    mov r0, sl, lsl #0x1f
    and r0, r0, #-2147483648
    orr r6, r0, #0x4e0000
    ldr fp, _LIT6
    ldr r4, _LIT7
    orr r6, r6, #0x46000000
.L_110:
    add r0, r4, r7, lsl #0x3
    ldrh r3, [r0, #0x2]
    ldrh r7, [r0, #0x6]
    mov r1, r3, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x1
    ldreqh r2, [r0]
    ldreq r1, _LIT8
    cmpeq r2, r1
    bne .L_19c
    mov r1, r3, lsl #0x18
    movs r1, r1, lsr #0x1c
    bne .L_19c
    ldrh r5, [r0, #0x4]
    mov r0, sl
    mov r1, r5
    bl func_ov002_021b99b4
    cmp r0, #0x0
    blt .L_19c
    mov r0, r5, lsl #0x2
    ldrh r0, [fp, r0]
    mov r1, r5, lsl #0x10
    mov r2, #0x0
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    mov r0, r0, lsl #0x10
    orr r0, r6, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021fd81c
    cmp r0, #0x0
    beq .L_19c
    rsb r1, r5, #0x0
    add r0, sp, #0x8
    str r1, [r0, r8, lsl #0x2]
    add r8, r8, #0x1
.L_19c:
    cmp r7, #0x0
    bne .L_110
.L_1a4:
    mov r0, #0x0
    cmp r8, #0x0
    str r0, [sp]
    addle sp, sp, #0x88
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b8:
    ldr r0, [sp]
    add r1, sp, #0x8
    ldr r3, [r1, r0, lsl #0x2]
    cmp r3, #0x0
    bge .L_230
    mov r0, sl
    rsb r1, r3, #0x0
    bl func_ov002_021b99b4
    mov r2, r0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c93f0
    ldr r2, _LIT9
    ldr r0, [r0]
    ldr r1, [r2, #0xc]
    add r1, r2, r1, lsl #0x2
    str r0, [r1, #0x10]
    ldr r0, [r2, #0xc]
    add r0, r2, r0, lsl #0x1
    add r0, r0, #0x400
    strh r9, [r0, #0x10]
    ldr r0, [r2, #0xc]
    cmp r0, #0xff
    ldr r0, _LIT9
    movcc r2, #0x1
    ldr r1, [r0, #0xc]
    movcs r2, #0x0
    add r1, r1, r2
    str r1, [r0, #0xc]
    b .L_350
.L_230:
    ldr r2, _LIT2
    ldr r0, _LIT10
    add r1, r2, r3, lsl #0x4
    ldr r1, [r1, #0xc]
    ldr r6, [r2, r3, lsl #0x4]
    cmp r1, r0
    beq .L_2e0
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c9a08
    subs r7, r0, #0x1
    bmi .L_350
    mov r0, r9, lsl #0x10
    ldr r5, _LIT9
    mov r4, r0, lsr #0x10
    mov fp, #0x1
.L_270:
    mov r0, sl
    mov r1, r9
    mov r2, r7
    bl func_ov002_021c9504
    cmp r6, r0
    bne .L_2d4
    mov r0, sl
    mov r1, r9
    mov r2, r7
    bl func_ov002_021c93f0
    ldr r1, [r5, #0xc]
    ldr r0, [r0]
    add r1, r5, r1, lsl #0x2
    str r0, [r1, #0x10]
    ldr r0, [r5, #0xc]
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x400
    strh r4, [r0, #0x10]
    ldr r0, [r5, #0xc]
    cmp r0, #0xff
    movcc r1, fp
    ldr r0, [r5, #0xc]
    movcs r1, #0x0
    add r0, r0, r1
    str r0, [r5, #0xc]
.L_2d4:
    subs r7, r7, #0x1
    bpl .L_270
    b .L_350
.L_2e0:
    mov r0, #0x0
    sub r1, r0, #0x2000
    ldr r2, _LIT11
    and r4, r1, #0x0
    and r1, r6, r2
    orr r2, r4, r1
    ldr r3, _LIT9
    bic r4, r2, #0x2000
    ldr r1, [r3, #0xc]
    mov r2, sl, lsl #0x1f
    orr r4, r4, r2, lsr #0x12
    add r1, r3, r1, lsl #0x2
    str r4, [r1, #0x10]
    ldr r1, [r3, #0xc]
    add r2, sp, #0x4
    str r0, [r2]
    add r1, r3, r1, lsl #0x1
    add r1, r1, #0x400
    mov r2, #0x10
    strh r2, [r1, #0x10]
    ldr r1, [r3, #0xc]
    str r4, [sp, #0x4]
    cmp r1, #0xff
    ldr r1, _LIT9
    movcc r0, #0x1
    ldr r2, [r1, #0xc]
    add r0, r2, r0
    str r0, [r1, #0xc]
.L_350:
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, r8
    blt .L_1b8
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00001aac
_LIT2: .word data_ov002_022c819c
_LIT3: .word data_ov002_022d016c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf282
_LIT6: .word data_ov002_022d0250
_LIT7: .word data_ov002_022d0650
_LIT8: .word 0x00001a04
_LIT9: .word data_ov002_022cdc78
_LIT10: .word func_ov002_02259a40
_LIT11: .word 0x00001fff
