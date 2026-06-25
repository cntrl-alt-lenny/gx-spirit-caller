; func_0205f7d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100ff4
        .extern func_02055224
        .extern func_0205f9bc
        .extern func_0205fa50
        .extern func_0205ff4c
        .extern func_0206043c
        .global func_0205f7d0
        .arm
func_0205f7d0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    movs r8, r1
    mov r9, r0
    mov r7, r2
    mov r6, r3
    ldr r5, [sp, #0x28]
    ldr r4, [sp, #0x2c]
    beq .L_1cd0
    ldrsb r0, [r8]
    cmp r0, #0x0
    bne .L_1d44
.L_1cd0:
    cmp r6, #0x0
    beq .L_1ce4
    ldrsb r0, [r6]
    cmp r0, #0x0
    bne .L_1d44
.L_1ce4:
    cmp r5, #0x0
    beq .L_1cf8
    ldrsb r0, [r5]
    cmp r0, #0x0
    bne .L_1d44
.L_1cf8:
    cmp r4, #0x0
    beq .L_1d0c
    ldrsb r0, [r4]
    cmp r0, #0x0
    bne .L_1d44
.L_1d0c:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_1d44
    cmp r7, #0x0
    beq .L_1d2c
    ldrsb r0, [r7]
    cmp r0, #0x0
    bne .L_1d44
.L_1d2c:
    ldr r1, _LIT0
    mov r0, r9
    bl func_0205ff4c
    add sp, sp, #0xc
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1d44:
    add r1, sp, #0x4
    mov r0, r9
    mov r2, #0x1
    bl func_0205fa50
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    cmp r8, #0x0
    ldreq r0, [sp, #0x4]
    moveq r1, #0x0
    streqb r1, [r0, #0x28]
    beq .L_1d88
    ldr r0, [sp, #0x4]
    mov r1, r8
    add r0, r0, #0x28
    mov r2, #0x1f
    bl func_0206043c
.L_1d88:
    cmp r7, #0x0
    ldreq r0, [sp, #0x4]
    moveq r1, #0x0
    streqb r1, [r0, #0x47]
    beq .L_1db0
    ldr r0, [sp, #0x4]
    mov r1, r7
    add r0, r0, #0x47
    mov r2, #0x15
    bl func_0206043c
.L_1db0:
    cmp r6, #0x0
    ldreq r0, [sp, #0x4]
    moveq r1, #0x0
    streqb r1, [r0, #0x5c]
    beq .L_1dd8
    ldr r0, [sp, #0x4]
    mov r1, r6
    add r0, r0, #0x5c
    mov r2, #0x33
    bl func_0206043c
.L_1dd8:
    ldr r0, [sp, #0x4]
    add r0, r0, #0x5c
    bl func_02055224
    cmp r5, #0x0
    ldreq r0, [sp, #0x4]
    moveq r1, #0x0
    streqb r1, [r0, #0x8f]
    beq .L_1e0c
    ldr r0, [sp, #0x4]
    mov r1, r5
    add r0, r0, #0x8f
    mov r2, #0x1f
    bl func_0206043c
.L_1e0c:
    cmp r4, #0x0
    ldreq r0, [sp, #0x4]
    moveq r1, #0x0
    streqb r1, [r0, #0xae]
    beq .L_1e34
    ldr r0, [sp, #0x4]
    mov r1, r4
    add r0, r0, #0xae
    mov r2, #0x1f
    bl func_0206043c
.L_1e34:
    ldr r0, [sp, #0x34]
    ldr r2, [sp, #0x30]
    ldr r1, [sp, #0x4]
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [sp, #0x34]
    str r2, [r1, #0x130]
    ldr r2, [sp, #0x34]
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x40]
    str r2, [r1, #0x134]
    str r0, [sp]
    ldr r1, [sp, #0x4]
    ldr r2, [sp, #0x38]
    ldr r3, [sp, #0x3c]
    mov r0, r9
    bl func_0205f9bc
    cmp r0, #0x0
    moveq r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02100ff4
