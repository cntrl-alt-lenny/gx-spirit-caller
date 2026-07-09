; func_ov002_0226c898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae320
        .extern func_ov002_021c9570
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_0226c494
        .extern func_ov002_0226c504
        .extern func_ov002_0226c5b8
        .extern func_ov002_0226c618
        .extern func_ov002_0226c6dc
        .extern func_ov002_0226c794
        .extern func_ov002_0226c840
        .extern func_ov002_022903f0
        .extern func_ov002_0229acd0
        .global func_ov002_0226c898
        .arm
func_ov002_0226c898:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r3, [r3, #0xd9c]
    mov r4, r1
    cmp r3, #0x0
    beq .L_28
    cmp r3, #0x1
    beq .L_1d0
    b .L_240
.L_28:
    ldr r3, _LIT1
    cmp r4, r3
    bgt .L_98
    bge .L_168
    sub r1, r3, #0x1a8
    cmp r4, r1
    bgt .L_58
    bge .L_ec
    sub r1, r3, #0x268
    cmp r4, r1
    beq .L_dc
    b .L_190
.L_58:
    ldr r3, _LIT2
    cmp r4, r3
    bgt .L_6c
    beq .L_13c
    b .L_190
.L_6c:
    add r1, r3, #0xf0
    cmp r4, r1
    bgt .L_190
    add r1, r3, #0xec
    cmp r4, r1
    blt .L_190
    beq .L_150
    add r1, r3, #0xf0
    cmp r4, r1
    beq .L_158
    b .L_190
.L_98:
    ldr r1, _LIT3
    cmp r4, r1
    bgt .L_b8
    bge .L_17c
    sub r0, r1, #0xec
    cmp r4, r0
    beq .L_168
    b .L_190
.L_b8:
    ldr r1, _LIT4
    cmp r4, r1
    bgt .L_cc
    beq .L_13c
    b .L_190
.L_cc:
    add r1, r1, #0xd9
    cmp r4, r1
    beq .L_184
    b .L_190
.L_dc:
    mov r1, #0x12
    bl func_ov002_021ae320
    ldr r2, _LIT5
    b .L_190
.L_ec:
    ldr ip, _LIT6
    rsb r1, r5, #0x1
    ldr r0, _LIT7
    str r1, [ip]
    ldrh r1, [r0, #0xa2]
    mov r0, #0xb
    mov r2, r5
    sub r3, r0, #0xc
    str r1, [ip, #0x1c]
    bl func_ov002_0229acd0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0xa
    bl func_ov002_0229acd0
    mov r0, r5
    mov r1, #0xde
    bl func_ov002_021ae320
    ldr r2, _LIT8
    b .L_190
.L_13c:
    mov r0, r5
    mov r1, #0x95
    bl func_ov002_021ae320
    ldr r2, _LIT9
    b .L_190
.L_150:
    ldr r2, _LIT10
    b .L_190
.L_158:
    mov r1, #0x4d
    bl func_ov002_021ae320
    ldr r2, _LIT11
    b .L_190
.L_168:
    mov r0, r5
    mov r1, #0x7b
    bl func_ov002_021ae320
    ldr r2, _LIT11
    b .L_190
.L_17c:
    ldr r2, _LIT12
    b .L_190
.L_184:
    mov r1, #0x7c
    bl func_ov002_021ae320
    ldr r2, _LIT13
.L_190:
    ldr r0, _LIT14
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x1
    bne .L_1b0
    mov r0, r5
    mov r1, r4
    bl func_ov002_022903f0
    b .L_1b8
.L_1b0:
    mov r0, r2
    bl func_ov002_02259204
.L_1b8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, pc}
.L_1d0:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_228
    ldr r0, _LIT0
    ldr r3, _LIT7
    ldr r1, [r0, #0xd74]
    ldr r2, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    add r4, r1, r2
    and r5, r0, #0xff
    and r4, r4, #0xff
    orr r4, r5, r4, lsl #0x8
    strh r4, [r3, #0xb0]
    bl func_ov002_021c9570
    ldr r2, _LIT7
    ldr r1, _LIT0
    strh r0, [r2, #0xb2]
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, pc}
.L_228:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    sub r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, pc}
.L_240:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00001544
_LIT2: .word 0x0000142a
_LIT3: .word 0x000016df
_LIT4: .word 0x000018b5
_LIT5: .word func_ov002_0226c494
_LIT6: .word data_ov002_022cd314
_LIT7: .word data_ov002_022d0d8c
_LIT8: .word func_ov002_0226c840
_LIT9: .word func_ov002_0226c504
_LIT10: .word func_ov002_0226c6dc
_LIT11: .word func_ov002_0226c5b8
_LIT12: .word func_ov002_0226c794
_LIT13: .word func_ov002_0226c618
_LIT14: .word data_ov002_022cd664
