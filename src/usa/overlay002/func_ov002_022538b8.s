; func_ov002_022538b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c8
        .extern data_ov002_022d008c
        .extern func_0202e1e0
        .extern func_ov002_021b9dec
        .extern func_ov002_021d8fd0
        .extern func_ov002_021e2fc4
        .global func_ov002_022538b8
        .arm
func_ov002_022538b8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    bl func_0202e1e0
    cmp r0, #0x0
    movne r7, #0x0
    movne r8, #0x4
    moveq r7, #0x5
    mov r0, #0x14
    mul fp, r7, r0
    moveq r8, #0x9
    mov r6, #0x0
.L_2c:
    ldr r0, _LIT0
    mov r5, r7
    ldr r0, [r0, #0xcec]
    cmp r7, r8
    eor r4, r0, r6
    bgt .L_134
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r0, r1, r0
    ldr r1, _LIT2
    str r0, [sp]
    add r0, r1, r0
    add r9, r0, fp
.L_60:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    cmp sl, r0
    bne .L_124
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_124
    ldr r1, [r9, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_124
    ldr r0, [r9, #0x3c]
    cmp r0, #0x0
    beq .L_124
    mov r0, #0x14
    mul r2, r5, r0
    ldr r3, _LIT2
    ldr r0, [sp]
    ldr r6, _LIT3
    add r0, r3, r0
    add r0, r0, #0x30
    ldr r8, [r0, r2]
    ldr r3, [sp]
    mov r0, r8, lsl #0x2
    mov r1, r4, lsl #0x1f
    mov r7, r0, lsr #0x18
    add r6, r6, r3
    and r1, r1, #-2147483648
    mov r3, r7, lsl #0x1
    mov r8, r8, lsl #0x12
    add r3, r3, r8, lsr #0x1f
    mov r0, r5, lsl #0x10
    orr r7, r1, #0x200000
    and r1, r0, #0x1f0000
    mov r3, r3, lsl #0x10
    mov r0, sl, lsl #0x10
    orr r1, r7, r1
    orr r0, r1, r0, lsr #0x10
    ldr r2, [r2, r6]
    mov r1, r3, lsr #0x10
    bl func_ov002_021e2fc4
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d8fd0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_124:
    add r5, r5, #0x1
    cmp r5, r8
    add r9, r9, #0x14
    ble .L_60
.L_134:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0c8
