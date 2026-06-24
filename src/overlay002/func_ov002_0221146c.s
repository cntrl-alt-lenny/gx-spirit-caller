; func_ov002_0221146c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c8940
        .extern func_ov002_021d59cc
        .extern func_ov002_021e2d94
        .global func_ov002_0221146c
        .arm
func_ov002_0221146c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x4]
    mov r1, r0, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r2, [sl, #0x2]
    mov r4, r0, lsl #0x11
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov r6, r2, lsl #0x1a
    mul r2, r3, r1
    mov r1, r6, lsr #0x1b
    mov r3, #0x14
    ldr r5, _LIT1
    mul r3, r1, r3
    add r5, r5, r2
    add r5, r5, #0x30
    ldr r5, [r5, r3]
    mov r6, r4, lsr #0x17
    mov r4, r5, lsl #0x2
    mov r4, r4, lsr #0x18
    mov r5, r5, lsl #0x12
    mov r4, r4, lsl #0x1
    add r4, r4, r5, lsr #0x1f
    cmp r6, r4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, _LIT2
    add r2, r4, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2d94
    mov r6, #0x0
    ldr fp, _LIT1
    mov r5, r6
    mov r4, #0x7
.L_b0:
    ldr r0, _LIT0
    and r1, r6, #0x1
    mla r9, r1, r0, fp
    mov r7, #0x0
    add r8, r9, #0x30
.L_c4:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r9, #0x38]
    cmpne r0, #0x0
    beq .L_12c
    mov r0, r6
    mov r1, r7
    bl func_ov002_021c8940
    cmp r0, #0x2
    bne .L_12c
    str r5, [sp]
    ldrh r2, [sl, #0x2]
    mov r0, r6
    mov r1, r7
    mov r3, r2, lsl #0x1f
    mov r2, r2, lsl #0x1a
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r3, r4
    mov r2, r2, lsr #0x10
    bl func_ov002_021d59cc
.L_12c:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x14
    add r9, r9, #0x14
    blt .L_c4
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_b0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
