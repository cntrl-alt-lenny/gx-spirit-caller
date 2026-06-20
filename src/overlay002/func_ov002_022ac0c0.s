; func_ov002_022ac0c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_020b4768
        .extern data_ov002_022cdc78
        .extern func_0202b0e0
        .extern func_0202bb20
        .extern func_0202bb30
        .extern func_0202e234
        .extern func_0202e2c8
        .extern func_0202e2f8
        .extern func_ov002_021afbc4
        .global func_ov002_022ac0c0
        .arm
func_ov002_022ac0c0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r0, [r6, #0x68]
    cmp r0, #0x0
    beq .L_20
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r6, #0x68]
.L_20:
    ldr r0, [r6, #0x70]
    cmp r0, #0x0
    beq .L_38
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r6, #0x70]
.L_38:
    ldr r0, [r6, #0x4]
    rsb r0, r0, #0x0
    cmp r0, #0x4b
    cmpne r0, #0x4c
    cmpne r0, #0x4d
    bne .L_70
    ldr r0, _LIT0
    mov r1, #0x4
    ldr r5, [r0]
    mov r2, #0x0
    mov r0, r5, lsl #0x2
    bl Task_PostLocked
    str r0, [r6, #0x70]
    b .L_b4
.L_70:
    bl func_ov002_021afbc4
    mov r0, r0, lsl #0x2
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r4, #0x0
    str r0, [r6, #0x68]
    bl func_ov002_021afbc4
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
.L_98:
    ldr r0, [r6, #0x68]
    str r4, [r0, r4, lsl #0x2]
    add r4, r4, #0x1
    bl func_ov002_021afbc4
    cmp r4, r0
    blt .L_98
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_b4:
    ldr r0, [r6, #0x4]
    mov r4, #0x0
    rsb r0, r0, #0x0
    cmp r0, #0x4b
    beq .L_dc
    cmp r0, #0x4c
    beq .L_13c
    cmp r0, #0x4d
    beq .L_1ac
    b .L_228
.L_dc:
    cmp r5, #0x1
    mov r7, #0x1
    ble .L_228
.L_e8:
    mov r0, r7
    bl func_0202b0e0
    mov r8, r0
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_12c
    mov r0, r8
    bl func_0202bb20
    cmp r0, #0x0
    bne .L_120
    mov r0, r8
    bl func_0202bb30
    cmp r0, #0x0
    beq .L_12c
.L_120:
    ldr r0, [r6, #0x70]
    str r8, [r0, r4, lsl #0x2]
    add r4, r4, #0x1
.L_12c:
    add r7, r7, #0x1
    cmp r7, r5
    blt .L_e8
    b .L_228
.L_13c:
    cmp r5, #0x1
    mov r7, #0x1
    ble .L_228
.L_148:
    mov r0, r7
    bl func_0202b0e0
    mov r8, r0
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_19c
    mov r0, r8
    bl func_0202e2c8
    cmp r0, #0x0
    bne .L_19c
    mov r0, r8
    bl func_0202bb20
    cmp r0, #0x0
    bne .L_190
    mov r0, r8
    bl func_0202bb30
    cmp r0, #0x0
    beq .L_19c
.L_190:
    ldr r0, [r6, #0x70]
    str r8, [r0, r4, lsl #0x2]
    add r4, r4, #0x1
.L_19c:
    add r7, r7, #0x1
    cmp r7, r5
    blt .L_148
    b .L_228
.L_1ac:
    cmp r5, #0x1
    mov r7, #0x1
    ble .L_228
.L_1b8:
    mov r0, r7
    bl func_0202b0e0
    mov r8, r0
    bl func_0202e234
    cmp r0, #0x0
    beq .L_21c
    mov r0, r8
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_21c
    mov r0, r8
    bl func_0202e2c8
    cmp r0, #0x0
    bne .L_21c
    mov r0, r8
    bl func_0202bb20
    cmp r0, #0x0
    bne .L_210
    mov r0, r8
    bl func_0202bb30
    cmp r0, #0x0
    beq .L_21c
.L_210:
    ldr r0, [r6, #0x70]
    str r8, [r0, r4, lsl #0x2]
    add r4, r4, #0x1
.L_21c:
    add r7, r7, #0x1
    cmp r7, r5
    blt .L_1b8
.L_228:
    ldr r0, _LIT1
    str r4, [r0, #0xc]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020b4768
_LIT1: .word data_ov002_022cdc78
