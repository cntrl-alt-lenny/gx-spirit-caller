; func_ov002_0223fa60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ae320
        .extern func_ov002_0223f4cc
        .extern func_ov002_022574e0
        .extern func_ov002_022576f4
        .extern func_ov002_02259274
        .extern func_ov002_0228de2c
        .global func_ov002_0223fa60
        .arm
func_ov002_0223fa60:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r3, r2, lsl #0x12
    mov r3, r3, lsr #0x1e
    cmp r3, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    mov r3, r2, lsl #0x1f
    ldr r2, _LIT0
    mov r3, r3, lsr #0x1f
    ldr r2, [r2, r3, lsl #0x2]
    cmp r2, #0x1
    bne .L_4c8
    ldr r2, _LIT1
    bl func_ov002_0228de2c
    ldmia sp!, {r4, pc}
.L_4c8:
    ldr r2, _LIT2
    ldr r2, [r2, #0x5b8]
    cmp r2, #0x0
    bne .L_52c
    bl func_ov002_022576f4
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x65
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT2
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_52c:
    bl func_ov002_0223f4cc
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd664
_LIT1: .word 0x000010d3
_LIT2: .word data_ov002_022ce1a8
_LIT3: .word func_ov002_022574e0
