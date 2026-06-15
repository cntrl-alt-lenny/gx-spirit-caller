; func_ov010_021b6c4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b9884
        .extern data_ov010_021b9890
        .extern data_ov010_021b98a8
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
        .global func_ov010_021b6c4c
        .arm
func_ov010_021b6c4c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x94]
    ldr r4, _LIT1
    bl func_ov005_021abb00
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r0, [r0, #0x40]
    mov r2, r7
    bl func_ov010_021b2630
    ldr r1, _LIT0
    add r5, r0, #0x0
    ldr r0, [r1, #0x40]
    bl func_ov010_021b238c
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0x40]
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    beq .L_6c
    ldr r0, [r4, #0x358]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x358]
    b .L_e4
.L_6c:
    ldr r0, [r4, #0x88]
    ldr r1, [r0, #0x54]
    cmp r1, #0x0
    bne .L_e4
    bl func_ov005_021ac9c8
    mov r8, r0
    cmp r8, #0x0
    ble .L_e4
    mov r0, r6
    mov r1, r8
    bl func_020b3870
    cmp r1, r8, asr #0x1
    blt .L_bc
    ldr r0, [r4, #0x358]
    add r2, r6, r8
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x358]
    sub r6, r2, r1
    b .L_d8
.L_bc:
    cmp r1, #0x0
    ble .L_d8
    ldr r0, [r4, #0x358]
    sub r6, r6, r1
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x358]
.L_d8:
    ldr r0, [r4, #0x34]
    mov r1, r6
    bl func_ov010_021b23f4
.L_e4:
    ldr r0, [r4, #0x88]
    mov r2, r6
    mov r1, #0x0
    bl func_ov005_021abc68
    ldr r1, [r4, #0x358]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_120
    ldr r0, [r4, #0x88]
    bic r1, r1, #0x1
    str r1, [r4, #0x358]
    bl func_ov005_021abe5c
    ldr r0, [r4, #0x88]
    bl func_ov005_021ac91c
.L_120:
    ldr r0, [r4, #0x88]
    mov r3, r7
    add r2, r4, #0x18
    mov r1, #0x1000
    bl func_ov005_021ab858
    ldr r3, [r4, #0x88]
    cmp r0, #0x1
    ldrh r0, [r3, #0x38]
    add r5, r5, r0
    bne .L_174
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r3
    bl func_ov005_021abc74
    ldr r0, [r4, #0x34]
    ldr r1, [sp]
    bl func_ov010_021b23f4
    ldr r0, [r4, #0x358]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x358]
.L_174:
    ldr r0, [r4, #0x358]
    mov r1, r0, lsl #0x1e
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    bne .L_1ec
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_1ec
    ldr r0, [r4, #0x88]
    bl func_ov005_021ac984
    mov r8, r0
    cmp r8, #0x0
    mov r6, #0x0
    ble .L_1e0
.L_1ac:
    ldr r0, [r4, #0x88]
    mov r1, r6
    bl func_ov005_021ac9d0
    ldr r1, [r4, #0x4]
    cmp r1, r0
    bne .L_1d4
    mov r1, r6
    add r0, r4, #0x8c
    bl func_ov010_021b3a14
    b .L_1e0
.L_1d4:
    add r6, r6, #0x1
    cmp r6, r8
    blt .L_1ac
.L_1e0:
    ldr r0, [r4, #0x358]
    bic r0, r0, #0x2
    str r0, [r4, #0x358]
.L_1ec:
    ldr r0, [r4, #0x84]
    mov r1, #0x2
    bl func_ov005_021ab108
    mov r1, r0
    add r0, r4, #0x8c
    sub r2, r1, #0x1
    mov r1, #0x0
    bl func_ov010_021b3734
    mov r3, r7
    add r0, r4, #0x8c
    add r2, r4, #0x18
    mov r1, #0x1000
    bl func_ov010_021b3774
    add r0, r5, r0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov010_021b9884
_LIT1: .word data_ov010_021b9890
_LIT2: .word data_ov010_021b98a8
