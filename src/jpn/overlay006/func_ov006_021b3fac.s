; func_ov006_021b3fac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_021cf090
        .extern data_ov006_0224f170
        .extern data_ov006_0224f18c
        .extern data_ov006_0224f328
        .extern data_ov006_0225ca68
        .extern data_ov006_0225ca78
        .extern func_020018b4
        .extern func_0200195c
        .extern func_02001d48
        .extern func_0202ada4
        .extern func_0202adc8
        .extern func_0202c01c
        .extern func_0203737c
        .extern func_ov006_021b5cec
        .extern func_ov006_021b5fa4
        .extern func_ov006_021b6aac
        .global func_ov006_021b3fac
        .arm
func_ov006_021b3fac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    bl func_0202ada4
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202adc8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c01c
    mov r0, #0xa0
    bl func_020018b4
    ldr r1, _LIT2
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200195c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT3
    bl func_ov006_021b5cec
    ldr r0, _LIT4
    ldr r0, [r0, #0x10]
    cmp r0, #0x2
    bne .L_88
    ldr r0, _LIT3
    mov r1, #0x3
    mov r2, #0x0
    bl func_ov006_021b5fa4
.L_88:
    ldr r0, _LIT4
    mov r9, #0x0
    ldr r0, [r0, #0x10]
    cmp r0, #0x1
    bne .L_150
    ldr r7, _LIT5
    mov r0, #0x4
    str r0, [r7]
    str r9, [r7, #0x4]
    str r9, [r7, #0x8]
    mov r6, #0x1
    ldr sl, _LIT6
    ldr r5, _LIT3
    str r9, [r7, #0xc]
    mov r4, #0x32
    mov fp, r6
    mov r8, r9
.L_cc:
    add r0, r7, r9, lsl #0x4
    str r8, [r0, #0x10]
    str r8, [r0, #0x14]
    cmp r9, #0x0
    movne r0, r6
    moveq r0, r8
    cmp r0, #0x0
    addeq r0, r7, r9, lsl #0x4
    streq r4, [r0, #0x18]
    beq .L_108
    mov r0, r5
    mov r1, fp
    bl func_ov006_021b6aac
    add r1, r7, r9, lsl #0x4
    str r0, [r1, #0x18]
.L_108:
    add r0, r7, r9, lsl #0x4
    ldr r0, [r0, #0x18]
    add r9, r9, #0x1
    cmp r0, #0x6
    movgt r2, #0x1
    ldr r0, [sl, #0xc]
    movle r2, #0x0
    bic r1, r0, #0x1
    and r0, r2, #0x1
    orr r0, r1, r0
    str r0, [sl, #0xc]
    cmp r9, #0x2
    add sl, sl, #0x10
    blt .L_cc
    ldr r0, _LIT5
    mov r1, #0x5
    str r1, [r0]
    b .L_2ac
.L_150:
    cmp r0, #0x2
    mov r0, #0x4
    bne .L_20c
    ldr r7, _LIT5
    mov r6, #0x1
    str r0, [r7]
    str r9, [r7, #0x4]
    str r9, [r7, #0x8]
    ldr sl, _LIT6
    ldr r5, _LIT3
    str r9, [r7, #0xc]
    mov r4, #0x32
    mov fp, r6
    mov r8, r9
.L_188:
    add r0, r7, r9, lsl #0x4
    str r8, [r0, #0x10]
    str r8, [r0, #0x14]
    cmp r9, #0x0
    movne r0, r6
    moveq r0, r8
    cmp r0, #0x0
    addeq r0, r7, r9, lsl #0x4
    streq r4, [r0, #0x18]
    beq .L_1c4
    mov r0, r5
    mov r1, fp
    bl func_ov006_021b6aac
    add r1, r7, r9, lsl #0x4
    str r0, [r1, #0x18]
.L_1c4:
    add r0, r7, r9, lsl #0x4
    ldr r0, [r0, #0x18]
    add r9, r9, #0x1
    cmp r0, #0x6
    movgt r2, #0x1
    ldr r0, [sl, #0xc]
    movle r2, #0x0
    bic r1, r0, #0x1
    and r0, r2, #0x1
    orr r0, r1, r0
    str r0, [sl, #0xc]
    cmp r9, #0x2
    add sl, sl, #0x10
    blt .L_188
    ldr r0, _LIT5
    mov r1, #0x6
    str r1, [r0]
    b .L_2ac
.L_20c:
    ldr r7, _LIT5
    mov r6, #0x1
    str r0, [r7]
    str r9, [r7, #0x4]
    str r9, [r7, #0x8]
    ldr sl, _LIT6
    ldr r5, _LIT3
    str r9, [r7, #0xc]
    mov r4, #0x32
    mov fp, r6
    mov r8, r9
.L_238:
    add r0, r7, r9, lsl #0x4
    str r8, [r0, #0x10]
    str r8, [r0, #0x14]
    cmp r9, #0x0
    movne r0, r6
    moveq r0, r8
    cmp r0, #0x0
    addeq r0, r7, r9, lsl #0x4
    streq r4, [r0, #0x18]
    beq .L_274
    mov r0, r5
    mov r1, fp
    bl func_ov006_021b6aac
    add r1, r7, r9, lsl #0x4
    str r0, [r1, #0x18]
.L_274:
    add r0, r7, r9, lsl #0x4
    ldr r0, [r0, #0x18]
    add r9, r9, #0x1
    cmp r0, #0x6
    movgt r2, #0x1
    ldr r0, [sl, #0xc]
    movle r2, #0x0
    bic r1, r0, #0x1
    and r0, r2, #0x1
    orr r0, r1, r0
    str r0, [sl, #0xc]
    cmp r9, #0x2
    add sl, sl, #0x10
    blt .L_238
.L_2ac:
    mov r2, #0x0
    sub r3, r2, #0x1
    mov r0, #0x24
    mov r1, #0x1
    bl func_0203737c
    ldr r1, _LIT4
    mov r0, #0x1
    str r0, [r1, #0xc]
    mov r2, #0x2
    str r2, [r1]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f18c
_LIT1: .word data_02104e6c
_LIT2: .word data_ov006_021cf090
_LIT3: .word data_ov006_0224f328
_LIT4: .word data_ov006_0224f170
_LIT5: .word data_ov006_0225ca68
_LIT6: .word data_ov006_0225ca78
