; func_ov002_02241404 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afac0
        .extern func_ov002_021aff1c
        .extern func_ov002_021aff6c
        .extern func_ov002_021bc538
        .extern func_ov002_0223dd14
        .extern func_ov002_02253600
        .extern func_ov002_02257a60
        .extern func_ov002_0229ce00
        .global func_ov002_02241404
        .arm
func_ov002_02241404:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x100
    mov r7, r0
    ldrh r2, [r7]
    ldr r0, _LIT0
    mov r6, r1
    cmp r2, r0
    mov r5, #0x37
    bgt .L_dc
    cmp r2, r0
    bge .L_1b4
    ldr r3, _LIT1
    cmp r2, r3
    bgt .L_84
    bge .L_188
    sub r0, r3, #0xdf
    cmp r2, r0
    bgt .L_5c
    bge .L_194
    ldr r0, _LIT2
    cmp r2, r0
    moveq r4, #0x2a
    b .L_218
.L_5c:
    sub r0, r3, #0xcc
    cmp r2, r0
    bgt .L_74
    moveq r5, #0x5a
    moveq r4, #0x9
    b .L_218
.L_74:
    sub r0, r3, #0x83
    cmp r2, r0
    beq .L_19c
    b .L_218
.L_84:
    sub r1, r0, #0xe0
    cmp r2, r1
    bgt .L_ac
    sub r0, r0, #0xe0
    cmp r2, r0
    bge .L_1a8
    add r0, r3, #0xc6
    cmp r2, r0
    beq .L_19c
    b .L_218
.L_ac:
    add r1, r3, #0x16c
    cmp r2, r1
    bgt .L_cc
    mov r0, r1
    cmp r2, r0
    rsbeq r5, r3, #0x1680
    moveq r4, #0x8
    b .L_218
.L_cc:
    sub r0, r0, #0x74
    cmp r2, r0
    beq .L_194
    b .L_218
.L_dc:
    add r1, r0, #0x1ec
    cmp r2, r1
    bgt .L_13c
    bge .L_194
    add r1, r0, #0x6f
    cmp r2, r1
    bgt .L_10c
    bge .L_1a8
    add r0, r0, #0x69
    cmp r2, r0
    beq .L_194
    b .L_218
.L_10c:
    add r1, r0, #0xdc
    cmp r2, r1
    bgt .L_128
    add r0, r0, #0xdc
    cmp r2, r0
    beq .L_1f4
    b .L_218
.L_128:
    ldr r0, _LIT3
    cmp r2, r0
    moveq r5, #0x4c
    moveq r4, #0xb
    b .L_218
.L_13c:
    ldr r1, _LIT4
    cmp r2, r1
    bgt .L_15c
    bge .L_210
    sub r0, r1, #0xf7
    cmp r2, r0
    beq .L_194
    b .L_218
.L_15c:
    add r0, r1, #0x5
    cmp r2, r0
    bgt .L_174
    moveq r5, #0x4c
    moveq r4, #0x2a
    b .L_218
.L_174:
    add r0, r1, #0x45
    cmp r2, r0
    moveq r5, #0x4e
    moveq r4, #0x8
    b .L_218
.L_188:
    add r5, r5, #0xe6
    mov r4, #0x8
    b .L_218
.L_194:
    mov r4, #0x8
    b .L_218
.L_19c:
    mov r5, #0x4e
    mov r4, #0x8
    b .L_218
.L_1a8:
    mov r5, #0x4c
    mov r4, #0x8
    b .L_218
.L_1b4:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x4
    movgt r0, #0x4
    bgt .L_1e0
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
.L_1e0:
    cmp r0, #0x20
    movge r0, #0x20
    ldr r5, _LIT5
    add r4, r0, #0x27
    b .L_218
.L_1f4:
    ldr r0, [r7, #0x14]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x20
    movcs r0, #0x20
    add r4, r0, #0x6
    b .L_218
.L_210:
    mov r5, #0x5a
    mov r4, #0x2a
.L_218:
    ldr r2, _LIT6
    ldr ip, [r2, #0x5b8]
    cmp ip, #0x0
    beq .L_23c
    cmp ip, #0x1
    beq .L_2d4
    cmp ip, #0x2
    beq .L_310
    b .L_388
.L_23c:
    cmp r4, #0x6
    blt .L_278
    cmp r4, #0x26
    bgt .L_278
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    sub r1, r4, #0x6
    cmp r0, r1
    addlt sp, sp, #0x100
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
.L_278:
    mov r0, r7
    mov r1, r6
    bl func_ov002_02257a60
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, sp, #0x0
    mov r1, r5
    sub r2, r4, #0x6
    bl func_ov002_0229ce00
    ldrh r0, [r7, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r1, _LIT6
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2d4:
    ldrh r0, [r7, #0x2]
    ldrh r2, [r7]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af8f0
    ldr r1, _LIT6
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add sp, sp, #0x100
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    str r0, [r1, #0x5bc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_310:
    ldr r3, [r2, #0x5bc]
    ldr r1, _LIT7
    add r0, r3, #0x1
    str r0, [r2, #0x5bc]
    ldr r1, [r1, #0xd44]
    cmp r3, r1
    bcs .L_374
    bl func_ov002_021aff6c
    ldr r1, _LIT6
    mov r4, r0
    ldr r0, [r1, #0x5bc]
    bl func_ov002_021aff1c
    bl func_ov002_021afac0
    ldr r3, [r4]
    mov r2, r0
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r1, r1, lsr #0x1f
    mov r3, r3, lsr #0x18
    mov r0, r7
    add r3, r1, r3, lsl #0x1
    bl func_ov002_0223dd14
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_374:
    add r0, ip, #0x1
    str r0, [r2, #0x5b8]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_388:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00001788
_LIT1: .word 0x0000156a
_LIT2: .word 0x00001359
_LIT3: .word 0x0000196f
_LIT4: .word 0x00001b1d
_LIT5: .word 0x0000011d
_LIT6: .word data_ov002_022ce1a8
_LIT7: .word data_ov002_022d008c
