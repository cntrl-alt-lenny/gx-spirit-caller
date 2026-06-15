; func_0206d4c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206d360
        .extern func_0206d404
        .extern func_02070430
        .extern func_02070f78
        .extern func_02091a0c
        .global func_0206d4c0
        .arm
func_0206d4c0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldr r7, [r8, #0x4]
    mov r4, #0x0
    ldrsb r0, [r7, #0x73]
    ldr r6, [r7, #0x68]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_7e4
    cmp r0, #0x4
    movne r1, r4
.L_7e4:
    cmp r1, #0x0
    beq .L_7f8
    ldrsh r0, [r7, #0x70]
    ands r0, r0, #0x4
    beq .L_8cc
.L_7f8:
    ldr r2, [r8, #0x28]
    cmp r2, #0x0
    beq .L_810
    ldrh r0, [r8, #0x24]
    ldrh r1, [r8, #0x26]
    bl func_02070f78
.L_810:
    ldrsb r1, [r7, #0x73]
    mov r0, #0x1
    cmp r1, #0x0
    beq .L_828
    cmp r1, #0x4
    movne r0, #0x0
.L_828:
    cmp r0, #0x0
    movne r2, #0x36
    moveq r2, #0x2a
    ldr r0, [r7, #0x4c]
    cmp r1, #0x0
    add r5, r0, r2
    beq .L_84c
    cmp r1, #0x4
    bne .L_860
.L_84c:
    ldr r0, [r7, #0x48]
    sub r0, r0, r2
    bl func_0206d404
    mov r9, r0
    b .L_868
.L_860:
    ldr r0, [r7, #0x48]
    sub r9, r0, r2
.L_868:
    mov r0, r5
    mov r1, r9
    mov r2, r8
    bl func_0206d360
    mov r1, r0
    cmp r1, #0x0
    ble .L_8d0
    mov r0, r5
    bl func_02070430
    cmp r0, #0x0
    bgt .L_8c4
    ldrsb r0, [r7, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_8ac
    cmp r0, #0x4
    movne r1, #0x0
.L_8ac:
    cmp r1, #0x0
    ldrnesh r0, [r7, #0x70]
    mvn r4, #0x4b
    bicne r0, r0, #0xe
    strneh r0, [r7, #0x70]
    b .L_8d0
.L_8c4:
    add r4, r4, r0
    b .L_868
.L_8cc:
    mvn r4, #0x4b
.L_8d0:
    ldrh r2, [r8, #0x20]
    add r1, r6, #0x100
    add r0, r6, #0x104
    strh r2, [r1, #0x2]
    bl func_02091a0c
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
