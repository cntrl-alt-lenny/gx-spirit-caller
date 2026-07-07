; func_ov002_02212864 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021d70f0
        .extern func_ov002_0221283c
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .global func_ov002_02212864
        .arm
func_ov002_02212864:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_b0
    cmp r0, #0x7f
    beq .L_8c
    cmp r0, #0x80
    bne .L_e0
    ldr r0, _LIT2
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x1e
    bl func_ov002_021ae3a4
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_8c:
    ldr r0, _LIT4
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT5
    bl func_ov002_02259204
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_b0:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_d8
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT4
    mov r2, #0x0
    mov r3, r1, lsl #0x1f
    ldr r1, [r0, #0xd78]
    mov r0, r3, lsr #0x1f
    bl func_ov002_021d70f0
.L_d8:
    mov r0, #0x80
    ldmia sp!, {r4, pc}
.L_e0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd664
_LIT1: .word data_ov002_022ce1a8
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf098
_LIT4: .word data_ov002_022d008c
_LIT5: .word func_ov002_0221283c
