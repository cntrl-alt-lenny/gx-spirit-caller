; func_ov015_021b405c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov015_021b5e28
        .extern data_ov015_021b5e44
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
        .extern Ov015_UpdateScrollTarget
        .extern func_ov015_021b23f4
        .extern func_ov015_021b2630
        .extern func_ov015_021b3240
        .extern func_ov015_021b3280
        .extern func_ov015_021b3520
        .global func_ov015_021b405c
        .arm
func_ov015_021b405c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r8, r0
    ldr r0, [r2, #0x898]
    mov r7, r1
    cmp r0, #0x0
    ldr r4, _LIT1
    mov r5, #0x0
    beq .L_22c
    ldr r0, [r4, #0x878]
    bl func_ov005_021abb00
    ldr r0, [r4, #0x848]
    mov r1, r8
    mov r2, r7
    bl func_ov015_021b2630
    add r5, r5, r0
    ldr r0, [r4, #0x848]
    bl Ov015_UpdateScrollTarget
    ldr r1, [r4, #0x848]
    mov r6, r0
    ldr r0, [r1, #0x18]
    cmp r0, #0x0
    beq .L_74
    ldr r0, [r4, #0xa84]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0xa84]
    b .L_ec
.L_74:
    ldr r0, [r4, #0x878]
    ldr r1, [r0, #0x54]
    cmp r1, #0x0
    bne .L_ec
    bl func_ov005_021ac9c8
    mov r9, r0
    cmp r9, #0x0
    ble .L_ec
    mov r0, r6
    mov r1, r9
    bl func_020b3870
    cmp r1, r9, asr #0x1
    blt .L_c4
    ldr r0, [r4, #0xa84]
    add r2, r6, r9
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0xa84]
    sub r6, r2, r1
    b .L_e0
.L_c4:
    cmp r1, #0x0
    ble .L_e0
    ldr r0, [r4, #0xa84]
    sub r6, r6, r1
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0xa84]
.L_e0:
    ldr r0, [r4, #0x848]
    mov r1, r6
    bl func_ov015_021b23f4
.L_ec:
    ldr r0, [r4, #0x878]
    mov r2, r6
    mov r1, #0x0
    bl func_ov005_021abc68
    ldr r1, [r4, #0xa84]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_128
    ldr r0, [r4, #0x878]
    bic r1, r1, #0x1
    str r1, [r4, #0xa84]
    bl func_ov005_021abe5c
    ldr r0, [r4, #0x878]
    bl func_ov005_021ac91c
.L_128:
    ldr r0, [r4, #0x878]
    mov r2, r8
    mov r3, r7
    mov r1, #0x1000
    bl func_ov005_021ab858
    ldr r3, [r4, #0x878]
    cmp r0, #0x1
    ldrh r0, [r3, #0x38]
    add r5, r5, r0
    bne .L_17c
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r3
    bl func_ov005_021abc74
    ldr r0, [r4, #0x848]
    ldr r1, [sp]
    bl func_ov015_021b23f4
    ldr r0, [r4, #0xa84]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0xa84]
.L_17c:
    ldr r0, [r4, #0xa84]
    mov r1, r0, lsl #0x1e
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    bne .L_1f4
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_1f4
    ldr r0, [r4, #0x878]
    bl func_ov005_021ac984
    mov r9, r0
    cmp r9, #0x0
    mov r6, #0x0
    ble .L_1e8
.L_1b4:
    ldr r0, [r4, #0x878]
    mov r1, r6
    bl func_ov005_021ac9d0
    ldr r1, [r4, #0x4]
    cmp r1, r0
    bne .L_1dc
    mov r1, r6
    add r0, r4, #0x880
    bl func_ov015_021b3520
    b .L_1e8
.L_1dc:
    add r6, r6, #0x1
    cmp r6, r9
    blt .L_1b4
.L_1e8:
    ldr r0, [r4, #0xa84]
    bic r0, r0, #0x2
    str r0, [r4, #0xa84]
.L_1f4:
    ldr r0, [r4, #0x874]
    mov r1, #0x1
    bl func_ov005_021ab108
    mov r1, r0
    add r0, r4, #0x880
    sub r2, r1, #0x1
    mov r1, #0x0
    bl func_ov015_021b3240
    mov r2, r8
    mov r3, r7
    add r0, r4, #0x880
    mov r1, #0x1000
    bl func_ov015_021b3280
    add r5, r5, r0
.L_22c:
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov015_021b5e28
_LIT1: .word data_ov015_021b5e44
