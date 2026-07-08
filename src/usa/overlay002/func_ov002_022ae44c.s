; func_ov002_022ae44c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern func_0202cda4
        .extern func_ov002_022ae148
        .global func_ov002_022ae44c
        .arm
func_ov002_022ae44c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldrh r0, [r0]
    mov r7, r1
    mov r6, r2
    cmp r0, #0x0
    beq .L_10c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r2, r0, lsr #0x1e
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    add r0, r2, r2, lsr #0x1f
    movne r5, #0xe7
    mov r0, r0, asr #0x1
    moveq r5, #0x0
    mov r0, r0, lsl #0x4
    cmp r7, r5
    rsb r4, r0, #0xab
    blt .L_78
    add r0, r5, #0x19
    cmp r7, r0
    bge .L_78
    cmp r6, r4
    blt .L_78
    add r0, r4, #0x15
    cmp r6, r0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
.L_78:
    mov r0, #0x0
    bl func_ov002_022ae148
    cmp r0, #0x0
    beq .L_b4
    cmp r7, r5
    blt .L_b4
    add r0, r5, #0x19
    cmp r7, r0
    bge .L_b4
    sub r0, r4, #0x15
    cmp r6, r0
    blt .L_b4
    cmp r6, r4
    movlt r0, #0x4
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
.L_b4:
    bl func_0202cda4
    cmp r0, #0x0
    beq .L_184
    ldr r0, _LIT0
    cmp r7, #0xe7
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1e
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    mov r0, r0, lsl #0x4
    rsb r0, r0, #0x10
    blt .L_184
    cmp r7, #0x100
    bge .L_184
    cmp r6, r0
    blt .L_184
    add r0, r0, #0x15
    cmp r6, r0
    bge .L_184
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_10c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r2, r0, lsr #0x1e
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    add r0, r2, r2, lsr #0x1f
    movne r3, #0xe7
    mov r0, r0, asr #0x1
    moveq r3, #0x0
    mov r0, r0, lsl #0x4
    cmp r7, r3
    rsb r1, r0, #0xab
    blt .L_184
    add r0, r3, #0x19
    cmp r7, r0
    bge .L_184
    cmp r6, r1
    blt .L_16c
    add r0, r1, #0x15
    cmp r6, r0
    movlt r0, #0x2
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
.L_16c:
    sub r0, r1, #0x15
    cmp r6, r0
    blt .L_184
    cmp r6, r1
    movlt r0, #0x3
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
.L_184:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104e6c
