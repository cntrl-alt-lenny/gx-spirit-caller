; func_ov010_021b4884 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b91b4
        .extern data_ov010_021b9260
        .extern data_ov010_021b9270
        .extern func_020b3870
        .extern func_ov005_021ab108
        .extern func_ov005_021ab858
        .extern func_ov005_021abb00
        .extern func_ov005_021abc68
        .extern func_ov005_021abc74
        .extern func_ov005_021abe5c
        .extern func_ov005_021ac91c
        .extern func_ov005_021ac984
        .extern func_ov005_021ac9c8
        .extern func_ov005_021ac9d0
        .extern func_ov010_021b238c
        .extern func_ov010_021b23f4
        .extern func_ov010_021b2630
        .extern func_ov010_021b3734
        .extern func_ov010_021b3774
        .extern func_ov010_021b3a14
        .global func_ov010_021b4884
        .arm
func_ov010_021b4884:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x12c]
    ldr r4, _LIT1
    bl func_ov005_021abb00
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0, #0xd8]
    mov r2, r7
    bl func_ov010_021b2630
    ldr r1, _LIT0
    add r5, r0, #0x0
    ldr r0, [r1, #0xd8]
    bl func_ov010_021b238c
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0xd8]
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    beq .L_184
    ldr r0, [r4, #0x220]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x220]
    b .L_1fc
.L_184:
    ldr r0, [r4, #0x80]
    ldr r1, [r0, #0x54]
    cmp r1, #0x0
    bne .L_1fc
    bl func_ov005_021ac9c8
    mov r8, r0
    cmp r8, #0x0
    ble .L_1fc
    mov r0, r6
    mov r1, r8
    bl func_020b3870
    cmp r1, r8, asr #0x1
    blt .L_1d4
    ldr r0, [r4, #0x220]
    add r2, r6, r8
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x220]
    sub r6, r2, r1
    b .L_1f0
.L_1d4:
    cmp r1, #0x0
    ble .L_1f0
    ldr r0, [r4, #0x220]
    sub r6, r6, r1
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x220]
.L_1f0:
    ldr r0, [r4, #0x2c]
    mov r1, r6
    bl func_ov010_021b23f4
.L_1fc:
    ldr r0, [r4, #0x80]
    mov r2, r6
    mov r1, #0x0
    bl func_ov005_021abc68
    ldr r1, [r4, #0x220]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_238
    ldr r0, [r4, #0x80]
    bic r1, r1, #0x1
    str r1, [r4, #0x220]
    bl func_ov005_021abe5c
    ldr r0, [r4, #0x80]
    bl func_ov005_021ac91c
.L_238:
    ldr r0, [r4, #0x80]
    mov r3, r7
    add r2, r4, #0x10
    mov r1, #0x1000
    bl func_ov005_021ab858
    ldr r3, [r4, #0x80]
    cmp r0, #0x1
    ldrh r0, [r3, #0x38]
    add r5, r5, r0
    bne .L_28c
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r3
    bl func_ov005_021abc74
    ldr r0, [r4, #0x2c]
    ldr r1, [sp]
    bl func_ov010_021b23f4
    ldr r0, [r4, #0x220]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x220]
.L_28c:
    ldr r0, [r4, #0x220]
    mov r1, r0, lsl #0x1e
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    bne .L_304
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_304
    ldr r0, [r4, #0x80]
    bl func_ov005_021ac984
    mov r8, r0
    cmp r8, #0x0
    mov r6, #0x0
    ble .L_2f8
.L_2c4:
    ldr r0, [r4, #0x80]
    mov r1, r6
    bl func_ov005_021ac9d0
    ldr r1, [r4]
    cmp r1, r0
    bne .L_2ec
    mov r1, r6
    add r0, r4, #0x84
    bl func_ov010_021b3a14
    b .L_2f8
.L_2ec:
    add r6, r6, #0x1
    cmp r6, r8
    blt .L_2c4
.L_2f8:
    ldr r0, [r4, #0x220]
    bic r0, r0, #0x2
    str r0, [r4, #0x220]
.L_304:
    ldr r0, [r4, #0x7c]
    mov r1, #0x4
    bl func_ov005_021ab108
    mov r1, r0
    sub r2, r1, #0x1
    add r0, r4, #0x84
    mov r1, #0x0
    bl func_ov010_021b3734
    ldr r0, [r4, #0xf8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x1
    bne .L_35c
    mov r3, r7
    add r0, r4, #0x84
    add r2, r4, #0x10
    mov r1, #0x1000
    bl func_ov010_021b3774
    add r5, r5, r0
.L_35c:
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov010_021b91b4
_LIT1: .word data_ov010_021b9260
_LIT2: .word data_ov010_021b9270
