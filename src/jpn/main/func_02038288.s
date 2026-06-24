; func_02038288 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern data_0219b680
        .extern func_02037b08
        .extern func_02038220
        .global func_02038288
        .arm
func_02038288:
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
    bl func_02037b08
    cmp r0, #0x0
    bne .L_1f0
    sub r0, r8, #0x8f00000
    ldr r9, _LIT1
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_1e0
    b .L_7c
    b .L_c4
    b .L_110
    b .L_15c
    b .L_1a4
.L_7c:
    mov r8, #0x0
.L_80:
    ldrsb r0, [r9, #0x6a]
    cmp r0, #0x0
    blt .L_b0
    ldr r0, [r9, #0x34]
    tst r0, #0x1000000
    bne .L_b0
    mov r0, r9
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038220
.L_b0:
    add r8, r8, #0x1
    cmp r8, #0x1c
    add r9, r9, #0x78
    blt .L_80
    b .L_1e8
.L_c4:
    mov r8, #0x0
.L_c8:
    ldrsb r0, [r9, #0x6a]
    cmp r0, #0x0
    blt .L_fc
    ldr r0, [r9, #0x34]
    and r0, r0, #0x3000000
    cmp r0, #0x1000000
    bne .L_fc
    mov r0, r9
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038220
.L_fc:
    add r8, r8, #0x1
    cmp r8, #0x1c
    add r9, r9, #0x78
    blt .L_c8
    b .L_1e8
.L_110:
    mov r8, #0x0
.L_114:
    ldrsb r0, [r9, #0x6a]
    cmp r0, #0x0
    blt .L_148
    ldr r0, [r9, #0x34]
    and r0, r0, #0x3000000
    cmp r0, #0x3000000
    bne .L_148
    mov r0, r9
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038220
.L_148:
    add r8, r8, #0x1
    cmp r8, #0x1c
    add r9, r9, #0x78
    blt .L_114
    b .L_1e8
.L_15c:
    mov r8, #0x0
.L_160:
    ldrsb r0, [r9, #0x6a]
    cmp r0, #0x0
    blt .L_190
    ldr r0, [r9, #0x34]
    tst r0, #0x1000000
    beq .L_190
    mov r0, r9
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038220
.L_190:
    add r8, r8, #0x1
    cmp r8, #0x1c
    add r9, r9, #0x78
    blt .L_160
    b .L_1e8
.L_1a4:
    mov r8, #0x0
.L_1a8:
    ldrsb r0, [r9, #0x6a]
    cmp r0, #0x0
    blt .L_1cc
    mov r0, r9
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038220
.L_1cc:
    add r8, r8, #0x1
    cmp r8, #0x1c
    add r9, r9, #0x78
    blt .L_1a8
    b .L_1e8
.L_1e0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1e8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1f0:
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02038220
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219b200
_LIT1: .word data_0219b680
