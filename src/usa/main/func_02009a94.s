; func_02009a94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e5c
        .extern data_0210585c
        .extern data_021063d8
        .extern func_020a9828
        .extern func_020a985c
        .global func_02009a94
        .arm
func_02009a94:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    movs r4, r0
    addeq sp, sp, #0x24
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    bl func_020a985c
    ldr r2, _LIT1
    sub r1, r4, #0x1
    mov r0, #0x1c
    mla r0, r1, r0, r2
    mov r9, #0x0
    str r9, [r0, #0x10]
    str r9, [r0, #0xc]
    str r9, [r0, #0x8]
    str r9, [r0, #0x4]
    ldrb r3, [r0, #0x1]
    ldr r2, _LIT2
    str r0, [sp, #0x14]
    smull r1, r0, r2, r3
    mov r1, r3, lsr #0x1f
    add r0, r1, r0, asr #0x2
    str r9, [sp, #0xc]
    str r0, [sp, #0x10]
    cmp r0, #0x0
    ble .L_1b8
.L_6c:
    ldr r0, _LIT3
    mov r1, #0x7
    ldr r0, [r0, #0xa74]
    mov r3, #0x2
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    mov r2, #0x1
    str r1, [sp, #0x18]
    str r3, [sp, #0x1c]
    str r2, [sp, #0x20]
    cmp r0, #0xe
    bne .L_100
    ldr r0, _LIT4
    ldrh r0, [r0, #0xf8]
    cmp r0, #0x0
    beq .L_c0
    cmp r0, #0x1
    beq .L_d8
    cmp r0, #0x2
    beq .L_ec
    b .L_100
.L_c0:
    mov r1, #0x6
    mov r0, #0x3
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    str r2, [sp, #0x20]
    b .L_100
.L_d8:
    mov r0, #0x6
    str r0, [sp, #0x18]
    str r3, [sp, #0x1c]
    str r3, [sp, #0x20]
    b .L_100
.L_ec:
    mov r1, #0x5
    mov r0, #0x3
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    str r3, [sp, #0x20]
.L_100:
    mov r0, #0x0
    ldr r5, _LIT5
    str r0, [sp, #0x8]
    mov fp, #0x1
    add r7, sp, #0x18
    mov r4, #0x3
.L_118:
    mov r1, r9, lsr #0x1f
    rsb r0, r1, r9, lsl #0x1c
    add r1, r1, r0, ror #0x1c
    mov r2, r9, asr #0x3
    add r0, r9, r2, lsr #0x1c
    mov sl, r1, lsl #0x1
    mov r1, r0, asr #0x4
    ldr r0, [sp, #0x14]
    mov r8, #0x0
    add r6, r0, r1, lsl #0x2
.L_140:
    bl func_020a9828
    smull r2, r1, r5, r0
    add r1, r1, r0, lsr #0x1f
    smull r1, r2, r4, r1
    sub r1, r0, r1
    ldr r0, [r7, r1, lsl #0x2]
    cmp r0, #0x0
    ble .L_180
    ldr r2, [r6, #0x4]
    add r0, r1, #0x1
    orr r0, r2, r0, lsl sl
    str r0, [r6, #0x4]
    ldr r0, [r7, r1, lsl #0x2]
    mov r8, fp
    sub r0, r0, #0x1
    str r0, [r7, r1, lsl #0x2]
.L_180:
    cmp r8, #0x0
    beq .L_140
    ldr r0, [sp, #0x8]
    add r9, r9, #0x1
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0xa
    blt .L_118
    ldr r0, [sp, #0xc]
    add r1, r0, #0x1
    ldr r0, [sp, #0x10]
    str r1, [sp, #0xc]
    cmp r1, r0
    blt .L_6c
.L_1b8:
    ldr r0, [sp, #0x10]
    mov r1, #0xa
    mul r4, r0, r1
    ldr r2, _LIT3
    ldr r0, [sp, #0x14]
    ldr r1, [r2, #0xa74]
    ldrb r5, [r0, #0x1]
    and r0, r1, #0x1f00000
    mov r0, r0, lsr #0x14
    mov r1, #0x7
    mov r3, #0x2
    mov r2, #0x1
    cmp r0, #0xe
    sub r0, r5, r4
    str r1, [sp, #0x18]
    str r3, [sp, #0x1c]
    str r2, [sp, #0x20]
    str r0, [sp, #0x4]
    bne .L_268
    ldr r0, _LIT4
    ldrh r0, [r0, #0xf8]
    cmp r0, #0x0
    beq .L_228
    cmp r0, #0x1
    beq .L_240
    cmp r0, #0x2
    beq .L_254
    b .L_268
.L_228:
    mov r1, #0x6
    mov r0, #0x3
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    str r2, [sp, #0x20]
    b .L_268
.L_240:
    mov r0, #0x6
    str r0, [sp, #0x18]
    str r3, [sp, #0x1c]
    str r3, [sp, #0x20]
    b .L_268
.L_254:
    mov r1, #0x5
    mov r0, #0x3
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    str r3, [sp, #0x20]
.L_268:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    mov r0, #0x0
    str r0, [sp]
    addle sp, sp, #0x24
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r5, #0x1
    add r7, sp, #0x18
.L_288:
    mov r1, r9, lsr #0x1f
    rsb r0, r1, r9, lsl #0x1c
    add r1, r1, r0, ror #0x1c
    mov r2, r9, asr #0x3
    add r0, r9, r2, lsr #0x1c
    mov r8, r1, lsl #0x1
    mov r1, r0, asr #0x4
    ldr r0, [sp, #0x14]
    ldr r4, _LIT5
    mov sl, #0x0
    add r6, r0, r1, lsl #0x2
    mov fp, #0x3
.L_2b8:
    bl func_020a9828
    smull r2, r1, r4, r0
    add r1, r1, r0, lsr #0x1f
    smull r1, r2, fp, r1
    sub r1, r0, r1
    ldr r0, [r7, r1, lsl #0x2]
    cmp r0, #0x0
    ble .L_2f8
    ldr r2, [r6, #0x4]
    add r0, r1, #0x1
    orr r2, r2, r0, lsl r8
    ldr r0, [r7, r1, lsl #0x2]
    str r2, [r6, #0x4]
    sub r0, r0, #0x1
    mov sl, r5
    str r0, [r7, r1, lsl #0x2]
.L_2f8:
    cmp sl, #0x0
    beq .L_2b8
    ldr r0, [sp]
    add r9, r9, #0x1
    add r1, r0, #0x1
    ldr r0, [sp, #0x4]
    str r1, [sp]
    cmp r1, r0
    blt .L_288
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_021063d8
_LIT2: .word 0x66666667
_LIT3: .word data_02104e5c
_LIT4: .word data_0210585c
_LIT5: .word 0x55555556
