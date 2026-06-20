; func_ov002_022a10fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_ov002_022cbdbc
        .extern data_ov002_022cbdc4
        .extern data_ov002_022cbdcc
        .extern data_ov002_022cbdd4
        .extern func_02001d0c
        .extern func_02001e94
        .extern func_02005188
        .extern func_020051cc
        .extern func_020054a4
        .extern func_0202b7cc
        .extern func_0202b7ec
        .extern func_0202b830
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern func_02094504
        .extern func_020a978c
        .extern func_020aadf8
        .extern func_ov002_021afaf0
        .extern func_ov002_021afbd4
        .extern func_ov002_0229cfa0
        .extern func_ov002_022a0f8c
        .extern func_ov002_022abf88
        .extern func_ov002_022ac028
        .extern func_ov002_022ac67c
        .global func_ov002_022a10fc
        .arm
func_ov002_022a10fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x108
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    cmp r0, #0xc
    addls pc, pc, r0, lsl #0x2
    b .L_4c0
    b .L_4c0
    b .L_4c0
    b .L_4c0
    b .L_3bc
    b .L_4c0
    b .L_128
    b .L_1fc
    b .L_4c0
    b .L_4c0
    b .L_594
    b .L_2e8
    b .L_4c0
    b .L_54
.L_54:
    ldr r1, [r5, #0x30]
    mov r0, #0x1a
    mul r0, r1, r0
    add r6, r0, #0x1
    bl func_0208de4c
    ldr r2, [r5, #0x30]
    mov r1, #0x680
    rsb r3, r2, #0x12
    add r7, r0, r6, lsl #0x6
    mul r2, r3, r1
    mov r1, r7
    mov r0, #0x0
    bl func_02094504
    ldr r8, [r5, #0x30]
    bl func_0208e0a0
    add r5, r0, r8, lsl #0x6
    rsb r0, r8, #0x12
    mov r2, r0, lsl #0x6
    mov r0, #0x0
    mov r1, r5
    bl func_02094504
    ldr r1, _LIT0
    mov r2, r4
    add r0, sp, #0x88
    bl func_020a978c
    ldr r0, _LIT1
    mov r1, #0x1a
    mov r2, #0x12
    bl func_02001d0c
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    mov r2, r7
    add r1, sp, #0x88
    mov r3, #0x68
    bl func_020051cc
    ldr r0, _LIT1
    mov r2, r6
    add r1, r5, #0x46
    mov r3, #0x0
    bl func_02001e94
    ldr r1, _LIT2
    add sp, sp, #0x108
    strh r1, [r5, #0x5c]
    add r0, r1, #0x1
    strh r0, [r5, #0x5e]
    add r0, r1, #0x2
    strh r0, [r5, #0x9c]
    add r0, r1, #0x3
    strh r0, [r5, #0x9e]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_128:
    ldr r1, [r5, #0x30]
    mov r0, #0x1a
    mul r0, r1, r0
    add r6, r0, #0xb9
    bl func_0208de4c
    ldr r2, [r5, #0x30]
    mov r1, #0x680
    rsb r3, r2, #0x12
    add r7, r0, r6, lsl #0x6
    mul r2, r3, r1
    mov r1, r7
    mov r0, #0x0
    bl func_02094504
    ldr r8, [r5, #0x30]
    bl func_0208e0a0
    add r1, r8, #0x4
    add r5, r0, r1, lsl #0x6
    rsb r0, r8, #0x12
    mov r2, r0, lsl #0x6
    mov r0, #0x0
    mov r1, r5
    bl func_02094504
    add r0, r4, #0x1
    bl func_0202b7ec
    mov r2, r0
    ldr r1, _LIT3
    add r0, sp, #0x88
    bl func_020a978c
    ldr r0, _LIT1
    mov r1, #0x1a
    mov r2, #0x2
    bl func_02001d0c
    add r0, sp, #0x88
    mov r1, #0xc
    bl func_020054a4
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x68
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    mov r2, r7
    add r1, sp, #0x88
    bl func_02005188
    ldr r0, _LIT1
    add r1, r5, #0x6
    mov r2, r6
    mov r3, #0x0
    bl func_02001e94
    add sp, sp, #0x108
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1fc:
    ldr r1, [r5, #0x30]
    mov r0, #0x1a
    mul r0, r1, r0
    add r6, r0, #0x49
    bl func_0208de4c
    ldr r2, [r5, #0x30]
    mov r1, #0x680
    rsb r3, r2, #0x12
    add r7, r0, r6, lsl #0x6
    mul r2, r3, r1
    mov r1, r7
    mov r0, #0x0
    bl func_02094504
    ldr r9, [r5, #0x30]
    bl func_0208e0a0
    add r1, r9, #0x2
    add r8, r0, r1, lsl #0x6
    rsb r0, r9, #0x12
    mov r2, r0, lsl #0x6
    mov r0, #0x0
    mov r1, r8
    bl func_02094504
    mov r0, r5
    mov r1, r4
    bl func_ov002_022a0f8c
    add r0, r0, r0, lsl #0x1
    rsb r5, r0, #0x4
    add r0, r4, #0x1
    bl func_0202b830
    mov r3, r0
    ldr r1, _LIT4
    mov r2, r5
    add r0, sp, #0x88
    bl func_020a978c
    ldr r0, _LIT1
    mov r1, #0x1a
    mov r2, #0x2
    bl func_02001d0c
    add r0, sp, #0x88
    mov r1, #0xc
    bl func_020054a4
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x68
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    mov r2, r7
    add r1, sp, #0x88
    bl func_02005188
    ldr r0, _LIT1
    add r1, r8, #0x6
    mov r2, r6
    mov r3, #0x0
    bl func_02001e94
    add sp, sp, #0x108
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2e8:
    ldr r1, [r5, #0x30]
    mov r0, #0x1a
    mul r0, r1, r0
    add r6, r0, #0x1
    bl func_0208de4c
    ldr r2, [r5, #0x30]
    mov r1, #0x680
    rsb r3, r2, #0x12
    add r7, r0, r6, lsl #0x6
    mul r2, r3, r1
    mov r1, r7
    mov r0, #0x0
    bl func_02094504
    ldr r9, [r5, #0x30]
    bl func_0208e0a0
    add r8, r0, r9, lsl #0x6
    rsb r0, r9, #0x12
    mov r2, r0, lsl #0x6
    mov r0, #0x0
    mov r1, r8
    bl func_02094504
    mov r0, #0x40
    strb r0, [sp, #0x88]
    mov r0, #0x31
    strb r0, [sp, #0x89]
    ldr r0, [r5, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0202b7cc
    mov r1, r0
    mov r2, r4
    add r0, sp, #0x8a
    bl func_020a978c
    ldr r0, _LIT1
    mov r1, #0x1a
    mov r2, #0x2
    bl func_02001d0c
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    mov r2, r7
    add r1, sp, #0x88
    mov r3, #0x0
    bl func_020051cc
    ldr r0, _LIT1
    add r1, r8, #0x18
    mov r2, r6
    mov r3, #0x0
    bl func_02001e94
    add sp, sp, #0x108
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_3bc:
    ldr r1, [r5, #0x30]
    mov r0, #0x1a
    mul r0, r1, r0
    add r6, r0, #0x1
    bl func_0208de4c
    ldr r2, [r5, #0x30]
    mov r1, #0x680
    rsb r3, r2, #0x12
    add r7, r0, r6, lsl #0x6
    mul r2, r3, r1
    mov r1, r7
    mov r0, #0x0
    bl func_02094504
    ldr r9, [r5, #0x30]
    bl func_0208e0a0
    add r8, r0, r9, lsl #0x6
    rsb r0, r9, #0x12
    mov r2, r0, lsl #0x6
    mov r0, #0x0
    mov r1, r8
    bl func_02094504
    mov r0, r4
    bl func_ov002_021afbd4
    movs r9, r0
    addeq sp, sp, #0x108
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_022a0f8c
    cmp r0, #0x0
    mov r0, r9
    bne .L_460
    bl func_0202b7cc
    mov r1, r0
    add r0, sp, #0x8
    bl func_ov002_0229cfa0
    ldr r1, _LIT5
    add r0, sp, #0x88
    add r2, sp, #0x8
    bl func_020a978c
    b .L_470
.L_460:
    bl func_0202b7cc
    mov r1, r0
    add r0, sp, #0x88
    bl func_020aadf8
.L_470:
    ldr r0, _LIT1
    mov r1, #0x18
    mov r2, #0x12
    bl func_02001d0c
    mov r3, #0x5
    str r3, [sp]
    mov r4, #0xc
    ldr r0, _LIT1
    add r1, sp, #0x88
    mov r2, r7
    mov r3, #0x0
    str r4, [sp, #0x4]
    bl func_02005188
    ldr r0, _LIT1
    mov r2, r6
    add r1, r8, #0x88
    mov r3, #0x0
    bl func_02001e94
    add sp, sp, #0x108
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_4c0:
    cmp r0, #0x0
    addge sp, sp, #0x108
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abf88
    str r0, [r5, #0x10]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r5, #0x10]
    str r4, [r5, #0x20]
    ldr r0, [r5, #0x28]
    cmp r4, r0
    bge .L_50c
    str r4, [r5, #0x28]
    mov r0, r5
    str r4, [r5, #0x234]
    bl func_ov002_022ac67c
    b .L_52c
.L_50c:
    add r0, r0, #0x6
    cmp r4, r0
    blt .L_52c
    sub r1, r4, #0x5
    str r1, [r5, #0x28]
    mov r0, r5
    str r1, [r5, #0x234]
    bl func_ov002_022ac67c
.L_52c:
    bl func_ov002_021afaf0
    cmp r0, #0x1
    bgt .L_54c
    ldr r0, [r5, #0x4]
    rsb r0, r0, #0x0
    cmp r0, #0x48
    addne sp, sp, #0x108
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_54c:
    ldr r1, [r5, #0x20]
    mov r0, r5
    bl func_ov002_022ac028
    cmp r0, #0x0
    mov r0, #0x1
    ble .L_580
    mov r1, #0x0
    str r1, [r5, #0x1b8]
    str r1, [r5, #0x1d0]
    str r0, [r5, #0x1d8]
    add sp, sp, #0x108
    str r1, [r5, #0x1f0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_580:
    str r0, [r5, #0x1b8]
    mov r0, #0x0
    str r0, [r5, #0x1d0]
    str r0, [r5, #0x1d8]
    str r0, [r5, #0x1f0]
.L_594:
    add sp, sp, #0x108
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cbdbc
_LIT1: .word data_02102c90
_LIT2: .word 0x00002281
_LIT3: .word data_ov002_022cbdc4
_LIT4: .word data_ov002_022cbdcc
_LIT5: .word data_ov002_022cbdd4
