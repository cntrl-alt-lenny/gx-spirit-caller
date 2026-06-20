; func_ov002_022705f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a6
        .extern data_ov002_022d0650
        .extern func_ov002_021b9bd4
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc288
        .extern func_ov002_021bc618
        .extern func_ov002_021bc8c8
        .global func_ov002_022705f8
        .arm
func_ov002_022705f8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    add r5, r1, r2
    mov r6, r0
    mov r8, #0x0
    cmp r5, #0x4
    movgt r0, r8
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    mov r1, r6
    ldr r0, [r0]
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, r8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9ecc
    ldr r1, _LIT1
    cmp r0, r1
    movne r0, r8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    bne .L_524
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r6
    movne r0, r8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r6
    mov r1, r5
    bl func_ov002_021bc288
    cmp r0, #0x0
    moveq r0, r8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_524:
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r2, r0, lsr #0x11
    cmp r2, r1
    beq .L_55c
    add r0, r1, #0x1
    cmp r2, r0
    beq .L_564
    add r0, r1, #0xb
    cmp r2, r0
    moveq r8, #0x6
    b .L_568
.L_55c:
    mov r8, #0x2
    b .L_568
.L_564:
    mov r8, #0x4
.L_568:
    ldr r4, _LIT3
    mov r0, #0x14
    ldr r2, _LIT4
    and r3, r6, #0x1
    mul r1, r5, r0
    mla r0, r3, r4, r2
    ldrh r7, [r1, r0]
    cmp r7, #0x0
    beq .L_60c
    ldr r5, _LIT5
    ldr r6, _LIT6
    ldr sl, _LIT7
    mov r9, #0x14
.L_59c:
    add r1, r6, r7, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r7, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0xa
    bne .L_604
    ldrh r3, [r1]
    and r0, r3, #0xff
    and r1, r0, #0x1
    mla r2, r1, r4, r5
    mov r1, r3, asr #0x8
    and r1, r1, #0xff
    mla r3, r1, r9, r2
    ldr r2, [r3, #0x30]
    mov r2, r2, lsl #0x13
    cmp sl, r2, lsr #0x13
    bne .L_604
    ldr r2, [r3, #0x40]
    mov r2, r2, lsr #0x6
    tst r2, #0x1
    bne .L_604
    bl func_ov002_021b9bd4
    cmp r0, r8
    movge r0, #0x800
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_604:
    cmp r7, #0x0
    bne .L_59c
.L_60c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x000010bc
_LIT2: .word 0x00000fde
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf1a6
_LIT5: .word data_ov002_022cf16c
_LIT6: .word data_ov002_022d0650
_LIT7: .word 0x00000fee
