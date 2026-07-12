; func_ov016_021b6534 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov000_021b1c4c
        .extern data_ov016_021b9214
        .extern data_ov016_021b921e
        .extern data_ov016_021b9244
        .extern data_ov016_021b9624
        .extern data_ov016_021bab2c
        .extern data_ov016_021bab44
        .extern data_ov016_021bb164
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_020371b8
        .extern func_0208dfb8
        .extern func_02094410
        .extern func_020b377c
        .extern func_ov005_021aa3f0
        .extern func_ov016_021b27f4
        .extern func_ov016_021b6d9c
        .extern func_ov016_021b70c4
        .extern func_ov016_021b7398
        .extern func_ov016_021b745c
        .extern func_ov016_021b7528
        .extern func_ov016_021b8178
        .global func_ov016_021b6534
        .arm
func_ov016_021b6534:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    ldr r0, _LIT0
    mov fp, #0x0
    ldr r4, _LIT1
    ldr r6, _LIT2
    bl func_ov016_021b8178
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_378
    cmp r0, #0x1
    beq .L_400
    cmp r0, #0x2
    beq .L_a94
    b .L_b64
.L_378:
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    bne .L_3b0
    mov r0, r5
    bl func_ov016_021b70c4
    ldr r2, _LIT3
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x14
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_3b0:
    ldr r1, [r5, #0x4]
    ldr r0, _LIT4
    add r3, r1, #0x1
    sub r1, r3, #0xa
    ldr r2, _LIT5
    str r3, [r5, #0x4]
    and r1, r0, r1, lsl #0x4
    str r1, [r2]
    ldr r1, [r5, #0x4]
    sub r1, r1, #0xa
    and r0, r0, r1, lsl #0x4
    str r0, [r2, #0x4]
    ldr r0, [r5, #0x4]
    cmp r0, #0xa
    blt .L_b64
    mov r0, #0x1
    str r0, [r5]
    mov r0, #0x0
    str r0, [r5, #0x4]
    b .L_b64
.L_400:
    mov r0, #0x4000000
    ldr r2, [r0]
    ldr r1, [r0]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r3, #0x6
    orr r2, r2, r1, lsl #0x8
    ldr r1, _LIT6
    str r2, [r0]
    ldrh r1, [r1, #0x52]
    cmp r1, #0x0
    beq .L_774
    tst r1, #0x300
    beq .L_45c
    ldr r2, [r0]
    ldr r1, [r0]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0x6
    orr r1, r2, r1, lsl #0x8
    str r1, [r0]
.L_45c:
    ldr r0, _LIT6
    ldrh r1, [r0, #0x54]
    tst r1, #0x400
    beq .L_47c
    mov r0, r5
    mov r1, #0x1
    bl func_ov016_021b6d9c
    b .L_b64
.L_47c:
    tst r1, #0x2
    beq .L_494
    mov r0, r5
    mov r1, #0x0
    bl func_ov016_021b6d9c
    b .L_b64
.L_494:
    ldrh r0, [r0, #0x56]
    tst r0, #0x40
    beq .L_558
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    ble .L_4dc
    sub r2, r0, #0x1
    str r2, [r5, #0x10]
    mov r0, r5
    mov r1, #0x2
    str r2, [r5, #0x24]
    bl func_ov016_021b6d9c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_b64
.L_4dc:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    ble .L_b64
    sub r6, r0, #0x1
    str r6, [r5, #0xc]
    subs r0, r6, #0x1
    bmi .L_52c
    ldr r1, [r5, #0x8]
    bl func_020b377c
    mov r0, #0x54
    add r2, r6, #0x7
    mov r6, r2, lsr #0x1f
    rsb r2, r6, r2, lsl #0x1d
    ldr r7, _LIT7
    mla r1, r0, r1, r4
    ldr r3, _LIT8
    mov r0, r5
    add r2, r6, r2, ror #0x1d
    str r7, [sp]
    bl func_ov016_021b7398
.L_52c:
    mov r0, r5
    bl func_ov016_021b745c
    mov r0, r5
    mov r1, #0x2
    bl func_ov016_021b6d9c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_b64
.L_558:
    tst r0, #0x80
    beq .L_62c
    ldr r2, [r5, #0x8]
    ldr r1, [r5, #0x10]
    cmp r2, #0x6
    movgt r0, #0x6
    movle r0, r2
    sub r0, r0, #0x1
    cmp r1, r0
    bge .L_5b0
    add r2, r1, #0x1
    str r2, [r5, #0x10]
    mov r0, r5
    mov r1, #0x2
    str r2, [r5, #0x24]
    bl func_ov016_021b6d9c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_b64
.L_5b0:
    ldr r0, [r5, #0xc]
    add r1, r0, #0x6
    cmp r1, r2
    bge .L_b64
    add r0, r0, #0x1
    str r0, [r5, #0xc]
    add r7, r0, #0x6
    ldr r1, [r5, #0x8]
    mov r0, r7
    bl func_020b377c
    mov r0, #0x54
    mla r1, r0, r1, r4
    mov r6, r7, lsr #0x1f
    rsb r2, r6, r7, lsl #0x1d
    ldr r7, _LIT7
    ldr r3, _LIT8
    mov r0, r5
    add r2, r6, r2, ror #0x1d
    str r7, [sp]
    bl func_ov016_021b7398
    mov r0, r5
    bl func_ov016_021b745c
    mov r0, r5
    mov r1, #0x2
    bl func_ov016_021b6d9c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_b64
.L_62c:
    tst r0, #0x10
    beq .L_6f0
    ldr r1, [r5, #0xc]
    ldr r0, [r5, #0x8]
    add r2, r1, #0x6
    cmp r2, r0
    bge .L_b64
    str r2, [r5, #0xc]
    ldr r1, [r5, #0x8]
    add r0, r2, #0x6
    cmp r0, r1
    subge r0, r1, #0x6
    ldr r8, _LIT7
    ldr r7, _LIT8
    strge r0, [r5, #0xc]
    mov r9, #0x0
    mov r6, #0x54
.L_670:
    ldr r0, [r5, #0x10]
    sub r0, r0, #0x1
    adds r0, r0, r9
    bmi .L_6b8
    ldr r0, [r5, #0xc]
    ldr r1, [r5, #0x8]
    add sl, r0, r9
    sub r0, sl, #0x1
    bl func_020b377c
    add r0, sl, #0x7
    mov r2, r0, lsr #0x1f
    rsb r0, r2, r0, lsl #0x1d
    mla r1, r6, r1, r4
    add r2, r2, r0, ror #0x1d
    mov r0, r5
    str r8, [sp]
    mov r3, r7
    bl func_ov016_021b7398
.L_6b8:
    add r9, r9, #0x1
    cmp r9, #0x6
    blt .L_670
    mov r0, r5
    bl func_ov016_021b745c
    mov r0, r5
    mov r1, #0x2
    bl func_ov016_021b6d9c
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_b64
.L_6f0:
    tst r0, #0x20
    beq .L_b64
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    ble .L_b64
    subs r0, r0, #0x6
    str r0, [r5, #0xc]
    movmi r0, #0x0
    ldr r8, _LIT7
    ldr r7, _LIT8
    strmi r0, [r5, #0xc]
    mov r9, #0x0
    mov r6, #0x54
.L_724:
    ldr sl, [r5, #0xc]
    sub r0, sl, #0x1
    adds r0, r0, r9
    bmi .L_764
    ldr r1, [r5, #0x8]
    bl func_020b377c
    add r0, sl, r9
    add r0, r0, #0x7
    mov r2, r0, lsr #0x1f
    rsb r0, r2, r0, lsl #0x1d
    mla r1, r6, r1, r4
    add r2, r2, r0, ror #0x1d
    mov r0, r5
    str r8, [sp]
    mov r3, r7
    bl func_ov016_021b7398
.L_764:
    add r9, r9, #0x1
    cmp r9, #0x6
    blt .L_724
    b .L_b64
.L_774:
    ldr r0, [r5, #0x8]
    cmp r0, #0x6
    ble .L_a0c
    mov r0, r6
    bl func_ov005_021aa3f0
    ldr r0, [r6, #0x4]
    str r0, [r5, #0xc]
    ldr r0, [r6, #0x18]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_a0c
    b .L_7b8
    b .L_99c
    b .L_820
    b .L_874
    b .L_8c4
    b .L_934
.L_7b8:
    ldr r0, [r5, #0x20]
    cmp r0, #0x0
    beq .L_80c
    mov r2, fp
    str r2, [r5, #0x20]
    ldr r1, [r5, #0xc]
    ldr r0, [r5, #0x10]
    ldr r3, [r5, #0x14]
    add r0, r1, r0
    cmp r3, r0
    beq .L_800
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r3, #0x1
    bl func_020371b8
    mov r0, r5
    mov r1, #0x2
    bl func_ov016_021b6d9c
.L_800:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_80c:
    ldr r1, [r5, #0xc]
    ldr r0, [r5, #0x10]
    add r0, r1, r0
    str r0, [r5, #0x14]
    b .L_a0c
.L_820:
    ldr r6, [r5, #0xc]
    subs r0, r6, #0x1
    bmi .L_860
    ldr r1, [r5, #0x8]
    bl func_020b377c
    mov r0, #0x54
    add r2, r6, #0x7
    mov r6, r2, lsr #0x1f
    rsb r2, r6, r2, lsl #0x1d
    ldr r7, _LIT7
    mla r1, r0, r1, r4
    ldr r3, _LIT8
    mov r0, r5
    add r2, r6, r2, ror #0x1d
    str r7, [sp]
    bl func_ov016_021b7398
.L_860:
    mov r0, #0x2
    str r0, [r5, #0x20]
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_874:
    ldr r0, [r5, #0xc]
    ldr r1, [r5, #0x8]
    add r7, r0, #0x6
    mov r0, r7
    bl func_020b377c
    mov r0, #0x54
    mla r1, r0, r1, r4
    mov r6, r7, lsr #0x1f
    rsb r2, r6, r7, lsl #0x1d
    ldr r7, _LIT7
    ldr r3, _LIT8
    mov r0, r5
    add r2, r6, r2, ror #0x1d
    str r7, [sp]
    bl func_ov016_021b7398
    mov r0, #0x3
    str r0, [r5, #0x20]
    add sp, sp, #0x2c
    mov r0, fp
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8c4:
    ldr r7, _LIT7
    ldr r6, _LIT8
    mov r8, fp
    mov sl, #0x54
.L_8d4:
    ldr r9, [r5, #0xc]
    sub r0, r9, #0x1
    adds r0, r0, r8
    bmi .L_914
    ldr r1, [r5, #0x8]
    bl func_020b377c
    add r0, r9, r8
    add r0, r0, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    mla r1, sl, r1, r4
    mov r0, r5
    add r2, r3, r2, ror #0x1d
    mov r3, r6
    str r7, [sp]
    bl func_ov016_021b7398
.L_914:
    add r8, r8, #0x1
    cmp r8, #0x6
    blt .L_8d4
    mov r0, #0x4
    str r0, [r5, #0x20]
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_934:
    ldr r7, _LIT7
    ldr r6, _LIT8
    mov r8, fp
    mov sl, #0x54
.L_944:
    ldr r0, [r5, #0xc]
    ldr r1, [r5, #0x8]
    add r0, r0, r8
    add r9, r0, #0x1
    mov r0, r9
    bl func_020b377c
    mov r3, r9, lsr #0x1f
    rsb r2, r3, r9, lsl #0x1d
    mla r1, sl, r1, r4
    mov r0, r5
    add r2, r3, r2, ror #0x1d
    mov r3, r6
    str r7, [sp]
    bl func_ov016_021b7398
    add r8, r8, #0x1
    cmp r8, #0x6
    blt .L_944
    mov r0, #0x5
    str r0, [r5, #0x20]
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_99c:
    ldr r7, _LIT7
    ldr r6, _LIT8
    mov r8, fp
    mov sl, #0x54
.L_9ac:
    ldr r9, [r5, #0xc]
    sub r0, r9, #0x1
    adds r0, r0, r8
    bmi .L_9ec
    ldr r1, [r5, #0x8]
    bl func_020b377c
    add r0, r9, r8
    add r0, r0, #0x7
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1d
    mla r1, sl, r1, r4
    mov r0, r5
    add r2, r3, r2, ror #0x1d
    mov r3, r6
    str r7, [sp]
    bl func_ov016_021b7398
.L_9ec:
    add r8, r8, #0x1
    cmp r8, #0x8
    blt .L_9ac
    mov r0, #0x1
    str r0, [r5, #0x20]
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a0c:
    mov r0, r5
    bl func_ov016_021b7528
    cmp r0, #0x0
    blt .L_a4c
    ldr r1, [r5, #0x10]
    cmp r0, r1
    beq .L_a4c
    str r0, [r5, #0x10]
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, r5
    mov r1, #0x2
    bl func_ov016_021b6d9c
.L_a4c:
    ldr r0, _LIT9
    bl func_ov016_021b27f4
    cmp r0, #0x0
    beq .L_a70
    mov r0, r5
    mov r1, #0x0
    bl func_ov016_021b6d9c
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a70:
    ldr r0, _LIT10
    bl func_ov016_021b27f4
    cmp r0, #0x0
    beq .L_b64
    mov r0, r5
    mov r1, #0x1
    bl func_ov016_021b6d9c
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a94:
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    bne .L_b28
    bl func_0208dfb8
    mov r1, r0
    mov r0, fp
    mov r2, #0x800
    bl func_02094410
    add r0, sp, #0x4
    bl func_0201d428
    ldr r0, _LIT11
    mov r1, #0x4
    mov r2, fp
    bl func_02006bf0
    ldrh r1, [sp, #0x18]
    str r0, [sp, #0x4]
    ldrh r2, [sp, #0x1a]
    bic r0, r1, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x18]
    ldrh r1, [sp, #0x18]
    orr r0, r2, #0x8000
    strh r0, [sp, #0x1a]
    ldr r0, [sp, #0x1c]
    orr r1, r1, #0x10
    bic r0, r0, #0x1c000
    strh r1, [sp, #0x18]
    orr r1, r0, #0x1c000
    mov r0, #0x40
    str r0, [sp, #0x10]
    mov r0, fp
    strh r0, [sp, #0x14]
    add r0, sp, #0x4
    str r1, [sp, #0x1c]
    bl func_0201e564
    ldr r0, [sp, #0x4]
    bl func_02006e00
.L_b28:
    ldr r1, [r5, #0x4]
    ldr r0, _LIT4
    add r3, r1, #0x1
    rsb r1, r3, #0x0
    ldr r2, _LIT5
    str r3, [r5, #0x4]
    and r1, r0, r1, lsl #0x4
    str r1, [r2]
    ldr r1, [r5, #0x4]
    rsb r1, r1, #0x0
    and r0, r0, r1, lsl #0x4
    str r0, [r2, #0x4]
    ldr r0, [r5, #0x4]
    cmp r0, #0xa
    movge fp, #0x1
.L_b64:
    mov r0, fp
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov016_021bb164
_LIT1: .word data_ov016_021b9624
_LIT2: .word data_ov000_021b1c4c
_LIT3: .word 0x04001000
_LIT4: .word 0x000001ff
_LIT5: .word 0x04000014
_LIT6: .word data_02104acc
_LIT7: .word data_ov016_021bab2c
_LIT8: .word data_ov016_021bab44
_LIT9: .word data_ov016_021b9214
_LIT10: .word data_ov016_021b921e
_LIT11: .word data_ov016_021b9244
