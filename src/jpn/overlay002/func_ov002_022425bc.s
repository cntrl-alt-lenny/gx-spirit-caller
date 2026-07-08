; func_ov002_022425bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_0223dbd0
        .extern func_ov002_0223e12c
        .extern func_ov002_022574e0
        .extern func_ov002_022576f4
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0228de2c
        .global func_ov002_022425bc
        .arm
func_ov002_022425bc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x5b8]
    mov r4, r1
    cmp r2, #0x0
    beq .L_30
    cmp r2, #0x1
    beq .L_88
    cmp r2, #0x2
    beq .L_d4
    b .L_12c
.L_30:
    ldr r2, _LIT1
    ldr r1, [r2]
    ldr r2, [r2, #0x1c]
    bl func_ov002_0223dbd0
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_70
    ldrh r2, [r5]
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228de2c
    ldmia sp!, {r3, r4, r5, pc}
.L_70:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_88:
    bl func_ov002_022576f4
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223e12c
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_d4:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_114
    ldr r1, _LIT4
    mov r0, r5
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dbd0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_114:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_12c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd314
_LIT2: .word data_ov002_022cd664
_LIT3: .word func_ov002_022574e0
_LIT4: .word data_ov002_022d008c
