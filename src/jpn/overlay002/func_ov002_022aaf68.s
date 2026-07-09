; func_ov002_022aaf68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02104e6c
        .extern func_02001cb0
        .extern func_02001cec
        .extern func_0200516c
        .extern func_0202b0ac
        .extern func_0208de58
        .extern func_0208e118
        .extern func_02094410
        .extern func_020b377c
        .global func_ov002_022aaf68
        .arm
func_ov002_022aaf68:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r6, r0
    ldr r0, [r2, #0x4]
    mov r5, r1
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1e
    add r0, r0, r0, lsr #0x1f
    movs r0, r0, asr #0x1
    movne r4, #0x16
    moveq r4, #0x0
    cmp r5, #0x0
    ldrne r0, [r6]
    cmpne r5, r0
    beq .L_120
    mov r0, r5, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    str r5, [r6]
    mov r8, r0, lsr #0x10
    mov r5, r1, lsr #0x10
    bl func_0208de58
    mov r7, r0
    ldr r0, _LIT1
    mov r1, #0x3e
    mov r2, #0x2
    bl func_02001cec
    mov r0, #0x0
    add r1, r7, #0x40
    mov r2, #0x1f00
    bl func_02094410
    ldr r0, _LIT1
    rsb r1, r8, #0xf
    mov r2, #0x0
    bl func_02001cb0
    mov r0, r5
    bl func_0202b0ac
    mov r1, r0
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    add r2, r7, #0x40
    mov r3, #0x1
    bl func_0200516c
    bl func_0208e118
    mov r1, #0x0
    add r4, r0, r4, lsl #0x6
    mov r3, #0x1
    mov r0, r1
.L_d0:
    mov r2, r0
.L_d4:
    add r2, r2, #0x1
    strh r3, [r4], #0x2
    cmp r2, #0x20
    add r3, r3, #0x1
    blt .L_d4
    add r1, r1, #0x1
    cmp r1, #0x2
    add r3, r3, #0x1e
    blt .L_d0
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r0, [r0, #0x8]
    add sp, sp, #0x8
    add r0, r0, #0x7
    mov r0, r0, lsr #0x3
    str r0, [r6, #0x10]
    str r1, [r6, #0x18]
    str r1, [r6, #0x14]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_120:
    cmp r5, #0x0
    beq .L_1c4
    ldr r0, [r6, #0x10]
    ldr r2, [r6, #0x14]
    mov r1, r0, lsl #0x3
    add r0, r2, #0x1
    add r1, r1, #0x60
    bl func_020b377c
    str r1, [r6, #0x14]
    mov r0, r1, asr #0x2
    ldr r3, [r6, #0x1c]
    ldr r2, [r6, #0x10]
    add r0, r1, r0, lsr #0x1d
    rsb r0, r3, r0, asr #0x3
    sub r5, r2, r3
    cmp r0, r5
    movle r5, r0
    cmp r5, #0x0
    ldr r0, [r6, #0x18]
    movle r5, #0x0
    cmp r0, r5
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    str r5, [r6, #0x18]
    bl func_0208e118
    mov r1, #0x0
    add r4, r0, r4, lsl #0x6
    add r3, r5, #0x1
    mov r0, r1
.L_194:
    mov r2, r0
.L_198:
    add r2, r2, #0x1
    strh r3, [r4], #0x2
    cmp r2, #0x20
    add r3, r3, #0x1
    blt .L_198
    add r1, r1, #0x1
    cmp r1, #0x2
    add r3, r3, #0x1e
    blt .L_194
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1c4:
    mov r0, #0x0
    str r0, [r6]
    bl func_0208e118
    add r1, r0, r4, lsl #0x6
    mov r0, #0x0
    mov r2, #0x80
    bl func_02094410
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_02102bb0
