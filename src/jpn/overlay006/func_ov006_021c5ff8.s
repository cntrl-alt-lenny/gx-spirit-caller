; func_ov006_021c5ff8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202160c
        .extern func_0202165c
        .global func_ov006_021c5ff8
        .arm
func_ov006_021c5ff8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    ldr r1, [r0, #0x4c]
    str r0, [sp]
    add r2, r0, #0x6c
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0xc]
    add r0, r2, r1, lsl #0x4
    str r0, [sp, #0x18]
    mov r0, #0x1e
    str r0, [sp, #0x8]
.L_30:
    ldr r0, [sp, #0x18]
    ldr r1, [r0, #0x4]
    ldr r0, [sp, #0x14]
    adds r0, r1, r0
    str r0, [sp, #0x10]
    bmi .L_64
    ldr r0, [sp, #0x18]
    ldr r1, [r0, #0x8]
    ldr r0, [sp, #0x10]
    cmp r0, r1
    movlt r0, #0x1
    strlt r0, [sp, #0x4]
    blt .L_6c
.L_64:
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_6c:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    moveq sl, #0x0
    beq .L_9c
    ldr r1, [sp]
    ldr r0, [sp, #0x10]
    ldr r2, _LIT0
    add r0, r1, r0, lsl #0x4
    ldr r1, [r0, #0x80]
    mov r0, r1, lsr #0x1f
    smull r1, sl, r2, r1
    add sl, r0, sl, asr #0x2
.L_9c:
    ldr r3, _LIT1
    mov r1, sl, lsr #0x1f
    smull r2, r4, r3, sl
    ldr r0, _LIT2
    add r4, r1, r4, asr #0x6
    smull r2, r3, r0, sl
    mov r7, #0x3e8
    smull r4, r5, r7, r4
    sub r4, sl, r4
    smull r7, r5, r0, r4
    mov r4, r4, lsr #0x1f
    mov r0, r5
    add r0, r4, r0, asr #0x5
    add r3, r1, r3, asr #0x5
    mov r4, #0x64
    str r0, [sp, #0x1c]
    smull r0, r3, r4, r3
    ldr r2, _LIT0
    sub r3, sl, r0
    smull r4, r0, r2, r3
    mov r3, r3, lsr #0x1f
    add r0, r3, r0, asr #0x2
    str r0, [sp, #0x20]
    smull r3, r0, r2, sl
    add r0, r1, r0, asr #0x2
    mov r2, #0xa
    smull r0, r1, r2, r0
    sub r0, sl, r0
    mov r6, #0x0
    mov r9, #0xbe
    str r0, [sp, #0x24]
.L_118:
    ldr r0, [sp, #0xc]
    mov r1, #0x5
    add r7, r6, r0
    ldr r0, [sp]
    add r2, r7, #0x8
    ldr r0, [r0]
    bl func_0202160c
    mov r4, r0
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_1dc
    cmp r6, #0x0
    ldr r5, _LIT3
    beq .L_164
    cmp r6, #0x1
    beq .L_178
    cmp r6, #0x2
    beq .L_18c
    b .L_198
.L_164:
    ldr r0, [sp, #0x1c]
    cmp sl, #0x64
    add r8, r0, #0xd
    movlt r5, #0x0
    b .L_19c
.L_178:
    ldr r0, [sp, #0x20]
    cmp sl, #0xa
    add r8, r0, #0xd
    movlt r5, #0x0
    b .L_19c
.L_18c:
    ldr r0, [sp, #0x24]
    add r8, r0, #0xd
    b .L_19c
.L_198:
    mov r8, #0x17
.L_19c:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_1e4
    cmp sl, #0x32
    bge .L_1e4
    cmp r6, #0x0
    beq .L_1cc
    cmp r6, #0x1
    beq .L_1d4
    cmp r6, #0x2
    moveq r8, #0x18
    b .L_1e4
.L_1cc:
    mov r5, #0x0
    b .L_1e4
.L_1d4:
    mov r5, #0x0
    b .L_1e4
.L_1dc:
    mov r5, #0x0
    mov r8, r5
.L_1e4:
    cmp r6, #0x3
    moveq fp, #0x2
    movne fp, #0x0
    add r2, r7, #0x8
    mov r0, r4
    mov r1, #0x2
    bl func_0202165c
    add r2, r9, fp
    mov r0, r4
    mov r1, #0x3
    bl func_0202165c
    ldr r2, [sp, #0x8]
    mov r0, r4
    mov r1, #0x4
    bl func_0202165c
    mov r0, r4
    mov r1, #0x11
    mov r2, #0x3
    bl func_0202165c
    mov r0, r4
    mov r1, #0x12
    mov r2, #0x0
    bl func_0202165c
    mov r0, r4
    mov r1, #0xc
    mov r2, #0x0
    bl func_0202165c
    mov r2, r8
    mov r0, r4
    mov r1, #0xd
    bl func_0202165c
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_0202165c
    add r6, r6, #0x1
    add r9, r9, #0x6
    cmp r6, #0x4
    blt .L_118
    ldr r0, [sp, #0x14]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    cmp r0, #0x6
    ldr r0, [sp, #0xc]
    add r0, r0, #0x4
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x8]
    add r0, r0, #0x16
    str r0, [sp, #0x8]
    blt .L_30
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x66666667
_LIT1: .word 0x10624dd3
_LIT2: .word 0x51eb851f
_LIT3: .word 0x000001c1
