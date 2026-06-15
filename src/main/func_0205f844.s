; func_0205f844 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021010d4
        .extern func_02055298
        .extern func_0205fa30
        .extern func_0205fac4
        .extern func_0205ffc0
        .extern func_020604b0
        .global func_0205f844
        .arm
func_0205f844:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    movs r8, r1
    mov r9, r0
    mov r7, r2
    mov r6, r3
    ldr r5, [sp, #0x28]
    ldr r4, [sp, #0x2c]
    beq .L_1e2c
    ldrsb r0, [r8]
    cmp r0, #0x0
    bne .L_1ea0
.L_1e2c:
    cmp r6, #0x0
    beq .L_1e40
    ldrsb r0, [r6]
    cmp r0, #0x0
    bne .L_1ea0
.L_1e40:
    cmp r5, #0x0
    beq .L_1e54
    ldrsb r0, [r5]
    cmp r0, #0x0
    bne .L_1ea0
.L_1e54:
    cmp r4, #0x0
    beq .L_1e68
    ldrsb r0, [r4]
    cmp r0, #0x0
    bne .L_1ea0
.L_1e68:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_1ea0
    cmp r7, #0x0
    beq .L_1e88
    ldrsb r0, [r7]
    cmp r0, #0x0
    bne .L_1ea0
.L_1e88:
    ldr r1, _LIT0
    mov r0, r9
    bl func_0205ffc0
    add sp, sp, #0xc
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1ea0:
    add r1, sp, #0x4
    mov r0, r9
    mov r2, #0x1
    bl func_0205fac4
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    cmp r8, #0x0
    ldreq r0, [sp, #0x4]
    moveq r1, #0x0
    streqb r1, [r0, #0x28]
    beq .L_1ee4
    ldr r0, [sp, #0x4]
    mov r1, r8
    add r0, r0, #0x28
    mov r2, #0x1f
    bl func_020604b0
.L_1ee4:
    cmp r7, #0x0
    ldreq r0, [sp, #0x4]
    moveq r1, #0x0
    streqb r1, [r0, #0x47]
    beq .L_1f0c
    ldr r0, [sp, #0x4]
    mov r1, r7
    add r0, r0, #0x47
    mov r2, #0x15
    bl func_020604b0
.L_1f0c:
    cmp r6, #0x0
    ldreq r0, [sp, #0x4]
    moveq r1, #0x0
    streqb r1, [r0, #0x5c]
    beq .L_1f34
    ldr r0, [sp, #0x4]
    mov r1, r6
    add r0, r0, #0x5c
    mov r2, #0x33
    bl func_020604b0
.L_1f34:
    ldr r0, [sp, #0x4]
    add r0, r0, #0x5c
    bl func_02055298
    cmp r5, #0x0
    ldreq r0, [sp, #0x4]
    moveq r1, #0x0
    streqb r1, [r0, #0x8f]
    beq .L_1f68
    ldr r0, [sp, #0x4]
    mov r1, r5
    add r0, r0, #0x8f
    mov r2, #0x1f
    bl func_020604b0
.L_1f68:
    cmp r4, #0x0
    ldreq r0, [sp, #0x4]
    moveq r1, #0x0
    streqb r1, [r0, #0xae]
    beq .L_1f90
    ldr r0, [sp, #0x4]
    mov r1, r4
    add r0, r0, #0xae
    mov r2, #0x1f
    bl func_020604b0
.L_1f90:
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
    bl func_0205fa30
    cmp r0, #0x0
    moveq r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_021010d4
