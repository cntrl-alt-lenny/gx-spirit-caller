; func_ov016_021b8234 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02104e6c
        .extern data_ov016_021b92f4
        .extern func_02001cec
        .extern func_02001d48
        .extern func_0200506c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_0208de24
        .extern func_02094410
        .extern func_020a9698
        .global func_ov016_021b8234
        .arm
func_ov016_021b8234:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x48
    mov r6, r1
    mov r5, r0
    ldrb r0, [r6, #0x10]
    bl func_02001d48
    ldr r0, _LIT0
    mov r1, #0x10
    mov r2, #0x2
    bl func_02001cec
    ldrsb r0, [r6, #0x11]
    cmp r0, #0x0
    addne r4, r6, #0x11
    bne .L_44
    mov r0, #0x0
    bl func_0202c06c
    mov r4, r0
.L_44:
    bl func_0208de24
    add r0, r0, #0x80
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    bl func_0208de24
    add r0, r0, #0x80
    add r2, r0, #0x4000
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r4
    mov r3, #0x2
    bl func_0200506c
    ldrb r0, [r6, #0x26]
    mov r4, #0x0
    bl func_02001d48
    ldr r0, _LIT0
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001cec
    ldrsb r0, [r6, #0x27]
    cmp r0, #0x0
    addne r7, r6, #0x27
    bne .L_c0
    mov r0, r4
    bl func_0202c06c
    mov r7, r0
.L_c0:
    mov r0, r7
    mov r1, #0xc
    bl func_02005488
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r4, r4, #0x14
    rsblt r0, r0, #0x8e
    addlt r4, r4, r0
    bl func_0208de24
    add r0, r0, #0x480
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x500
    bl func_02094410
    bl func_0208de24
    add r0, r0, #0x480
    add r2, r0, #0x4000
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r7
    add r3, r4, #0x6
    bl func_0200506c
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT0
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001cec
    ldr r0, [r6, #0x44]
    cmp r0, #0x0
    beq .L_16c
    ldr r0, [r5, #0x1d4]
    add r0, r0, #0x36c
    add r0, r0, #0x400
    bl func_0202c06c
    b .L_174
.L_16c:
    mov r0, r4
    bl func_0202c06c
.L_174:
    mov r5, r0
    mov r0, r5
    mov r1, #0xc
    bl func_02005488
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r4, r4, #0x14
    rsblt r0, r0, #0x8e
    addlt r4, r4, r0
    bl func_0208de24
    add r0, r0, #0x980
    add r1, r0, #0x4000
    mov r0, #0x0
    mov r2, #0x500
    bl func_02094410
    bl func_0208de24
    add r0, r0, #0x980
    add r2, r0, #0x4000
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r5
    add r3, r4, #0x6
    bl func_0200506c
    mov r0, #0x0
    bl func_02001d48
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x2
    bl func_02001cec
    bl func_0208de24
    add r1, r0, #0x5500
    mov r0, #0x0
    mov r2, #0x100
    bl func_02094410
    ldr r0, [r6, #0x44]
    cmp r0, #0x0
    bne .L_224
    mov r0, #0x0
    bl func_0202c06c
    mov r5, r0
    b .L_284
.L_224:
    ldrh r2, [r6, #0x40]
    ldr r1, _LIT2
    add r0, sp, #0x18
    mov r4, #0x0
    bl func_020a9698
    ldrb r0, [sp, #0x18]
    cmp r0, #0x0
    beq .L_274
    add r5, sp, #0x18
    add r1, sp, #0x28
.L_24c:
    ldrb r3, [r5]
    ldrb r0, [r5, #0x1]!
    mov r2, r4, lsl #0x1
    add r3, r3, #0x1f
    mov r3, r3, lsl #0x8
    orr r3, r3, #0x82
    strh r3, [r1, r2]
    cmp r0, #0x0
    add r4, r4, #0x1
    bne .L_24c
.L_274:
    add r5, sp, #0x28
    mov r0, r4, lsl #0x1
    mov r1, #0x0
    strh r1, [r5, r0]
.L_284:
    mov r0, r5
    mov r1, #0xc
    bl func_02005488
    mov r4, r0
    bl func_0208de24
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
    bl func_0200506c
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x2
    bl func_02001cec
    bl func_0208de24
    add r1, r0, #0x5600
    mov r0, #0x0
    mov r2, #0x100
    bl func_02094410
    ldr r0, [r6, #0x44]
    cmp r0, #0x0
    bne .L_308
    mov r0, #0x0
    bl func_0202c06c
    mov r5, r0
    b .L_368
.L_308:
    ldrh r2, [r6, #0x42]
    ldr r1, _LIT2
    add r0, sp, #0x8
    mov r4, #0x0
    bl func_020a9698
    ldrb r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_358
    add r5, sp, #0x8
    add r1, sp, #0x28
.L_330:
    ldrb r3, [r5]
    ldrb r0, [r5, #0x1]!
    mov r2, r4, lsl #0x1
    add r3, r3, #0x1f
    mov r3, r3, lsl #0x8
    orr r3, r3, #0x82
    strh r3, [r1, r2]
    cmp r0, #0x0
    add r4, r4, #0x1
    bne .L_330
.L_358:
    add r5, sp, #0x28
    mov r0, r4, lsl #0x1
    mov r1, #0x0
    strh r1, [r5, r0]
.L_368:
    mov r0, r5
    mov r1, #0xc
    bl func_02005488
    mov r4, r0
    bl func_0208de24
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
    bl func_0200506c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02102bb0
_LIT1: .word data_02104e6c
_LIT2: .word data_ov016_021b92f4
