; func_ov010_021b4784 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b90b4
        .extern data_ov010_021b9160
        .extern data_ov010_021b9170
        .extern func_020b377c
        .extern func_ov005_021ab028
        .extern func_ov005_021ab778
        .extern func_ov005_021aba20
        .extern func_ov005_021abb88
        .extern func_ov005_021abb94
        .extern func_ov005_021abd7c
        .extern func_ov005_021ac814
        .extern func_ov005_021ac87c
        .extern func_ov005_021ac8c0
        .extern func_ov005_021ac8c8
        .extern func_ov010_021b228c
        .extern func_ov010_021b22f4
        .extern func_ov010_021b2530
        .extern func_ov010_021b3634
        .extern func_ov010_021b3674
        .extern func_ov010_021b3914
        .global func_ov010_021b4784
        .arm
func_ov010_021b4784:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x12c]
    ldr r4, _LIT1
    bl func_ov005_021aba20
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0, #0xd8]
    mov r2, r7
    bl func_ov010_021b2530
    ldr r1, _LIT0
    add r5, r0, #0x0
    ldr r0, [r1, #0xd8]
    bl func_ov010_021b228c
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0xd8]
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    beq .L_6c
    ldr r0, [r4, #0x220]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x220]
    b .L_e4
.L_6c:
    ldr r0, [r4, #0x80]
    ldr r1, [r0, #0x54]
    cmp r1, #0x0
    bne .L_e4
    bl func_ov005_021ac8c0
    mov r8, r0
    cmp r8, #0x0
    ble .L_e4
    mov r0, r6
    mov r1, r8
    bl func_020b377c
    cmp r1, r8, asr #0x1
    blt .L_bc
    ldr r0, [r4, #0x220]
    add r2, r6, r8
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x220]
    sub r6, r2, r1
    b .L_d8
.L_bc:
    cmp r1, #0x0
    ble .L_d8
    ldr r0, [r4, #0x220]
    sub r6, r6, r1
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x220]
.L_d8:
    ldr r0, [r4, #0x2c]
    mov r1, r6
    bl func_ov010_021b22f4
.L_e4:
    ldr r0, [r4, #0x80]
    mov r2, r6
    mov r1, #0x0
    bl func_ov005_021abb88
    ldr r1, [r4, #0x220]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_120
    ldr r0, [r4, #0x80]
    bic r1, r1, #0x1
    str r1, [r4, #0x220]
    bl func_ov005_021abd7c
    ldr r0, [r4, #0x80]
    bl func_ov005_021ac814
.L_120:
    ldr r0, [r4, #0x80]
    mov r3, r7
    add r2, r4, #0x10
    mov r1, #0x1000
    bl func_ov005_021ab778
    ldr r3, [r4, #0x80]
    cmp r0, #0x1
    ldrh r0, [r3, #0x38]
    add r5, r5, r0
    bne .L_174
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r3
    bl func_ov005_021abb94
    ldr r0, [r4, #0x2c]
    ldr r1, [sp]
    bl func_ov010_021b22f4
    ldr r0, [r4, #0x220]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x220]
.L_174:
    ldr r0, [r4, #0x220]
    mov r1, r0, lsl #0x1e
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    bne .L_1ec
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_1ec
    ldr r0, [r4, #0x80]
    bl func_ov005_021ac87c
    mov r8, r0
    cmp r8, #0x0
    mov r6, #0x0
    ble .L_1e0
.L_1ac:
    ldr r0, [r4, #0x80]
    mov r1, r6
    bl func_ov005_021ac8c8
    ldr r1, [r4]
    cmp r1, r0
    bne .L_1d4
    mov r1, r6
    add r0, r4, #0x84
    bl func_ov010_021b3914
    b .L_1e0
.L_1d4:
    add r6, r6, #0x1
    cmp r6, r8
    blt .L_1ac
.L_1e0:
    ldr r0, [r4, #0x220]
    bic r0, r0, #0x2
    str r0, [r4, #0x220]
.L_1ec:
    ldr r0, [r4, #0x7c]
    mov r1, #0x4
    bl func_ov005_021ab028
    mov r1, r0
    sub r2, r1, #0x1
    add r0, r4, #0x84
    mov r1, #0x0
    bl func_ov010_021b3634
    ldr r0, [r4, #0xf8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x1
    bne .L_244
    mov r3, r7
    add r0, r4, #0x84
    add r2, r4, #0x10
    mov r1, #0x1000
    bl func_ov010_021b3674
    add r5, r5, r0
.L_244:
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov010_021b90b4
_LIT1: .word data_ov010_021b9160
_LIT2: .word data_ov010_021b9170
