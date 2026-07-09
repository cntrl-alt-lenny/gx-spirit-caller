; func_ov002_021b04f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd664
        .extern data_ov002_022cd888
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0b8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae674
        .extern func_ov002_021ae6c8
        .extern func_ov002_021b1378
        .extern func_ov002_021d46ac
        .global func_ov002_021b04f0
        .arm
func_ov002_021b04f0:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r4, [r0, #0x4]
    bl func_ov002_021ae6c8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT1
    ldr r0, [r1, #0xd20]
    cmp r0, #0x0
    beq .L_40
    cmp r0, #0x1
    beq .L_1ec
    cmp r0, #0x2
    beq .L_23c
    b .L_264
.L_40:
    ldr r0, [r1, #0xd0c]
    cmp r0, #0x0
    beq .L_70
    ldr r2, [r1, #0xcec]
    ldr r0, _LIT2
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x2
    bne .L_70
    mov r0, #0x2
    str r0, [r1, #0xd20]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_70:
    ldr r0, _LIT3
    ldr r1, [r0, #0x2c]
    cmp r1, #0x3
    ldrne r0, [r0, #0x894]
    cmpne r0, #0x3
    bne .L_d0
    ldr r0, _LIT4
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT5
    mov r1, #0x0
    ldr r0, [r0, r2]
    mov r2, r1
    cmp r0, #0x3
    moveq r0, r4
    rsbne r0, r4, #0x1
    cmp r0, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x6
    mov r0, r0, lsl #0x10
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
.L_d0:
    ldr r0, _LIT3
    ldr r1, [r0, #0x2c]
    cmp r1, #0x4
    ldrne r0, [r0, #0x894]
    cmpne r0, #0x4
    bne .L_130
    ldr r0, _LIT4
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT5
    mov r1, #0x0
    ldr r0, [r0, r2]
    mov r2, r1
    cmp r0, #0x4
    moveq r0, r4
    rsbne r0, r4, #0x1
    cmp r0, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x7
    mov r0, r0, lsl #0x10
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
.L_130:
    ldr r0, _LIT3
    ldr r1, [r0, #0x2c]
    cmp r1, #0x7
    ldrne r0, [r0, #0x894]
    cmpne r0, #0x7
    bne .L_190
    ldr r0, _LIT4
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT5
    mov r1, #0x0
    ldr r0, [r0, r2]
    mov r2, r1
    cmp r0, #0x7
    moveq r0, r4
    rsbne r0, r4, #0x1
    cmp r0, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x8
    mov r0, r0, lsl #0x10
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
.L_190:
    ldr r0, _LIT3
    ldr r1, _LIT1
    cmp r4, #0x0
    movne r4, #0x8000
    ldr r2, [r0, #0x2c]
    ldr r1, [r1, #0xd00]
    ldr r3, [r0, #0x894]
    moveq r4, #0x0
    orr r0, r4, #0x5
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    ldr r0, _LIT1
    ldr r1, [r0, #0xd20]
    add r1, r1, #0x1
    str r1, [r0, #0xd20]
    b .L_264
.L_1ec:
    ldr r0, _LIT6
    ldr r0, [r0, #0x808]
    cmp r0, #0x0
    bne .L_264
    ldr r0, [r1, #0xd0c]
    cmp r0, #0x0
    beq .L_224
    ldr r0, [r1, #0xd00]
    mov r2, #0x0
    mov r0, r0, lsl #0x10
    mov r3, r2
    mov r1, r0, lsr #0x10
    mov r0, #0x2
    bl func_ov002_021b1378
.L_224:
    bl func_ov002_021ae674
    ldr r0, _LIT1
    ldr r1, [r0, #0xd20]
    add r1, r1, #0x1
    str r1, [r0, #0xd20]
    b .L_264
.L_23c:
    ldr r0, [r1, #0xd0c]
    cmp r0, #0x0
    beq .L_25c
    ldr r0, _LIT7
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_264
.L_25c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_264:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd664
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf0b8
_LIT6: .word data_ov002_022ce870
_LIT7: .word data_ov002_022cd888
