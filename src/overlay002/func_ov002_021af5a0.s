; func_ov002_021af5a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cdc78
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern data_ov002_022d0650
        .extern func_ov002_021aeb00
        .extern func_ov002_021aec04
        .extern func_ov002_021d479c
        .extern func_ov002_0229ade0
        .global func_ov002_021af5a0
        .arm
func_ov002_021af5a0:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x100
    ldr r4, _LIT0
    mov r0, #0x1f40
    str r0, [r4]
    mov r1, #0x0
    str r0, [r4, #0x868]
    mov r0, #0x1
    str r0, [r4, #0x4]
    mov r2, r1
    mov r3, r1
    str r0, [r4, #0x86c]
    bl func_ov002_021d479c
    add r0, sp, #0x0
    add r2, sp, #0x128
    mov r1, #0x100
    bl func_ov002_021aeb00
    cmp r0, #0x0
    beq .L_a20
    add r6, sp, #0x0
    mov r5, #0x100
    add r4, sp, #0x128
.L_9f8:
    mov r0, r6
    bl func_ov002_021aec04
    cmp r0, #0x0
    bne .L_a20
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021aeb00
    cmp r0, #0x0
    bne .L_9f8
.L_a20:
    ldr r0, _LIT0
    mov r6, #0x0
    ldr r1, [r0, #0x4]
    sub r1, r1, #0x1
    str r1, [r0, #0x8]
    ldr r1, [r0, #0x86c]
    sub r1, r1, #0x1
    str r1, [r0, #0x870]
.L_a40:
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r6, #0x1
    mla r9, r1, r0, r2
    mov r5, #0x2000
    add r8, r9, #0x30
    mov r7, #0x0
    rsb r5, r5, #0x0
    mov fp, #0x8000
    mov r4, #0xa
.L_a68:
    ldr r0, [r8]
    mov r1, r0, lsl #0x13
    movs r2, r1, lsr #0x13
    beq .L_b04
    and r0, r0, r5
    str r0, [r8]
    ldrh r1, [r9, #0x38]
    ldrh r3, [r9, #0x36]
    cmp r6, #0x0
    movne r0, fp
    mla r1, r3, r4, r1
    moveq r0, #0x0
    orr r0, r0, #0x44
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    and sl, r7, #0xff
    mov r3, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r1, sl
    bl func_ov002_021d479c
    ldr r2, [r9, #0x3c]
    cmp r2, #0x0
    beq .L_b04
    cmp r6, #0x0
    movne r0, #0x8000
    mov r3, r2, lsr #0x10
    moveq r0, #0x0
    orr r0, r0, #0x3a
    mov r0, r0, lsl #0x10
    mov r1, sl, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
.L_b04:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r8, r8, #0x14
    add r9, r9, #0x14
    ble .L_a68
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_a40
    ldr r9, _LIT2
    mov r8, #0x0
    ldr r0, [r9, #0xc]
    cmp r0, #0x0
    bls .L_bb8
    ldr r6, _LIT3
    mov r4, r8
    mov r5, #0x8000
    mov sl, r8
.L_b48:
    add r0, r8, #0x1
    add r7, r6, r0, lsl #0x3
    ldrh r1, [r7, #0x2]
    ldrh r0, [r7, #0x4]
    mov r1, r1, lsl #0x1c
    tst r0, #0xff
    movne r3, r5
    mov r2, r0, asr #0x8
    mov r1, r1, lsr #0x1c
    moveq r3, r4
    orr r0, r3, #0x36
    mov r0, r0, lsl #0x10
    and r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    ldrh r2, [r7]
    mov r3, sl
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d479c
    ldrh r1, [r7, #0x2]
    ldr r0, [r9, #0xc]
    add r8, r8, #0x1
    bic r1, r1, #0xf
    strh r1, [r7, #0x2]
    cmp r8, r0
    bcc .L_b48
.L_bb8:
    ldr r0, _LIT4
    ldr r1, _LIT2
    ldr r2, [r0, #0x10]
    mov r3, #0x0
    str r3, [r1, #0xc]
    ldr r0, _LIT5
    cmp r2, #0x0
    str r2, [r0, #0xcec]
    ldr r0, _LIT1
    and r1, r2, #0x1
    mul r2, r1, r0
    ldr r0, _LIT6
    movne r3, #0x8000
    ldr r1, [r0, r2]
    orr r3, r3, #0x55
    mov r2, r1, lsl #0x10
    mov r0, r3, lsl #0x10
    mov r1, #0x0
    mov r3, r1
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d479c
    ldr r0, _LIT5
    ldr r0, [r0, #0xcec]
    rsbs r1, r0, #0x1
    movne r3, #0x8000
    moveq r3, #0x0
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT6
    orr r3, r3, #0x55
    ldr r1, [r0, r2]
    mov r0, r3, lsl #0x10
    mov r2, r1, lsl #0x10
    mov r1, #0x0
    mov r3, r1
    mov r0, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_021d479c
    ldr r1, _LIT0
    mov r3, #0x0
    str r3, [r1, #0xc]
    ldr r0, _LIT5
    str r3, [r1, #0x874]
    ldr r0, [r0, #0xd04]
    cmp r0, #0x3
    bne .L_cd0
    ldr r0, _LIT4
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    mov r2, r1
    cmp r0, #0x0
    ldr r0, _LIT5
    movne r3, #0x8000
    ldr r0, [r0, #0xcf8]
    add r0, r0, #0xb
    orr r0, r0, r3
    mov r0, r0, lsl #0x10
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    mov r1, #0x0
    ldr r4, _LIT5
    mov r5, #0x7
    mov r3, r1
    mov r0, #0x66
    mov r2, #0x5
    str r5, [r4, #0xcf8]
    bl func_ov002_021d479c
.L_cd0:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0]
    mov r3, r1
    mov r0, #0xd
    bl func_ov002_0229ade0
    ldr r1, _LIT0
    mov r0, #0xd
    ldr r2, [r1, #0x868]
    mov r1, #0x1
    mov r3, #0x0
    bl func_ov002_0229ade0
    mov r1, #0x0
    mov r3, r1
    mov r0, #0x14
    mov r2, #0xd
    bl func_ov002_0229ade0
    mov r0, #0x14
    mov r1, #0x1
    mov r2, #0xd
    mov r3, #0x0
    bl func_ov002_0229ade0
    mov r0, #0x14
    mov r1, #0x0
    mov r2, #0xc
    mov r3, r1
    bl func_ov002_0229ade0
    mov r0, #0x14
    mov r1, #0x1
    mov r2, #0xc
    mov r3, #0x0
    bl func_ov002_0229ade0
    mov r0, #0x14
    mov r1, #0x0
    mov r2, #0xe
    mov r3, r1
    bl func_ov002_0229ade0
    mov r0, #0x14
    mov r1, #0x1
    mov r2, #0xe
    mov r3, #0x0
    bl func_ov002_0229ade0
    mov r0, #0x14
    mov r1, #0x0
    mov r2, #0xf
    mov r3, r1
    bl func_ov002_0229ade0
    mov r0, #0x14
    mov r1, #0x1
    mov r2, #0xf
    mov r3, #0x0
    bl func_ov002_0229ade0
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cdc78
_LIT3: .word data_ov002_022d0650
_LIT4: .word data_ov002_022cd73c
_LIT5: .word data_ov002_022d016c
_LIT6: .word data_ov002_022cf178
