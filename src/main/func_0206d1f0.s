; func_0206d1f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206d148
        .extern func_0206e4a4
        .extern func_0209268c
        .extern func_02092748
        .extern func_020927b8
        .extern func_02093808
        .global func_0206d1f0
        .arm
func_0206d1f0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    bl func_0206e4a4
    cmp r0, #0x0
    addne sp, sp, #0xc
    mvnne r0, #0x1b
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxne lr
    ldr r0, [sp, #0x2c]
    ands r0, r0, #0x4
    bne .L_52c
    ldrsb r0, [r9, #0x72]
    cmp r0, #0x0
    bne .L_54c
.L_52c:
    ldrsb r0, [r9, #0x73]
    cmp r0, #0x4
    addeq sp, sp, #0xc
    mvneq r0, #0x1b
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    mov r4, #0x0
    b .L_568
.L_54c:
    bl func_02093808
    cmp r0, #0x12
    addeq sp, sp, #0xc
    mvneq r0, #0x1b
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    mov r4, #0x1
.L_568:
    cmp r9, #0x0
    mov r1, #0x0
    beq .L_580
    ldrsh r0, [r9, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_580:
    cmp r1, #0x0
    addeq sp, sp, #0xc
    mvneq r0, #0x26
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    ldrsb r0, [r9, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_5ac
    cmp r0, #0x4
    movne r1, #0x0
.L_5ac:
    cmp r1, #0x0
    beq .L_5dc
    ldrsh r0, [r9, #0x70]
    ands r0, r0, #0x4
    beq .L_5cc
    ldrsh r0, [r9, #0x70]
    ands r0, r0, #0x8
    beq .L_5dc
.L_5cc:
    add sp, sp, #0xc
    mvn r0, #0x37
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_5dc:
    ands r0, r4, #0x1
    ldr r5, [r9, #0x64]
    bne .L_608
    add r0, r5, #0xe0
    bl func_0209268c
    cmp r0, #0x0
    bne .L_610
    add sp, sp, #0xc
    mvn r0, #0x5
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_608:
    add r0, r5, #0xe0
    bl func_020927b8
.L_610:
    ldr r0, [sp, #0x28]
    ldr ip, [sp, #0x2c]
    str r0, [sp]
    str r4, [sp, #0x4]
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, r6
    str ip, [sp, #0x8]
    bl func_0206d148
    mov r4, r0
    add r0, r5, #0xe0
    bl func_02092748
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
