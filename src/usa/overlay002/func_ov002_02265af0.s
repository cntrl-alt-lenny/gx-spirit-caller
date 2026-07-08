; func_ov002_02265af0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern func_ov002_021b3dec
        .extern func_ov002_021d46ac
        .extern func_ov002_021e2c30
        .extern func_ov002_0229cc4c
        .global func_ov002_02265af0
        .arm
func_ov002_02265af0:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0xd20]
    ldr r4, [r0, #0xcec]
    cmp r1, #0x0
    beq .L_a38
    cmp r1, #0x1
    beq .L_a94
    b .L_b48
.L_a38:
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    mov r1, #0x0
    orr r0, r0, #0x2
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
    ldr r0, _LIT1
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_a7c
    ldr r0, _LIT2
    mov r1, #0x218
    bl func_ov002_0229cc4c
.L_a7c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd20]
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r4, pc}
.L_a94:
    ldr r2, _LIT3
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_abc
    mov r0, r4
    mov r1, #0x18
    mov r2, #0x1
    bl func_ov002_021e2c30
.L_abc:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd04]
    cmp r1, #0x1
    beq .L_b08
    ldr r1, [r0, #0xcf4]
    ldr r2, [r0, #0xcf0]
    add r0, r1, #0x1
    cmp r2, r0
    bne .L_b08
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0xb
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, #0x1
    bl func_ov002_021d46ac
.L_b08:
    ldr r0, _LIT0
    ldr r1, [r0, #0xcf4]
    ldr r2, [r0, #0xcf0]
    add r0, r1, #0x4
    cmp r2, r0
    bne .L_b48
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0xb
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, #0x2
    bl func_ov002_021d46ac
.L_b48:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022cd444
_LIT3: .word 0x00001356
