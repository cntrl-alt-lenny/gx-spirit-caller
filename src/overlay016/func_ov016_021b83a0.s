; func_ov016_021b83a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov016_021b9454
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02005088
        .extern func_020054a4
        .extern func_0202c0c0
        .extern func_0208df0c
        .extern func_02094504
        .extern func_020a978c
        .global func_ov016_021b83a0
        .arm
func_ov016_021b83a0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x48
    mov r6, r1
    mov r5, r0
    ldrb r0, [r6, #0x10]
    bl func_02001d68
    ldr r0, _LIT0
    mov r1, #0x10
    mov r2, #0x2
    bl func_02001d0c
    ldrsb r0, [r6, #0x11]
    cmp r0, #0x0
    addne r4, r6, #0x11
    bne .L_c18
    mov r0, #0x0
    bl func_0202c0c0
    mov r4, r0
.L_c18:
    bl func_0208df0c
    add r0, r0, #0x80
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    bl func_0208df0c
    add r0, r0, #0x80
    add r2, r0, #0x4000
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r4
    mov r3, #0x2
    bl func_02005088
    ldrb r0, [r6, #0x26]
    mov r4, #0x0
    bl func_02001d68
    ldr r0, _LIT0
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001d0c
    ldrsb r0, [r6, #0x27]
    cmp r0, #0x0
    addne r7, r6, #0x27
    bne .L_c94
    mov r0, r4
    bl func_0202c0c0
    mov r7, r0
.L_c94:
    mov r0, r7
    mov r1, #0xc
    bl func_020054a4
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r4, r4, #0x14
    rsblt r0, r0, #0x8e
    addlt r4, r4, r0
    bl func_0208df0c
    add r0, r0, #0x480
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x500
    bl func_02094504
    bl func_0208df0c
    add r0, r0, #0x480
    add r2, r0, #0x4000
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r7
    add r3, r4, #0x6
    bl func_02005088
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT0
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, [r6, #0x44]
    cmp r0, #0x0
    beq .L_d40
    ldr r0, [r5, #0x1d4]
    add r0, r0, #0x36c
    add r0, r0, #0x400
    bl func_0202c0c0
    b .L_d48
.L_d40:
    mov r0, r4
    bl func_0202c0c0
.L_d48:
    mov r5, r0
    mov r0, r5
    mov r1, #0xc
    bl func_020054a4
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r4, r4, #0x14
    rsblt r0, r0, #0x8e
    addlt r4, r4, r0
    bl func_0208df0c
    add r0, r0, #0x980
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x500
    bl func_02094504
    bl func_0208df0c
    add r0, r0, #0x980
    add r2, r0, #0x4000
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r5
    add r3, r4, #0x6
    bl func_02005088
    mov r0, #0x0
    bl func_02001d68
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x2
    bl func_02001d0c
    bl func_0208df0c
    add r1, r0, #0x5500
    mov r0, #0x0
    mov r2, #0x100
    bl func_02094504
    ldr r0, [r6, #0x44]
    cmp r0, #0x0
    bne .L_df8
    mov r0, #0x0
    bl func_0202c0c0
    mov r5, r0
    b .L_e58
.L_df8:
    ldrh r2, [r6, #0x40]
    ldr r1, _LIT2
    add r0, sp, #0x18
    mov r4, #0x0
    bl func_020a978c
    ldrb r0, [sp, #0x18]
    cmp r0, #0x0
    beq .L_e48
    add r5, sp, #0x18
    add r1, sp, #0x28
.L_e20:
    ldrb r3, [r5]
    ldrb r0, [r5, #0x1]!
    mov r2, r4, lsl #0x1
    add r3, r3, #0x1f
    mov r3, r3, lsl #0x8
    orr r3, r3, #0x82
    strh r3, [r1, r2]
    cmp r0, #0x0
    add r4, r4, #0x1
    bne .L_e20
.L_e48:
    add r5, sp, #0x28
    mov r0, r4, lsl #0x1
    mov r1, #0x0
    strh r1, [r5, r0]
.L_e58:
    mov r0, r5
    mov r1, #0xc
    bl func_020054a4
    mov r4, r0
    bl func_0208df0c
    mov r2, r0
    rsb r0, r4, #0x20
    add r3, r0, r0, lsr #0x1f
    mov r1, #0x3
    str r1, [sp]
    mov r1, #0xc
    str r1, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r5
    add r2, r2, #0x5500
    mov r3, r3, asr #0x1
    bl func_02005088
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x2
    bl func_02001d0c
    bl func_0208df0c
    add r1, r0, #0x5600
    mov r0, #0x0
    mov r2, #0x100
    bl func_02094504
    ldr r0, [r6, #0x44]
    cmp r0, #0x0
    bne .L_edc
    mov r0, #0x0
    bl func_0202c0c0
    mov r5, r0
    b .L_f3c
.L_edc:
    ldrh r2, [r6, #0x42]
    ldr r1, _LIT2
    add r0, sp, #0x8
    mov r4, #0x0
    bl func_020a978c
    ldrb r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_f2c
    add r5, sp, #0x8
    add r1, sp, #0x28
.L_f04:
    ldrb r3, [r5]
    ldrb r0, [r5, #0x1]!
    mov r2, r4, lsl #0x1
    add r3, r3, #0x1f
    mov r3, r3, lsl #0x8
    orr r3, r3, #0x82
    strh r3, [r1, r2]
    cmp r0, #0x0
    add r4, r4, #0x1
    bne .L_f04
.L_f2c:
    add r5, sp, #0x28
    mov r0, r4, lsl #0x1
    mov r1, #0x0
    strh r1, [r5, r0]
.L_f3c:
    mov r0, r5
    mov r1, #0xc
    bl func_020054a4
    mov r4, r0
    bl func_0208df0c
    mov r6, r0
    rsb r0, r4, #0x20
    add r3, r0, r0, lsr #0x1f
    mov r2, #0x3
    ldr r0, _LIT0
    mov r1, r5
    str r2, [sp]
    mov r4, #0xc
    add r2, r6, #0x5600
    mov r3, r3, asr #0x1
    str r4, [sp, #0x4]
    bl func_02005088
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02102c90
_LIT1: .word data_02104f4c
_LIT2: .word data_ov016_021b9454
