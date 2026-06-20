; func_ov002_022414ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afba0
        .extern func_ov002_021afffc
        .extern func_ov002_021b004c
        .extern func_ov002_021bc618
        .extern func_ov002_0223de04
        .extern func_ov002_022536e8
        .extern func_ov002_02257b48
        .extern func_ov002_0229cf10
        .global func_ov002_022414ec
        .arm
func_ov002_022414ec:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x100
    mov r7, r0
    ldrh r2, [r7]
    ldr r0, _LIT0
    mov r6, r1
    cmp r2, r0
    mov r5, #0x37
    bgt .L_1c8
    cmp r2, r0
    bge .L_2a0
    ldr r3, _LIT1
    cmp r2, r3
    bgt .L_170
    bge .L_274
    sub r0, r3, #0xdf
    cmp r2, r0
    bgt .L_148
    bge .L_280
    ldr r0, _LIT2
    cmp r2, r0
    moveq r4, #0x2a
    b .L_304
.L_148:
    sub r0, r3, #0xcc
    cmp r2, r0
    bgt .L_160
    moveq r5, #0x5a
    moveq r4, #0x9
    b .L_304
.L_160:
    sub r0, r3, #0x83
    cmp r2, r0
    beq .L_288
    b .L_304
.L_170:
    sub r1, r0, #0xe0
    cmp r2, r1
    bgt .L_198
    sub r0, r0, #0xe0
    cmp r2, r0
    bge .L_294
    add r0, r3, #0xc6
    cmp r2, r0
    beq .L_288
    b .L_304
.L_198:
    add r1, r3, #0x16c
    cmp r2, r1
    bgt .L_1b8
    mov r0, r1
    cmp r2, r0
    rsbeq r5, r3, #0x1680
    moveq r4, #0x8
    b .L_304
.L_1b8:
    sub r0, r0, #0x74
    cmp r2, r0
    beq .L_280
    b .L_304
.L_1c8:
    add r1, r0, #0x1ec
    cmp r2, r1
    bgt .L_228
    bge .L_280
    add r1, r0, #0x6f
    cmp r2, r1
    bgt .L_1f8
    bge .L_294
    add r0, r0, #0x69
    cmp r2, r0
    beq .L_280
    b .L_304
.L_1f8:
    add r1, r0, #0xdc
    cmp r2, r1
    bgt .L_214
    add r0, r0, #0xdc
    cmp r2, r0
    beq .L_2e0
    b .L_304
.L_214:
    ldr r0, _LIT3
    cmp r2, r0
    moveq r5, #0x4c
    moveq r4, #0xb
    b .L_304
.L_228:
    ldr r1, _LIT4
    cmp r2, r1
    bgt .L_248
    bge .L_2fc
    sub r0, r1, #0xf7
    cmp r2, r0
    beq .L_280
    b .L_304
.L_248:
    add r0, r1, #0x5
    cmp r2, r0
    bgt .L_260
    moveq r5, #0x4c
    moveq r4, #0x2a
    b .L_304
.L_260:
    add r0, r1, #0x45
    cmp r2, r0
    moveq r5, #0x4e
    moveq r4, #0x8
    b .L_304
.L_274:
    add r5, r5, #0xe6
    mov r4, #0x8
    b .L_304
.L_280:
    mov r4, #0x8
    b .L_304
.L_288:
    mov r5, #0x4e
    mov r4, #0x8
    b .L_304
.L_294:
    mov r5, #0x4c
    mov r4, #0x8
    b .L_304
.L_2a0:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x4
    movgt r0, #0x4
    bgt .L_2cc
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
.L_2cc:
    cmp r0, #0x20
    movge r0, #0x20
    ldr r5, _LIT5
    add r4, r0, #0x27
    b .L_304
.L_2e0:
    ldr r0, [r7, #0x14]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x20
    movcs r0, #0x20
    add r4, r0, #0x6
    b .L_304
.L_2fc:
    mov r5, #0x5a
    mov r4, #0x2a
.L_304:
    ldr r2, _LIT6
    ldr ip, [r2, #0x5b8]
    cmp ip, #0x0
    beq .L_328
    cmp ip, #0x1
    beq .L_3c0
    cmp ip, #0x2
    beq .L_3fc
    b .L_474
.L_328:
    cmp r4, #0x6
    blt .L_364
    cmp r4, #0x26
    bgt .L_364
    ldrh r0, [r7, #0x2]
    ldrh r1, [r7]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    sub r1, r4, #0x6
    cmp r0, r1
    addlt sp, sp, #0x100
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
.L_364:
    mov r0, r7
    mov r1, r6
    bl func_ov002_02257b48
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, sp, #0x0
    mov r1, r5
    sub r2, r4, #0x6
    bl func_ov002_0229cf10
    ldrh r0, [r7, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT6
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3c0:
    ldrh r0, [r7, #0x2]
    ldrh r2, [r7]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    ldr r1, _LIT6
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add sp, sp, #0x100
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    str r0, [r1, #0x5bc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3fc:
    ldr r3, [r2, #0x5bc]
    ldr r1, _LIT7
    add r0, r3, #0x1
    str r0, [r2, #0x5bc]
    ldr r1, [r1, #0xd44]
    cmp r3, r1
    bcs .L_460
    bl func_ov002_021b004c
    ldr r1, _LIT6
    mov r4, r0
    ldr r0, [r1, #0x5bc]
    bl func_ov002_021afffc
    bl func_ov002_021afba0
    ldr r3, [r4]
    mov r2, r0
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r1, r1, lsr #0x1f
    mov r3, r3, lsr #0x18
    mov r0, r7
    add r3, r1, r3, lsl #0x1
    bl func_ov002_0223de04
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_460:
    add r0, ip, #0x1
    str r0, [r2, #0x5b8]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_474:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00001788
_LIT1: .word 0x0000156a
_LIT2: .word 0x00001359
_LIT3: .word 0x0000196f
_LIT4: .word 0x00001b1d
_LIT5: .word 0x0000011d
_LIT6: .word data_ov002_022ce288
_LIT7: .word data_ov002_022d016c
