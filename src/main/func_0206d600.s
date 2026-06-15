; func_0206d600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206be44
        .extern func_0206bf94
        .extern func_0206d4c0
        .extern func_0207108c
        .extern func_02094688
        .global func_0206d600
        .arm
func_0206d600:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    ldr r6, [r9, #0x68]
    mov r4, r1
    mov r8, r2
    ldr r1, [r6, #0x10c]
    ldr r2, [sp, #0x28]
    ldr r0, _LIT0
    mov r7, r3
    bl func_0206bf94
    movs r5, r0
    addeq sp, sp, #0x4
    mvneq r0, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    ldr r0, [sp, #0x28]
    ands r0, r0, #0x1
    beq .L_954
    ldrsb r0, [r9, #0x73]
    cmp r0, #0x1
    movne r0, #0x3
    strneb r0, [r5, #0xd]
    bne .L_95c
.L_954:
    mov r0, #0x0
    strb r0, [r5, #0xd]
.L_95c:
    ldr r2, [r6, #0xf8]
    add r1, r7, r8
    cmp r1, r2
    ldr r3, [r6, #0xfc]
    bge .L_990
    add r0, r3, r7
    str r0, [r5, #0x10]
    str r8, [r5, #0x14]
    mov r0, #0x0
    str r0, [r5, #0x18]
    mov r7, r1
    str r0, [r5, #0x1c]
    b .L_9c8
.L_990:
    add r0, r3, r7
    str r0, [r5, #0x10]
    sub r0, r2, r7
    str r0, [r5, #0x14]
    str r3, [r5, #0x18]
    ldr r0, [r5, #0x14]
    sub r0, r8, r0
    str r0, [r5, #0x1c]
    ldr r7, [r5, #0x1c]
    ldr r0, [r5, #0x14]
    ldr r1, [r5, #0x18]
    mov r2, r7
    add r0, r4, r0
    bl func_02094688
.L_9c8:
    ldr r1, [r5, #0x10]
    ldr r2, [r5, #0x14]
    mov r0, r4
    bl func_02094688
    add r0, r6, #0x100
    ldrh r4, [r0]
    strh r7, [r5, #0x20]
    ldrh r1, [r5, #0x20]
    strh r1, [r0]
    ldrsb r0, [r9, #0x73]
    cmp r0, #0x1
    bne .L_a58
    ldrh r0, [r9, #0x74]
    cmp r0, #0x0
    bne .L_a14
    bl func_0207108c
    strh r0, [r9, #0x74]
    ldrh r0, [r9, #0x74]
    strh r0, [r9, #0xa]
.L_a14:
    ldrh r0, [r9, #0x74]
    strh r0, [r5, #0x24]
    ldr r1, [r9, #0x78]
    cmp r1, #0x0
    beq .L_a34
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_a48
.L_a34:
    ldr r1, [sp, #0x24]
    ldrh r0, [sp, #0x20]
    str r1, [r5, #0x28]
    strh r0, [r5, #0x26]
    b .L_a60
.L_a48:
    str r1, [r5, #0x28]
    ldrh r0, [r9, #0x76]
    strh r0, [r5, #0x26]
    b .L_a60
.L_a58:
    mov r0, #0x0
    str r0, [r5, #0x28]
.L_a60:
    ldr r0, [r6, #0x10c]
    mov r1, r5
    bl func_0206be44
    cmp r0, #0x0
    addne r0, r6, #0x100
    movne r8, #0x0
    strneh r4, [r0]
    mov r0, r8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word func_0206d4c0
