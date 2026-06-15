; func_02015b10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139c4
        .extern func_02019034
        .extern func_020190ec
        .extern func_020191cc
        .extern func_020195ec
        .extern func_02019640
        .extern func_02019664
        .extern func_0201aabc
        .extern func_0201aaf4
        .extern func_0201b7b4
        .extern func_0201b7e0
        .extern func_ov000_021ae4ac
        .global func_02015b10
        .arm
func_02015b10:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    beq .L_20ec
    cmp r0, #0x2
    beq .L_2144
    cmp r0, #0x3
    beq .L_2240
    ldmia sp!, {r3, r4, r5, pc}
.L_20ec:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020191cc
    cmp r0, #0xd
    ldmltia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, #0x7b
    str r1, [r5, #0x8]
    ldr r1, [r4, #0x900]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_0201aabc
    ldmia sp!, {r3, r4, r5, pc}
.L_2144:
    ldr r0, [r4, #0x924]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_216c
    b .L_2228
    b .L_21fc
    b .L_21ac
    b .L_2174
.L_216c:
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_2174:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x7b
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_21ac:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_21f0
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    sub r0, r0, #0x1
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_21f0:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_21fc:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x2
    str r0, [r4, #0x920]
    mov r0, #0x6
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_2228:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    bl func_0201b7b4
    mov r0, #0x0
    bl func_02019640
    ldmia sp!, {r3, r4, r5, pc}
.L_2240:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_2264
    b .L_2348
    b .L_22a4
    b .L_226c
.L_2264:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_226c:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x7b
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_22a4:
    bl func_ov000_021ae4ac
    cmp r0, #0x2
    bne .L_22e0
    mov r0, #0x15
    str r0, [r4, #0x91c]
    mov r0, #0x3
    str r0, [r4, #0x920]
    mov r0, #0x1
    str r0, [r4, #0x924]
    ldr r1, [r4, #0x8e0]
    mov r0, #0x0
    orr r1, r1, #0x4
    str r1, [r4, #0x8e0]
    bl func_02019640
    ldmia sp!, {r3, r4, r5, pc}
.L_22e0:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    bne .L_233c
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_0201b7b4
    mov r0, #0x7b
    bl func_0201aaf4
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    sub r0, r0, #0x1
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_233c:
    ldr r0, _LIT8
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2348:
    ldr r0, _LIT9
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x3
    str r0, [r4, #0x920]
    mov r0, #0x5
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00150100
_LIT1: .word 0x00150200
_LIT2: .word 0x00150201
_LIT3: .word 0x00150202
_LIT4: .word 0x00150203
_LIT5: .word 0x00150204
_LIT6: .word 0x00150300
_LIT7: .word 0x00150304
_LIT8: .word 0x00150302
_LIT9: .word 0x00150303
