; func_ov008_021ae27c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b267c
        .extern data_ov008_021b2ca0
        .extern data_ov008_021b2ca8
        .extern func_02005d90
        .extern func_020943b0
        .extern func_020b377c
        .extern func_ov008_021ab3a4
        .extern func_ov008_021ab95c
        .global func_ov008_021ae27c
        .arm
func_ov008_021ae27c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldrh r3, [r2, #0x6]
    ldrh r2, [r1, #0x4]
    mov r1, #0x34
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    mul r4, r3, r1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x18
    ldrh r1, [r1, r4]
    mov sl, r0
    mov r0, r2, lsr #0x18
    ldr r2, _LIT0
    cmp r1, #0x5
    ldrh r4, [r2, #0x4]
    movgt fp, #0x17
    movle fp, #0x38
    mov r2, r4, lsl #0x18
    mov r2, r2, lsr #0x18
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x1d
    add r3, r3, r2, ror #0x1d
    mov r2, r4, lsl #0x10
    mov r5, r1
    mov r6, #0x0
    cmp sl, #0x0
    add r7, r3, r2, lsr #0x18
    beq .L_83c
    cmp sl, #0x0
    mvnle r2, #0x11
    mulle r6, sl, r2
    ble .L_7f8
    rsb r3, sl, #0x4
    mov r2, #0x12
    mul r6, r3, r2
    sub r0, r0, #0x1
.L_7f8:
    ldr r2, _LIT1
    add r9, r0, r0, lsl #0x2
    ldrh r3, [r2, #0x4]
    sub r5, r5, r9
    cmp r5, #0xf
    movgt r5, #0xf
    sub r0, r5, #0x6
    mov r4, r3, lsl #0x10
    cmp r0, r4, lsr #0x18
    bge .L_87c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r3, r0, lsr #0x10
    strh r0, [r2, #0x4]
    b .L_87c
.L_83c:
    ldr r2, _LIT1
    add r9, r0, r0, lsl #0x2
    ldrh r3, [r2, #0x4]
    sub r5, r5, r9
    cmp r5, #0xa
    movgt r5, #0xa
    sub r0, r5, #0x1
    mov r4, r3, lsl #0x10
    cmp r0, r4, lsr #0x18
    bge .L_87c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r3, r0, lsr #0x10
    strh r0, [r2, #0x4]
.L_87c:
    cmp r1, #0xa
    bls .L_8a4
    cmp r5, #0x5
    movgt r0, #0x5
    movle r0, r5
    mov r1, r0, lsl #0x1
    mov r0, #0xc8
    bl func_020b377c
    str r0, [sp, #0x10]
    b .L_8c0
.L_8a4:
    cmp r5, #0x5
    movgt r0, #0x5
    movle r0, r5
    mov r1, r0, lsl #0x1
    mov r0, #0xe8
    bl func_020b377c
    str r0, [sp, #0x10]
.L_8c0:
    cmp r7, #0x7
    subgt r7, r7, #0x8
    cmp r5, #0x0
    mov r4, #0x0
    addle sp, sp, #0x20
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r7, lsl #0x4
    add r0, r0, #0x93
    add r0, r0, #0x200
    orr r0, r0, #0xc00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x14]
.L_8f4:
    ldr r0, [sp, #0x14]
    mov r3, r4, lsr #0x1f
    strh r0, [sp, #0x1c]
    ldr r0, _LIT3
    smull r1, r2, r0, r4
    add r2, r3, r2, asr #0x1
    mov r0, #0x5
    smull r1, r2, r0, r2
    sub r2, r4, r1
    mov r0, r2, lsl #0x1
    add r1, r0, #0x1
    ldr r0, [sp, #0x10]
    mul r1, r0, r1
    ldr r0, _LIT3
    sub r7, r1, #0x4
    smull r1, r2, r0, r4
    add r2, r3, r2, asr #0x1
    mov r0, #0x46
    mla r8, r2, r0, fp
    sub r0, r8, r6
    and r1, r0, #0xff
    orr r0, r1, #0xa000
    mov r2, r7, lsl #0x17
    orr r0, r0, #-1073741824
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0x18]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x18
    mov r2, #0x8
    bl func_020943b0
    ldr r0, _LIT1
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x10
    cmp r4, r0, lsr #0x18
    cmpeq sl, #0x0
    bne .L_99c
    sub r0, r7, #0x2
    sub r1, r8, #0x2
    bl func_ov008_021ab95c
.L_99c:
    mov r1, r9, lsr #0x1f
    rsb r0, r1, r9, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    mov r1, r9, asr #0x4
    add r1, r9, r1, lsr #0x1b
    mov r2, r1, asr #0x5
    ldr r1, _LIT4
    add r1, r1, r2, lsl #0x2
    ldr r2, [r1, #0xc]
    mov r1, #0x1
    tst r2, r1, lsl r0
    beq .L_a04
    mov r2, #0x1c
    str r2, [sp]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r2, #0x400
    str r2, [sp, #0x8]
    mov r2, #0x3
    add r1, r8, #0x10
    str r2, [sp, #0xc]
    mov r2, #0x0
    add r0, r7, #0x4
    sub r1, r1, r6
    mov r3, r2
    bl func_ov008_021ab3a4
.L_a04:
    add r9, r9, #0x1
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_8f4
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2ca0
_LIT1: .word data_ov008_021b2ca8
_LIT2: .word data_ov008_021b267c
_LIT3: .word 0x66666667
_LIT4: .word data_ov008_021b2ca8
