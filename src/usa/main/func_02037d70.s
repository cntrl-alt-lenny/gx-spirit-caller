; func_02037d70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern data_0219b680
        .extern func_02037b08
        .extern func_02037cd8
        .global func_02037d70
        .arm
func_02037d70:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub r3, r0, #0x8f00000
    ldr r4, _LIT0
    mov r7, r1
    mov r6, r2
    cmp r3, #0x5
    addls pc, pc, r3, lsl #0x2
    b .L_1f8
    b .L_38
    b .L_7c
    b .L_c8
    b .L_114
    b .L_158
    b .L_190
.L_38:
    mov r5, #0x0
.L_3c:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_64
    ldr r0, [r4, #0x34]
    tst r0, #0x1000000
    bne .L_64
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037cd8
.L_64:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_3c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_7c:
    mov r5, #0x0
.L_80:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_b0
    ldr r0, [r4, #0x34]
    tst r0, #0x1000000
    beq .L_b0
    tst r0, #0x2000000
    bne .L_b0
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037cd8
.L_b0:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_80
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_c8:
    mov r5, #0x0
.L_cc:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_fc
    ldr r0, [r4, #0x34]
    tst r0, #0x1000000
    beq .L_fc
    tst r0, #0x2000000
    beq .L_fc
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037cd8
.L_fc:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_cc
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_114:
    mov r5, #0x0
.L_118:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_140
    ldr r0, [r4, #0x34]
    tst r0, #0x1000000
    beq .L_140
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037cd8
.L_140:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_118
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_158:
    mov r5, #0x0
.L_15c:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_178
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037cd8
.L_178:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_15c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_190:
    ldr r9, _LIT1
    mov r5, #0x0
    mov r8, #0xc
.L_19c:
    ldrsb r0, [r4, #0x6a]
    cmp r0, #0x0
    blt .L_1e0
    ldr r0, [r4, #0x34]
    tst r0, #0x1000000
    beq .L_1e0
    mov r0, r0, lsl #0x10
    ldr r2, [r9, #0x34]
    mov r1, r0, lsr #0x10
    mla r0, r1, r8, r2
    ldrb r0, [r0, #0x7]
    tst r0, #0x80
    beq .L_1e0
    mov r0, r4
    mov r1, r7
    mov r2, r6
    bl func_02037cd8
.L_1e0:
    add r5, r5, #0x1
    cmp r5, #0x1c
    add r4, r4, #0x78
    blt .L_19c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1f8:
    bl func_02037b08
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, r7
    mov r2, r6
    bl func_02037cd8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219b680
_LIT1: .word data_0219b200
