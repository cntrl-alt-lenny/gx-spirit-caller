; func_ov002_022662e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021bc538
        .extern func_ov002_021be2a4
        .extern func_ov002_021bf1b4
        .extern func_ov002_021ca1d8
        .extern func_ov002_021d46ac
        .extern func_ov002_02253600
        .extern func_ov002_02259eb0
        .extern func_ov002_022626c4
        .extern func_ov002_022661fc
        .extern func_ov002_02266270
        .extern func_ov002_0227ab74
        .global func_ov002_022662e4
        .arm
func_ov002_022662e4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0xd38]
    ldr r4, [r0, #0xcec]
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_26c
    b .L_3c
    b .L_54
    b .L_c0
    b .L_ec
    b .L_124
    b .L_1b8
    b .L_1f4
    b .L_21c
.L_3c:
    ldr r2, [r0, #0xcf8]
    add r1, r1, #0x1
    str r2, [r0, #0xcfc]
    str r1, [r0, #0xd38]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_54:
    mov r0, r4
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_ac
    mov r0, r4
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    beq .L_ac
    ldr r1, _LIT1
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_02253600
    cmp r0, #0x0
    beq .L_ac
    ldr r1, _LIT2
    mov r0, r4
    bl func_ov002_021ae320
    ldr r0, _LIT0
    ldr r1, [r0, #0xd38]
    add r1, r1, #0x1
    str r1, [r0, #0xd38]
    b .L_b8
.L_ac:
    ldr r0, _LIT0
    mov r1, #0x8
    str r1, [r0, #0xd38]
.L_b8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c0:
    ldr r2, _LIT1
    mov r0, r4
    mov r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af8f0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd38]
    add r2, r2, #0x1
    str r2, [r1, #0xd38]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_ec:
    bl func_ov002_021afa94
    ldr r5, _LIT3
    mov r1, r0
    mov r0, r4
    mov r2, #0x1
    mov r3, #0x0
    str r5, [sp]
    bl func_ov002_0227ab74
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd38]
    add r2, r2, #0x1
    str r2, [r1, #0xd38]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_124:
    mov r0, r4
    bl func_ov002_02259eb0
    cmp r0, #0x0
    beq .L_1b0
    mov r0, r4
    bl func_ov002_022661fc
    rsb r7, r4, #0x1
    mov r6, r0
    mov r0, r7
    bl func_ov002_02266270
    mov r5, r0
    cmp r6, #0x0
    cmpge r5, #0x0
    blt .L_1b0
    mov r0, r4
    mov r1, r6
    mov r2, #0x1
    bl func_ov002_021be2a4
    cmp r0, #0x0
    beq .L_1b0
    mov ip, #0x1
    mov r0, r4
    mov r1, r6
    mov r2, r7
    mov r3, r5
    str ip, [sp]
    bl func_ov002_021bf1b4
    cmp r0, #0x0
    beq .L_1b0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd38]
    add r2, r2, #0x1
    str r2, [r1, #0xd38]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b8:
    ldr r1, [r0, #0xcfc]
    cmp r1, #0x3
    movne r1, #0x0
    strne r1, [r0, #0xd2c]
    bne .L_1d8
    mov r1, #0x1
    str r1, [r0, #0xd2c]
    mov r1, #0x0
.L_1d8:
    str r1, [r0, #0xd30]
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd38]
    add r2, r2, #0x1
    str r2, [r1, #0xd38]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1f4:
    mov r0, r4
    bl func_ov002_022626c4
    cmp r0, #0x0
    beq .L_214
    ldr r0, _LIT0
    ldr r1, [r0, #0xd38]
    add r1, r1, #0x1
    str r1, [r0, #0xd38]
.L_214:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_21c:
    ldr r0, [r0, #0xcfc]
    cmp r0, #0x3
    beq .L_254
    cmp r4, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    add r0, r0, #0xc
    orr r0, r0, r1
    mov r1, #0x0
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
.L_254:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd38]
    add r2, r2, #0x1
    str r2, [r1, #0xd38]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_26c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x0000151e
_LIT2: .word 0x0000011d
_LIT3: .word 0x151e0000
