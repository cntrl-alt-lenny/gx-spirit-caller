; func_ov002_022b4444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov002_022cd65c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0e9c
        .extern func_0207ef74
        .extern func_020a9828
        .global func_ov002_022b4444
        .arm
func_ov002_022b4444:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    ldr r7, _LIT0
    mov r1, #0x400
    ldr r5, _LIT1
    ldr fp, _LIT2
    mov sl, r0
    str r7, [sp, #0xc]
    strh r1, [sp, #0x10]
    mov r8, #0x0
    add r4, r7, #-2147483647
    mov r6, #0x19c
.L_30:
    ldr r0, [fp, #0x4]
    ldr r1, [sl, #0x8]
    eor r0, r0, #0x1
    cmp r8, r0
    bne .L_64
    ldrh r0, [sp, #0x10]
    rsb r1, r1, #0x4
    mov r1, r1, lsl #0x4
    and r0, r0, r7, asr #0x14
    orr r0, r0, #0xa0
    add r9, r1, #0xcf
    strh r0, [sp, #0x10]
    b .L_c0
.L_64:
    ldrh r0, [sp, #0x10]
    rsb r1, r1, #0x4
    mov r1, r1, lsl #0x4
    and r0, r0, r7, asr #0x14
    orr r0, r0, #0x20
    strh r0, [sp, #0x10]
    ldr r0, _LIT3
    rsb r9, r1, #0x1
    ldr r0, [r0, #0xb88]
    mov r1, #0x1
    cmp r0, #0x1
    cmpne r0, #0x2
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_c0
    mov r0, r9, lsl #0x17
    orr r0, r4, r0, lsr #0x7
    str r0, [sp, #0x4]
    mov r0, r5
    add r1, sp, #0x4
    mov r2, #0x1
    strh r6, [sp, #0x8]
    bl func_0207ef74
.L_c0:
    ldr r0, [sl, #0x54]
    cmp r0, #0x80
    ble .L_114
    add r0, sl, r8, lsl #0x2
    ldr r0, [r0, #0x4c]
    cmp r0, #0x0
    beq .L_114
    ldr r0, [sl, #0x58]
    cmp r0, #0x1
    cmpne r0, #0x2
    bne .L_114
    bl func_020a9828
    ldr r2, _LIT4
    smull r3, r1, r2, r0
    mov r2, r0, lsr #0x1f
    add r1, r2, r1, asr #0x1
    mov r2, #0x5
    smull r1, r3, r2, r1
    sub r1, r0, r1
    sub r0, r1, #0x2
    add r9, r9, r0
.L_114:
    ldr r2, [sp, #0xc]
    ldr r1, _LIT5
    mov r3, r9, lsl #0x17
    and r1, r2, r1
    orr r1, r1, #0x1
    orr r1, r1, r3, lsr #0x7
    str r1, [sp, #0xc]
    mov r0, r5
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207ef74
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_30
    ldr r1, [sl, #0xc]
    cmp r1, #0x0
    addlt sp, sp, #0x14
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    ldr r2, [sl, #0x1c]
    ldr r0, [r0, #0x4]
    cmp r2, #0x80
    movgt r3, #0x1
    eor r0, r0, #0x1
    movle r3, #0x0
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    teq r3, r0
    mov r1, #0x400
    beq .L_1d4
    subs r3, r2, #0x80
    ldr r0, [sl, #0x8]
    rsbmi r3, r3, #0x0
    rsb r2, r0, #0x4
    add r0, r3, r3, lsr #0x1f
    mov r3, r2, lsl #0x4
    mov r2, r0, asr #0x1
    ldrh r0, [sp, #0x10]
    rsb r1, r1, #0x0
    add r3, r3, #0xce
    and r0, r0, r1
    orr r0, r0, #0xa0
    rsb r1, r2, #0x40
    strh r0, [sp, #0x10]
    add r0, r3, r1
    str r0, [sp]
    b .L_210
.L_1d4:
    subs r0, r2, #0x80
    rsbmi r0, r0, #0x0
    add r0, r0, r0, lsr #0x1f
    ldrh r2, [sp, #0x10]
    ldr r4, [sl, #0x8]
    mov r3, r0, asr #0x1
    rsb r1, r1, #0x0
    and r0, r2, r1
    orr r0, r0, #0x20
    rsb r2, r4, #0x4
    rsb r1, r3, #0x40
    add r1, r1, r2, lsl #0x4
    strh r0, [sp, #0x10]
    rsb r0, r1, #0x0
    str r0, [sp]
.L_210:
    ldr r0, _LIT6
    ldr r8, [sp]
    ldr r0, [r0, #0xcf0]
    mov r1, #0x2000
    add r9, r0, #0x1
    cmp r9, #0x63
    movcs r9, #0x63
    mov r0, #0x400
    str r1, [sp, #0xc]
    strh r0, [sp, #0x10]
    cmp r9, #0x0
    sub r8, r8, #0xf
    beq .L_2d4
    mov r5, r0
    ldr fp, _LIT1
    ldr r4, _LIT5
    ldr r7, _LIT4
    rsb r5, r5, #0x0
    mov r6, #0xa
.L_25c:
    smull r1, r2, r7, r9
    mov r0, r9, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r6, r2
    sub r2, r9, r0
    mov r0, r2, lsl #0x6
    ldr r3, [sp, #0xc]
    add r1, r0, #0x2400
    add r0, r8, #0x28
    and r3, r3, r4
    ldrh r2, [sp, #0x10]
    mov r0, r0, lsl #0x17
    orr r3, r3, #0x2a
    orr r0, r3, r0, lsr #0x7
    str r0, [sp, #0xc]
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    and r2, r2, r5
    orr r0, r2, r0, asr #0x5
    strh r0, [sp, #0x10]
    mov r0, fp
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207ef74
    mov r1, r9
    smull r0, r9, r7, r1
    mov r0, r1, lsr #0x1f
    sub r8, r8, #0x7
    adds r9, r0, r9, asr #0x2
    bne .L_25c
.L_2d4:
    ldr r2, [sp, #0xc]
    ldr r0, _LIT7
    ldrh r1, [sp, #0x10]
    and r0, r2, r0
    orr r2, r0, #0x4000
    bic r0, r1, #0xf000
    orr r2, r2, #-1073741824
    orr r0, r0, #0xf000
    strh r0, [sp, #0x10]
    bic r1, r2, #0xc00
    ldr r0, _LIT5
    bic r1, r1, #0x2000
    and r2, r1, r0
    ldr r0, [sp]
    ldrh r3, [sp, #0x10]
    ldr r1, _LIT8
    mov r4, r0, lsl #0x17
    and r3, r3, r1, asr #0x14
    orr r0, r2, #0x12
    orr r2, r0, r4, lsr #0x7
    str r2, [sp, #0xc]
    ldr r0, _LIT1
    add r1, sp, #0xc
    mov r2, #0x1
    strh r3, [sp, #0x10]
    bl func_0207ef74
    ldr r2, [sp, #0xc]
    ldr r1, _LIT5
    ldr r0, _LIT1
    and r1, r2, r1
    orr r2, r1, r4, lsr #0x7
    str r2, [sp, #0xc]
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207ef74
    ldr r0, [sl, #0x1c]
    ldr r1, [sl, #0xc]
    cmp r0, #0x80
    ldr r0, _LIT2
    movgt r2, #0x1
    ldr r0, [r0, #0x4]
    movle r2, #0x0
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    teq r2, r0
    ldr r1, _LIT9
    beq .L_3ac
    ldr r2, _LIT10
    ldr r0, _LIT11
    strh r2, [r1]
    strh r0, [r1, #-2]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3ac:
    ldr r2, _LIT12
    ldr r0, _LIT13
    strh r2, [r1]
    strh r0, [r1, #-2]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xc0002000
_LIT1: .word data_ov002_022d0e9c
_LIT2: .word data_ov002_022cd65c
_LIT3: .word data_02103fcc
_LIT4: .word 0x66666667
_LIT5: .word 0xfe00ff00
_LIT6: .word data_ov002_022d008c
_LIT7: .word 0x3fff3fff
_LIT8: .word 0xc0004000
_LIT9: .word 0x050003fe
_LIT10: .word 0x00007a6e
_LIT11: .word 0x000069c9
_LIT12: .word 0x0000459e
_LIT13: .word 0x00003519
