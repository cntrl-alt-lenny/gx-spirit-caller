; func_0206d44c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206d2ec
        .extern func_0206d390
        .extern func_02070348
        .extern func_02070e90
        .extern func_02091924
        .global func_0206d44c
        .arm
func_0206d44c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldr r7, [r8, #0x4]
    mov r4, #0x0
    ldrsb r0, [r7, #0x73]
    ldr r6, [r7, #0x68]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_30
    cmp r0, #0x4
    movne r1, r4
.L_30:
    cmp r1, #0x0
    beq .L_44
    ldrsh r0, [r7, #0x70]
    ands r0, r0, #0x4
    beq .L_118
.L_44:
    ldr r2, [r8, #0x28]
    cmp r2, #0x0
    beq .L_5c
    ldrh r0, [r8, #0x24]
    ldrh r1, [r8, #0x26]
    bl func_02070e90
.L_5c:
    ldrsb r1, [r7, #0x73]
    mov r0, #0x1
    cmp r1, #0x0
    beq .L_74
    cmp r1, #0x4
    movne r0, #0x0
.L_74:
    cmp r0, #0x0
    movne r2, #0x36
    moveq r2, #0x2a
    ldr r0, [r7, #0x4c]
    cmp r1, #0x0
    add r5, r0, r2
    beq .L_98
    cmp r1, #0x4
    bne .L_ac
.L_98:
    ldr r0, [r7, #0x48]
    sub r0, r0, r2
    bl func_0206d390
    mov r9, r0
    b .L_b4
.L_ac:
    ldr r0, [r7, #0x48]
    sub r9, r0, r2
.L_b4:
    mov r0, r5
    mov r1, r9
    mov r2, r8
    bl func_0206d2ec
    mov r1, r0
    cmp r1, #0x0
    ble .L_11c
    mov r0, r5
    bl func_02070348
    cmp r0, #0x0
    bgt .L_110
    ldrsb r0, [r7, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_f8
    cmp r0, #0x4
    movne r1, #0x0
.L_f8:
    cmp r1, #0x0
    ldrnesh r0, [r7, #0x70]
    mvn r4, #0x4b
    bicne r0, r0, #0xe
    strneh r0, [r7, #0x70]
    b .L_11c
.L_110:
    add r4, r4, r0
    b .L_b4
.L_118:
    mvn r4, #0x4b
.L_11c:
    ldrh r2, [r8, #0x20]
    add r1, r6, #0x100
    add r0, r6, #0x104
    strh r2, [r1, #0x2]
    bl func_02091924
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
