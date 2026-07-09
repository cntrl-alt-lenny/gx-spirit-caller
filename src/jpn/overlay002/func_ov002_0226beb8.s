; func_ov002_0226beb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_0202b0ac
        .extern func_ov002_021ae320
        .extern func_ov002_021d86b4
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_0226bd54
        .extern func_ov002_022903f0
        .extern func_ov002_0229cd4c
        .global func_ov002_0226beb8
        .arm
func_ov002_0226beb8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x100
    ldr r2, _LIT0
    ldr r3, _LIT1
    ldr r2, [r2, #0xd9c]
    mov sl, r0
    mov r9, r1
    cmp r2, #0x0
    ldrh r5, [r3, #0xa2]
    beq .L_3c
    cmp r2, #0x1
    beq .L_22c
    cmp r2, #0x2
    beq .L_2ac
    b .L_2d4
.L_3c:
    ldr r0, _LIT2
    and r2, sl, #0x1
    mul r1, r2, r0
    mov r7, #0x0
    strh r7, [r3, #0xb0]
    strh r7, [r3, #0xb2]
    ldr r0, _LIT3
    strh r9, [r3, #0xb4]
    ldr r0, [r0, r1]
    mov r6, r7
    cmp r0, #0x0
    bls .L_a4
    ldr r0, _LIT4
    mov r4, #0xb
    add r8, r0, r1
.L_78:
    mov r0, sl
    mov r1, r4
    mov r2, r6
    bl func_ov002_0226bd54
    cmp r0, #0x0
    movne r7, #0x1
    bne .L_a4
    ldr r0, [r8, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    bcc .L_78
.L_a4:
    cmp r7, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, _LIT5
    cmp r9, r2
    bgt .L_108
    bge .L_1b8
    ldr r1, _LIT6
    cmp r9, r1
    bgt .L_e4
    bge .L_1e4
    sub r0, r1, #0x30
    cmp r9, r0
    beq .L_160
    b .L_1e4
.L_e4:
    add r0, r1, #0x21
    cmp r9, r0
    bgt .L_f8
    beq .L_170
    b .L_1e4
.L_f8:
    sub r0, r2, #0x63
    cmp r9, r0
    beq .L_180
    b .L_1e4
.L_108:
    ldr r1, _LIT7
    cmp r9, r1
    bgt .L_13c
    bge .L_180
    add r0, r2, #0xc
    cmp r9, r0
    bgt .L_12c
    beq .L_1c8
    b .L_1e4
.L_12c:
    sub r0, r1, #0xf0
    cmp r9, r0
    beq .L_190
    b .L_1e4
.L_13c:
    add r0, r1, #0xc5
    cmp r9, r0
    bgt .L_150
    beq .L_1b8
    b .L_1e4
.L_150:
    ldr r0, _LIT8
    cmp r9, r0
    beq .L_1d8
    b .L_1e4
.L_160:
    mov r0, sl
    mov r1, #0x1f
    bl func_ov002_021ae320
    b .L_1e4
.L_170:
    mov r0, sl
    mov r1, #0x2e
    bl func_ov002_021ae320
    b .L_1e4
.L_180:
    ldr r1, _LIT9
    mov r0, sl
    bl func_ov002_021ae320
    b .L_1e4
.L_190:
    mov r0, r5
    bl func_0202b0ac
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x60
    bl func_ov002_0229cd4c
    add r1, sp, #0x0
    mov r0, sl
    bl func_ov002_021ae320
    b .L_1e4
.L_1b8:
    mov r0, sl
    mov r1, #0x1f
    bl func_ov002_021ae320
    b .L_1e4
.L_1c8:
    mov r0, sl
    mov r1, #0xf3
    bl func_ov002_021ae320
    b .L_1e4
.L_1d8:
    mov r0, sl
    mov r1, #0x46
    bl func_ov002_021ae320
.L_1e4:
    ldr r0, _LIT10
    ldr r0, [r0, sl, lsl #0x2]
    cmp r0, #0x1
    bne .L_208
    ldr r2, _LIT11
    mov r0, sl
    mov r1, r9
    bl func_ov002_022903f0
    b .L_210
.L_208:
    ldr r0, _LIT11
    bl func_ov002_02259204
.L_210:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_22c:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_290
    ldr r2, _LIT4
    ldr r0, _LIT2
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr r3, [r2, #0xd78]
    add r0, r0, #0x120
    strh r3, [r1, #0xb0]
    ldr r4, [r0, r3, lsl #0x2]
    add sp, sp, #0x100
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, r4, lsr #0x1f
    strh r3, [r1, #0xb2]
    ldr r1, [r2, #0xd9c]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r2, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_290:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2ac:
    ldrh r2, [r3, #0xb2]
    mov r1, #0xb
    bl func_ov002_021d86b4
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2d4:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf098
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x000015dc
_LIT6: .word 0x0000135b
_LIT7: .word 0x000017c3
_LIT8: .word 0x00001a19
_LIT9: .word 0x0000011e
_LIT10: .word data_ov002_022cd664
_LIT11: .word func_ov002_0226bd54
