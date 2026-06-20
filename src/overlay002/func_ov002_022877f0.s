; func_ov002_022877f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce884
        .extern data_ov002_022cf16c
        .extern func_ov002_021ba6cc
        .extern func_ov002_021c1ef0
        .extern func_ov002_021c8470
        .global func_ov002_022877f0
        .arm
func_ov002_022877f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r8, _LIT0
    mov sl, r0
    ldr r0, [r8, #0x5d4]
    mov r7, #0x0
    cmp r0, #0x0
    bls .L_114
    ldr r9, _LIT1
    ldr r6, _LIT2
    ldr r4, _LIT3
    mov r5, r8
    mov fp, #0x14
.L_30:
    ldrb r0, [r8, #0x5dc]
    cmp r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    bne .L_fc
    ldrh r1, [sl, #0x2]
    ldr r0, [r9]
    mov r1, r1, lsl #0x1f
    mov r2, r0, lsl #0x16
    mov r1, r1, lsr #0x1f
    cmp r1, r2, lsr #0x1f
    mov r1, r2, lsr #0x1f
    beq .L_fc
    and r2, r1, #0x1
    mla r3, r2, r4, r6
    mov r0, r0, lsl #0x12
    mov r2, r0, lsr #0x1c
    mla r0, r2, fp, r3
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_fc
    mov r0, sl
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    beq .L_fc
    ldr r0, [r9]
    mov r2, r0, lsl #0x16
    mov r1, r0, lsl #0x12
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1c
    bl func_ov002_021c8470
    cmp r0, #0x7d0
    bgt .L_fc
    ldr r2, [r9]
    mov r0, r2, lsl #0x16
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r3, r1, r4, r6
    mov r1, r2, lsl #0x12
    mov r2, r1, lsr #0x1c
    mov r1, #0x14
    mla r1, r2, r1, r3
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021ba6cc
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fc:
    ldr r0, [r5, #0x5d4]
    add r7, r7, #0x1
    cmp r7, r0
    add r8, r8, #0x1
    add r9, r9, #0x4
    bcc .L_30
.L_114:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022ce884
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
