; func_0207f610 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207f87c
        .extern func_0208fd30
        .extern func_0208fd90
        .extern func_0209015c
        .extern func_020901cc
        .extern func_02090330
        .extern func_02092904
        .global func_0207f610
        .arm
func_0207f610:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    movs r5, r2
    mov r6, r1
    mov r4, r3
    ldr r0, [r7, #0x8]
    beq .L_168
    cmp r5, #0x1
    beq .L_134
    cmp r5, #0x2
    beq .L_150
    b .L_168
.L_134:
    mov r3, #0x4000000
    ldr r2, [r3]
    ldr r1, _LIT0
    and r1, r2, r1
    orr r0, r1, r0
    str r0, [r3]
    b .L_168
.L_150:
    ldr r3, _LIT1
    ldr r1, _LIT0
    ldr r2, [r3]
    and r1, r2, r1
    orr r0, r1, r0
    str r0, [r3]
.L_168:
    ldr r0, [r7, #0x14]
    ldr r1, [r7, #0x10]
    bl func_02092904
    cmp r5, #0x0
    beq .L_190
    cmp r5, #0x1
    beq .L_1ac
    cmp r5, #0x2
    beq .L_1c0
    b .L_1d0
.L_190:
    bl func_02090330
    ldr r0, [r7, #0x14]
    ldr r2, [r7, #0x10]
    mov r1, r6
    bl func_020901cc
    bl func_0209015c
    b .L_1d0
.L_1ac:
    ldr r0, [r7, #0x14]
    ldr r2, [r7, #0x10]
    mov r1, r6
    bl func_0208fd90
    b .L_1d0
.L_1c0:
    ldr r0, [r7, #0x14]
    ldr r2, [r7, #0x10]
    mov r1, r6
    bl func_0208fd30
.L_1d0:
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    bne .L_2f0
    ldrh r0, [r7, #0x2]
    cmp r0, #0x10
    bgt .L_220
    cmp r0, #0x10
    bge .L_24c
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_25c
    b .L_25c
    b .L_22c
    b .L_234
    b .L_25c
    b .L_23c
    b .L_25c
    b .L_25c
    b .L_25c
    b .L_244
.L_220:
    cmp r0, #0x20
    beq .L_254
    b .L_25c
.L_22c:
    mov r0, #0x0
    b .L_260
.L_234:
    mov r0, #0x1
    b .L_260
.L_23c:
    mov r0, #0x2
    b .L_260
.L_244:
    mov r0, #0x3
    b .L_260
.L_24c:
    mov r0, #0x4
    b .L_260
.L_254:
    mov r0, #0x5
    b .L_260
.L_25c:
    mov r0, #0x0
.L_260:
    str r0, [r4, #0xc]
    ldrh r0, [r7]
    cmp r0, #0x10
    bgt .L_2a8
    cmp r0, #0x10
    bge .L_2d4
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_2e4
    b .L_2e4
    b .L_2b4
    b .L_2bc
    b .L_2e4
    b .L_2c4
    b .L_2e4
    b .L_2e4
    b .L_2e4
    b .L_2cc
.L_2a8:
    cmp r0, #0x20
    beq .L_2dc
    b .L_2e4
.L_2b4:
    mov r0, #0x0
    b .L_2e8
.L_2bc:
    mov r0, #0x1
    b .L_2e8
.L_2c4:
    mov r0, #0x2
    b .L_2e8
.L_2cc:
    mov r0, #0x3
    b .L_2e8
.L_2d4:
    mov r0, #0x4
    b .L_2e8
.L_2dc:
    mov r0, #0x5
    b .L_2e8
.L_2e4:
    mov r0, #0x0
.L_2e8:
    str r0, [r4, #0x10]
    b .L_300
.L_2f0:
    ldrh r0, [r7, #0x2]
    str r0, [r4, #0xc]
    ldrh r0, [r7]
    str r0, [r4, #0x10]
.L_300:
    ldr r1, [r7, #0x4]
    mov r0, #0x0
    str r1, [r4, #0x14]
    str r0, [r4, #0x18]
    mov r0, #0x1
    str r0, [r4, #0x1c]
    ldr r3, [r7, #0x8]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    str r3, [r4, #0x20]
    bl func_0207f87c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0xffcfffef
_LIT1: .word 0x04001000
