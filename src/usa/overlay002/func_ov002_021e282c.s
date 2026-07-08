; func_ov002_021e282c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202de48
        .extern func_ov002_021b3ef8
        .extern func_ov002_021d46ac
        .extern func_ov002_021e277c
        .global func_ov002_021e282c
        .arm
func_ov002_021e282c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, #0x0
.L_8:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0, #0xcec]
    ldr r0, _LIT2
    eor r2, r2, fp
    and r2, r2, #0x1
    mla sl, r2, r0, r1
    ldr r0, [sl, #0x14]
    mov r7, #0x0
    cmp r0, #0x0
    bls .L_b8
    add r0, sl, #0x18
    add r8, r0, #0x400
    orr r0, r2, #0x58
    mov r0, r0, lsl #0x10
    orr r9, r2, #0x1c
    mov r5, r0, lsr #0x10
    mov r6, #0x3f
    mov r4, r7
.L_54:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202de48
    cmp r0, #0x3
    bne .L_a4
    ldr r2, [r8]
    mov r0, r6
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x16
    orr r1, r9, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r5
    mov r3, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_021d46ac
.L_a4:
    ldr r0, [sl, #0x14]
    add r7, r7, #0x1
    cmp r7, r0
    add r8, r8, #0x4
    bcc .L_54
.L_b8:
    add fp, fp, #0x1
    cmp fp, #0x2
    blt .L_8
    mov r0, #0x0
    str r0, [sp]
.L_cc:
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r3, [r0, #0xcec]
    ldr r0, [sp]
    ldr r1, _LIT2
    eor r9, r3, r0
    and r3, r9, #0x1
    mla r8, r3, r1, r2
    ldr r0, [r8, #0x10]
    mov sl, #0x0
    cmp r0, #0x0
    bls .L_1a8
    rsb r0, r9, #0x1
    and r0, r0, #0x1
    orr r0, r0, #0x5a
    mov r0, r0, lsl #0x10
    ldr r5, _LIT3
    add r6, r8, #0x260
    orr r7, r3, #0x1a
    mov r4, r0, lsr #0x10
    mov fp, #0xb
.L_120:
    ldr r1, [r6]
    mov r0, r1, lsl #0x13
    cmp r5, r0, lsr #0x13
    bne .L_194
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    mov r0, r9
    add r3, r1, r2, lsr #0x1f
    mov r1, fp
    mov r2, r5
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    beq .L_194
    ldr r2, [r6]
    mov r0, #0x3f
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x16
    orr r1, r7, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r4
    mov r1, r1, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d46ac
.L_194:
    ldr r0, [r8, #0x10]
    add sl, sl, #0x1
    cmp sl, r0
    add r6, r6, #0x4
    bcc .L_120
.L_1a8:
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_cc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x5b
    bl func_ov002_021d46ac
    ldr r0, _LIT0
    ldr r0, [r0, #0xcec]
    bl func_ov002_021e277c
    ldr r0, _LIT0
    ldr r0, [r0, #0xcec]
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word 0x000012a1
