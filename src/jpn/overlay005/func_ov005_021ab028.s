; func_ov005_021ab028 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_ov005_021ab180
        .extern func_ov005_021ab194
        .extern func_ov005_021ab200
        .extern func_ov005_021ab2a4
        .global func_ov005_021ab028
        .arm
func_ov005_021ab028:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldr r0, [r8, #0x18]
    mov r7, #0x0
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    mov r5, r1
    mov r6, r7
    ldreq r0, [r8, #0x14]
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0xc
    mul r0, r5, r0
    mov r2, r7
    mov r1, #0x4
    bl Task_PostLocked
    mov r4, r0
    mov r0, r5, lsl #0x2
    mov r1, #0x4
    mov r2, r7
    bl Task_PostLocked
    mov r5, r0
    mov r0, r8
    mov r2, r4
    mov r1, r7
    bl func_ov005_021ab194
    str r0, [r5]
    b .L_11c
.L_6c:
    mov r0, r8
    mov r2, #0x1
    bl func_ov005_021ab2a4
    cmp r0, #0x0
    beq .L_d4
    ldr r1, [r5, r7, lsl #0x2]
    mov r0, r8
    add r6, r6, #0x1
    bl func_ov005_021ab180
    cmp r0, #0x0
    beq .L_d4
    ldr r1, [r5, r7, lsl #0x2]
    mov r0, r8
    mov r2, #0x2
    bl func_ov005_021ab2a4
    cmp r0, #0x0
    beq .L_d4
    add r7, r7, #0x1
    mov r0, #0xc
    mla r2, r7, r0, r4
    add r0, r5, r7, lsl #0x2
    ldr r1, [r0, #-4]
    mov r0, r8
    bl func_ov005_021ab194
    str r0, [r5, r7, lsl #0x2]
    b .L_11c
.L_d4:
    mov r0, #0xc
    mla r9, r7, r0, r4
    mov r0, r8
    mov r1, r9
    bl func_ov005_021ab200
    str r0, [r5, r7, lsl #0x2]
    cmp r0, #0x0
    bne .L_11c
.L_f4:
    cmp r7, #0x0
    ble .L_11c
    sub r9, r9, #0xc
    mov r0, r8
    mov r1, r9
    sub r7, r7, #0x1
    bl func_ov005_021ab200
    str r0, [r5, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_f4
.L_11c:
    ldr r1, [r5, r7, lsl #0x2]
    cmp r1, #0x0
    bne .L_6c
    cmp r7, #0x0
    bgt .L_6c
    str r6, [r8, #0x14]
    ldr r1, [r8, #0x18]
    mov r0, r5
    bic r1, r1, #0x1
    str r1, [r8, #0x18]
    bl Task_InvokeLocked
    mov r0, r4
    bl Task_InvokeLocked
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
