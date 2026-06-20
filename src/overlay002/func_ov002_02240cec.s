; func_ov002_02240cec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021b004c
        .extern func_ov002_0223de04
        .extern func_ov002_022536e8
        .global func_ov002_02240cec
        .arm
func_ov002_02240cec:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrh r2, [r5]
    ldr r3, _LIT0
    mov r0, #0x0
    cmp r2, r3
    bgt .L_288
    bge .L_2c8
    sub r1, r3, #0x21c
    cmp r2, r1
    bgt .L_27c
    bge .L_2c0
    sub r1, r3, #0x228
    cmp r2, r1
    beq .L_2b8
    b .L_2cc
.L_27c:
    cmp r2, #0x1480
    beq .L_2b8
    b .L_2cc
.L_288:
    ldr r1, _LIT1
    cmp r2, r1
    bgt .L_2a8
    bge .L_2c0
    ldr r1, _LIT2
    cmp r2, r1
    moveq r0, #0x3
    b .L_2cc
.L_2a8:
    ldr r1, _LIT3
    cmp r2, r1
    beq .L_2c8
    b .L_2cc
.L_2b8:
    mov r0, #0x2
    b .L_2cc
.L_2c0:
    mov r0, #0x5
    b .L_2cc
.L_2c8:
    mov r0, #0x1
.L_2cc:
    ldr r1, _LIT4
    ldr r3, [r1, #0x5b8]
    cmp r3, #0x3
    addls pc, pc, r3, lsl #0x2
    b .L_414
    b .L_2f0
    b .L_338
    b .L_380
    b .L_3b8
.L_2f0:
    ldrh r0, [r5, #0x2]
    mov r1, r2
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT5
    mov r2, #0x1
    str r2, [r0, #0xd44]
    ldr r1, _LIT4
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_338:
    ldr r0, _LIT5
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, #0x0
    str r0, [r1, #0x5bc]
    ldrh r0, [r5, #0x2]
    mov r1, #0x56
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT4
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_380:
    ldrh r4, [r5, #0x2]
    cmp r0, #0x20
    movge r0, #0x20
    add r1, r0, #0x27
    mov r0, r4, lsl #0x1f
    mov r3, #0x0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021af9d0
    ldr r1, _LIT4
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3b8:
    ldr r6, _LIT5
    mov r4, #0x0
    ldr r0, [r6, #0xd44]
    cmp r0, #0x0
    bls .L_40c
    mov r7, #0xe
.L_3d0:
    add r0, r4, #0x1
    bl func_ov002_021b004c
    ldr r1, [r0]
    mov r0, r5
    mov r3, r1, lsl #0x12
    mov r2, r1, lsl #0x2
    mov r1, r3, lsr #0x1f
    mov r3, r2, lsr #0x18
    mov r2, r7
    add r3, r1, r3, lsl #0x1
    bl func_ov002_0223de04
    ldr r0, [r6, #0xd44]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_3d0
.L_40c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_414:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00001515
_LIT1: .word 0x00001996
_LIT2: .word 0x0000183c
_LIT3: .word 0x00001b44
_LIT4: .word data_ov002_022ce288
_LIT5: .word data_ov002_022d016c
