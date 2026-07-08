; func_ov002_02292c9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf1a8
        .extern func_0202e1e0
        .extern func_02030538
        .extern func_ov002_021bc538
        .extern func_ov002_021c37e4
        .extern func_ov002_0227d570
        .extern func_ov002_0228d434
        .extern func_ov002_02292c94
        .global func_ov002_02292c9c
        .arm
func_ov002_02292c9c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    mov r1, r1, lsr #0x11
    tst r1, #0x1
    bne .L_174
    mov r2, #0x1
    ldr r1, _LIT2
    mov r3, r2
    bl func_ov002_0228d434
    movs r6, r0
    movmi r0, #0x0
    ldmmiia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    ldr r4, _LIT0
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r0, r2, r4
    ldr r1, [r1, r0]
    mov r7, #0x0
    cmp r1, #0x0
    bls .L_174
    ldr r5, _LIT4
    mov r9, r7
    mov fp, #0x1
.L_88:
    add r0, r5, r0
    add r0, r0, r9
    ldr r0, [r0, #0x120]
    cmp r7, r6
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    beq .L_148
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_148
    mov r0, r8
    bl func_02030538
    cmp r0, #0x0
    bne .L_148
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_148
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r2, r1, r4, r5
    add r1, r2, #0x120
    ldr r2, [r1, r9]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c37e4
    cmp r0, #0x7
    blt .L_13c
    ldrh r0, [sl, #0x2]
    mov r1, fp
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227d570
    cmp r0, #0x0
    blt .L_148
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13c:
    cmp r0, #0x5
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_148:
    ldrh r0, [sl, #0x2]
    add r7, r7, #0x1
    add r9, r9, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mul r0, r1, r4
    add r1, r5, r0
    ldr r1, [r1, #0xc]
    cmp r7, r1
    bcc .L_88
.L_174:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word func_ov002_02292c94
_LIT3: .word data_ov002_022cf098
_LIT4: .word data_ov002_022cf08c
