; func_020382d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b760
        .extern func_02037b58
        .extern func_02038270
        .global func_020382d8
        .arm
func_020382d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r4, _LIT0
    mov r8, r0
    ldrh r0, [r4, #0x12]
    ldr r4, [sp, #0x20]
    mov r7, r1
    tst r0, #0x4000
    mov r6, r2
    mov r5, r3
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r8
    cmp r6, #0x0
    movlt r6, #0x8
    cmp r5, #0x0
    movlt r5, #0x8
    cmp r4, #0x0
    movlt r4, #0x8
    bl func_02037b58
    cmp r0, #0x0
    bne .L_258
    sub r0, r8, #0x8f00000
    ldr r9, _LIT1
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_248
    b .L_e4
    b .L_12c
    b .L_178
    b .L_1c4
    b .L_20c
.L_e4:
    mov r8, #0x0
.L_e8:
    ldrsb r0, [r9, #0x6a]
    cmp r0, #0x0
    blt .L_118
    ldr r0, [r9, #0x34]
    tst r0, #0x1000000
    bne .L_118
    mov r0, r9
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038270
.L_118:
    add r8, r8, #0x1
    cmp r8, #0x1c
    add r9, r9, #0x78
    blt .L_e8
    b .L_250
.L_12c:
    mov r8, #0x0
.L_130:
    ldrsb r0, [r9, #0x6a]
    cmp r0, #0x0
    blt .L_164
    ldr r0, [r9, #0x34]
    and r0, r0, #0x3000000
    cmp r0, #0x1000000
    bne .L_164
    mov r0, r9
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038270
.L_164:
    add r8, r8, #0x1
    cmp r8, #0x1c
    add r9, r9, #0x78
    blt .L_130
    b .L_250
.L_178:
    mov r8, #0x0
.L_17c:
    ldrsb r0, [r9, #0x6a]
    cmp r0, #0x0
    blt .L_1b0
    ldr r0, [r9, #0x34]
    and r0, r0, #0x3000000
    cmp r0, #0x3000000
    bne .L_1b0
    mov r0, r9
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038270
.L_1b0:
    add r8, r8, #0x1
    cmp r8, #0x1c
    add r9, r9, #0x78
    blt .L_17c
    b .L_250
.L_1c4:
    mov r8, #0x0
.L_1c8:
    ldrsb r0, [r9, #0x6a]
    cmp r0, #0x0
    blt .L_1f8
    ldr r0, [r9, #0x34]
    tst r0, #0x1000000
    beq .L_1f8
    mov r0, r9
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038270
.L_1f8:
    add r8, r8, #0x1
    cmp r8, #0x1c
    add r9, r9, #0x78
    blt .L_1c8
    b .L_250
.L_20c:
    mov r8, #0x0
.L_210:
    ldrsb r0, [r9, #0x6a]
    cmp r0, #0x0
    blt .L_234
    mov r0, r9
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038270
.L_234:
    add r8, r8, #0x1
    cmp r8, #0x1c
    add r9, r9, #0x78
    blt .L_210
    b .L_250
.L_248:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_250:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_258:
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038270
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219b2e0
_LIT1: .word data_0219b760
