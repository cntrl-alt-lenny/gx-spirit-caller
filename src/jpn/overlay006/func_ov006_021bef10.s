; func_ov006_021bef10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_0224f328
        .extern data_ov006_02257428
        .extern func_02001d48
        .extern func_02001d64
        .extern func_02001d78
        .extern func_02004f3c
        .extern func_020054d4
        .extern func_02005538
        .extern func_0202c06c
        .extern func_0208dcb4
        .extern OS_SPrintf
        .extern func_02094410
        .extern func_ov006_021b9cec
        .extern func_ov006_021b9d08
        .global func_ov006_021bef10
        .arm
func_ov006_021bef10:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x68
    mov r7, r0
    ldr r5, _LIT0
    bl func_0208dcb4
    ldr r1, _LIT1
    mov r4, r0
    ldrh r6, [r1, #0x6c]
    ldrh r3, [r1, #0x76]
    add r1, r4, #0x40
    mov r0, #0x0
    mov r2, #0x1000
    sub r6, r6, r3
    bl func_02094410
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    add r0, r7, #0x4
    bne .L_74
    mov r1, #0x9
    mov r2, #0x0
    bl func_02001d64
    b .L_7c
.L_74:
    mov r1, #0x5
    bl func_02001d78
.L_7c:
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    beq .L_a0
    ldr r0, _LIT3
    bl func_0202c06c
    mov r5, r0
    b .L_150
.L_a0:
    cmp r6, #0x0
    bne .L_b8
    ldr r0, _LIT4
    bl func_0202c06c
    mov r5, r0
    b .L_150
.L_b8:
    add r1, sp, #0x8
    bge .L_114
    cmp r0, #0x0
    bne .L_e0
    cmp r6, #0x0
    rsblt r6, r6, #0x0
    mov r0, r5
    mov r2, r6
    bl func_ov006_021b9d08
    b .L_f4
.L_e0:
    cmp r6, #0x0
    rsblt r6, r6, #0x0
    mov r0, r5
    mov r2, r6
    bl func_ov006_021b9cec
.L_f4:
    ldr r0, _LIT5
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x28
    add r2, sp, #0x8
    bl OS_SPrintf
    add r5, sp, #0x28
    b .L_150
.L_114:
    cmp r0, #0x0
    mov r0, r5
    bne .L_12c
    mov r2, r6
    bl func_ov006_021b9d08
    b .L_134
.L_12c:
    mov r2, r6
    bl func_ov006_021b9cec
.L_134:
    ldr r0, _LIT6
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x28
    add r2, sp, #0x8
    bl OS_SPrintf
    add r5, sp, #0x28
.L_150:
    ldr r0, _LIT2
    mov r1, #0xa
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, r5
    bne .L_178
    mov r2, #0x9
    bl func_020054d4
    b .L_180
.L_178:
    mov r2, #0x5
    bl func_02005538
.L_180:
    ldr r1, [r7, #0x74]
    add r0, r0, r0, lsr #0x1f
    cmp r1, #0x0
    moveq r0, r0, asr #0x1
    rsbeq r3, r0, #0xa5
    moveq r0, #0xd
    beq .L_1a8
    mov r0, r0, asr #0x1
    rsb r3, r0, #0xa5
    mov r0, #0x7
.L_1a8:
    str r0, [sp]
    mov r0, #0xa
    mov r1, r5
    str r0, [sp, #0x4]
    add r0, r7, #0x4
    add r2, r4, #0x40
    bl func_02004f3c
    ldr r0, [r7, #0x74]
    cmp r0, #0x0
    beq .L_240
    ldr r0, _LIT7
    bl func_0202c06c
    ldr r1, _LIT2
    mov r5, r0
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1d
    mov r1, #0xa
    bne .L_200
    mov r2, #0x9
    bl func_020054d4
    b .L_208
.L_200:
    mov r2, #0x5
    bl func_02005538
.L_208:
    ldr r1, _LIT2
    rsb r3, r0, #0xab
    ldr r0, [r1, #0x4]
    mov r1, r5
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, #0x16
    str r0, [sp]
    mov r5, #0xa
    addne r3, r3, #0x10
    add r0, r7, #0x4
    add r2, r4, #0x40
    str r5, [sp, #0x4]
    bl func_02004f3c
.L_240:
    mov r1, #0x0
    mov r2, r1
    add r0, r7, #0x4
    bl func_02001d64
    add r0, r7, #0x4
    mvn r1, #0x0
    bl func_02001d78
    mov r0, #0x1
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word data_ov006_02257428
_LIT2: .word data_02104e6c
_LIT3: .word 0x00000479
_LIT4: .word 0x00000476
_LIT5: .word 0x00000477
_LIT6: .word 0x00000478
_LIT7: .word 0x0000047a
