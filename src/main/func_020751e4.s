; func_020751e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101ec4
        .extern data_0219eee0
        .extern data_0219ef0c
        .extern func_020705d4
        .extern func_020757e0
        .extern func_02075d44
        .extern func_02077b5c
        .extern func_02077d08
        .extern func_02094688
        .global func_020751e4
        .arm
func_020751e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r8, r0
    ldr r1, [r1]
    mov r0, #0x98
    ldr r7, [r8, #0xc]
    blx r1
    movs r6, r0
    moveq r0, #0x9
    addeq sp, sp, #0x8
    streqb r0, [r7, #0x455]
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    mov r0, #0x3
    strb r0, [r6, #0x9]
    add r5, r6, #0x9
    mov r0, #0x0
    strb r0, [r5, #0x1]
    bl func_02077b5c
    mov r1, r0, lsr #0x18
    strb r1, [r7, #0x34]
    mov r1, r0, lsr #0x10
    strb r1, [r7, #0x35]
    mov r1, r0, lsr #0x8
    strb r1, [r7, #0x36]
    strb r0, [r7, #0x37]
    add r0, r7, #0x38
    mov r1, #0x1c
    bl func_020757e0
    add r0, r7, #0x34
    add r1, r5, #0x2
    mov r2, #0x20
    bl func_02094688
    ldrh r2, [r8, #0x18]
    ldr r1, [r8, #0x1c]
    mov r0, r7
    bl func_02077d08
    ldrb r0, [r7, #0x30]
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [r5, #0x22]
    addeq r5, r5, #0x23
    beq .L_454
    mov r2, #0x20
    add r0, r7, #0x74
    add r1, r5, #0x23
    strb r2, [r5, #0x22]
    bl func_02094688
    add r5, r5, #0x43
.L_454:
    mov r4, #0x0
    strb r4, [r5]
    mov r0, #0x4
    strb r0, [r5, #0x1]
    ldr r2, _LIT1
    add r5, r5, #0x2
.L_46c:
    mov r3, r4, lsl #0x1
    ldrh r0, [r2, r3]
    add r4, r4, #0x1
    add r1, r5, #0x1
    mov r0, r0, asr #0x8
    strb r0, [r5]
    ldrh r0, [r2, r3]
    cmp r4, #0x2
    add r5, r5, #0x2
    strb r0, [r1]
    bcc .L_46c
    mov r3, #0x1
    mov r2, #0x0
    strb r3, [r5]
    add r0, r5, #0x2
    sub r0, r0, r6
    sub r4, r0, #0x5
    strb r2, [r5, #0x1]
    sub r1, r4, #0x4
    mov r0, #0x16
    strb r0, [r6]
    mov r0, #0x3
    strb r0, [r6, #0x1]
    strb r2, [r6, #0x2]
    mov r0, r4, asr #0x8
    strb r0, [r6, #0x3]
    strb r4, [r6, #0x4]
    strb r3, [r6, #0x5]
    mov r0, r1, asr #0x10
    strb r0, [r6, #0x6]
    mov r0, r1, asr #0x8
    strb r0, [r6, #0x7]
    strb r1, [r6, #0x8]
    mov r0, r6
    mov r3, r2
    add r1, r4, #0x5
    str r8, [sp]
    bl func_020705d4
    mov r0, r7
    mov r2, r4
    add r1, r6, #0x5
    bl func_02075d44
    ldr r1, _LIT2
    mov r0, r6
    ldr r1, [r1]
    blx r1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_0219eee0
_LIT1: .word data_02101ec4
_LIT2: .word data_0219ef0c
