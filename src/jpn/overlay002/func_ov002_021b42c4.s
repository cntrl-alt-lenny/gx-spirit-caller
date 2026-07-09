; func_ov002_021b42c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0cc
        .extern func_ov002_021b9dec
        .global func_ov002_021b42c4
        .arm
func_ov002_021b42c4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldrh r3, [r0]
    ldrh r0, [r0, #0x2]
    mov r7, r1
    mov r1, r3, asr #0x8
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    mov r6, r2
    cmp r0, #0xd
    and r4, r3, #0xff
    and r5, r1, #0xff
    addls pc, pc, r0, lsl #0x2
    b .L_24c
    b .L_24c
    b .L_24c
    b .L_24c
    b .L_24c
    b .L_24c
    b .L_24c
    b .L_9c
    b .L_9c
    b .L_9c
    b .L_9c
    b .L_6c
    b .L_6c
    b .L_6c
    b .L_6c
.L_6c:
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_24c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_9c:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9dec
    ldr r3, _LIT2
    cmp r0, r3
    bgt .L_13c
    bge .L_1d4
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_f8
    bge .L_220
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_e8
    bge .L_220
    sub r1, r1, #0x140
    cmp r0, r1
    beq .L_1d4
    b .L_24c
.L_e8:
    rsb r1, r1, #0x25c0
    cmp r0, r1
    beq .L_1d4
    b .L_24c
.L_f8:
    add r1, r2, #0x10c
    cmp r0, r1
    bgt .L_118
    bge .L_220
    add r1, r2, #0xc2
    cmp r0, r1
    beq .L_220
    b .L_24c
.L_118:
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_12c
    beq .L_204
    b .L_24c
.L_12c:
    add r1, r1, #0xa0
    cmp r0, r1
    beq .L_220
    b .L_24c
.L_13c:
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_17c
    bge .L_218
    add r1, r3, #0x94
    cmp r0, r1
    bgt .L_16c
    bge .L_220
    add r1, r3, #0x58
    cmp r0, r1
    beq .L_1d4
    b .L_24c
.L_16c:
    rsb r1, r2, #0x32c0
    cmp r0, r1
    beq .L_220
    b .L_24c
.L_17c:
    add r1, r2, #0x91
    cmp r0, r1
    bgt .L_19c
    bge .L_1d4
    add r1, r2, #0x49
    cmp r0, r1
    beq .L_1d4
    b .L_24c
.L_19c:
    add r1, r2, #0xaf
    cmp r0, r1
    bgt .L_1c4
    add r1, r2, #0xae
    cmp r0, r1
    blt .L_24c
    addne r1, r2, #0xaf
    cmpne r0, r1
    beq .L_1d4
    b .L_24c
.L_1c4:
    add r1, r2, #0x178
    cmp r0, r1
    beq .L_220
    b .L_24c
.L_1d4:
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT7
    and r3, r4, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_24c
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_204:
    cmp r7, #0x0
    cmpne r6, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_218:
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_220:
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT7
    and r3, r4, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_24c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x000017b7
_LIT3: .word 0x000013f0
_LIT4: .word 0x00001243
_LIT5: .word 0x00001602
_LIT6: .word 0x000019ed
_LIT7: .word data_ov002_022cf0cc
