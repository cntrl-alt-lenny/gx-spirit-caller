; func_ov006_021b40ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021cf1b0
        .extern data_ov006_0224f290
        .extern data_ov006_0224f2ac
        .extern data_ov006_0224f448
        .extern data_ov006_0225cb88
        .extern data_ov006_0225cb98
        .extern func_020018d4
        .extern func_0200197c
        .extern func_02001d68
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202c070
        .extern func_020373cc
        .extern func_ov006_021b5dec
        .extern func_ov006_021b60a4
        .extern func_ov006_021b6bac
        .global func_ov006_021b40ac
        .arm
func_ov006_021b40ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    bl func_0202adf8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202ae1c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c070
    mov r0, #0xa0
    bl func_020018d4
    ldr r1, _LIT2
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200197c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT3
    bl func_ov006_021b5dec
    ldr r0, _LIT4
    ldr r0, [r0, #0x10]
    cmp r0, #0x2
    bne .L_88
    ldr r0, _LIT3
    mov r1, #0x3
    mov r2, #0x0
    bl func_ov006_021b60a4
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
    bl func_ov006_021b6bac
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
    bl func_ov006_021b6bac
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
    bl func_ov006_021b6bac
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
    bl func_020373cc
    ldr r1, _LIT4
    mov r0, #0x1
    str r0, [r1, #0xc]
    mov r2, #0x2
    str r2, [r1]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f2ac
_LIT1: .word data_02104f4c
_LIT2: .word data_ov006_021cf1b0
_LIT3: .word data_ov006_0224f448
_LIT4: .word data_ov006_0224f290
_LIT5: .word data_ov006_0225cb88
_LIT6: .word data_ov006_0225cb98
