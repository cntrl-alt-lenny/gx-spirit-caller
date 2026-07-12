; func_ov008_021af5f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern data_ov008_021b2cc4
        .extern func_020221e0
        .extern func_0202bacc
        .extern func_020b377c
        .extern func_ov008_021aa42c
        .extern func_ov008_021aecd8
        .extern func_ov008_021af3a0
        .extern func_ov008_021af464
        .global func_ov008_021af5f8
        .arm
func_ov008_021af5f8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1fc
    mov r4, r1
    mov r9, r0
    mov r0, r4
    bl func_ov008_021aecd8
    str r0, [sp, #0x18]
    mov r0, r4
    bl func_ov008_021af3a0
    and r0, r0, #0xff
    str r0, [sp, #0x14]
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1, #0xb8]
    str r0, [sp, #0x10]
    cmp r1, #0x0
    bne .L_50
    ldr r1, [sp, #0x14]
    mov r0, #0x2
    bl func_020221e0
.L_50:
    ldr r0, [sp, #0x18]
    add r1, sp, #0x1c
    mov r2, #0x11
    bl func_ov008_021af464
    mov r3, r0, lsl #0x10
    ldr r0, [sp, #0x18]
    add r1, sp, #0x10c
    mov r2, #0x1
    mov sl, r3, lsr #0x10
    bl func_ov008_021af464
    ldr r1, [sp, #0x14]
    mov r2, #0x1
    mov r1, r2, lsl r1
    str r1, [sp, #0xc]
    mov r1, r0, lsl #0x10
    ldr r3, _LIT1
    ldr r0, [sp, #0x18]
    mov r2, #0x34
    mla r6, r0, r2, r3
    ldr r0, [sp, #0x14]
    mov r2, #0x3
    mov r0, r0, lsl #0x1
    str r0, [sp, #0x4]
    mvn r0, r2, lsl r0
    str r0, [sp]
    ldr r0, [sp, #0xc]
    mov r7, r1, lsr #0x10
    orr r0, r0, #0x10
    str r0, [sp, #0x8]
    mov r8, #0x0
.L_c8:
    cmp r8, #0x4
    mov r5, #0x1
    mov r4, #0x0
    addls pc, pc, r8, lsl #0x2
    b .L_2f0
    b .L_274
    b .L_274
    b .L_274
    b .L_1f0
    b .L_f0
.L_f0:
    ldr r0, [sp, #0x8]
    add r1, sp, #0x1c
    mov r2, r0, lsl #0x10
    ldr r0, [sp, #0x18]
    mov r2, r2, lsr #0x10
    bl func_ov008_021af464
    ldr r2, [sp, #0xc]
    mov r0, r0, lsl #0x10
    mov sl, r0, lsr #0x10
    mov r2, r2, lsl #0x10
    ldr r0, [sp, #0x18]
    add r1, sp, #0x10c
    mov r2, r2, lsr #0x10
    bl func_ov008_021af464
    mov r0, r0, lsl #0x10
    mov r7, r0, lsr #0x10
    ldr r1, [r6, #0x38]
    ldr r0, [sp, #0x4]
    cmp sl, #0x0
    mov r0, r1, lsr r0
    and r5, r0, #0x3
    beq .L_160
    cmp r5, #0x2
    bcc .L_160
    ldr r0, [sp]
    mov r4, #0x1
    and r0, r1, r0
    str r0, [r6, #0x38]
.L_160:
    cmp r4, #0x0
    beq .L_188
    bl func_ov008_021aa42c
    mov r1, sl
    bl func_020b377c
    add r2, sp, #0x1c
    ldr r1, [r2, r1, lsl #0x2]
    mov r0, r8, lsl #0x1
    strh r1, [r9, r0]
    b .L_2f0
.L_188:
    bl func_ov008_021aa42c
    mov r1, r7
    bl func_020b377c
    add r2, sp, #0x10c
    ldr r1, [r2, r1, lsl #0x2]
    mov r0, r8, lsl #0x1
    strh r1, [r9, r0]
    ldrh r0, [r9, r0]
    bl func_0202bacc
    cmp r0, #0x0
    beq .L_1dc
    ldr r2, [r6, #0x38]
    ldr r0, [sp]
    add r1, r5, #0x1
    and r2, r2, r0
    and r0, r1, #0xff
    and r1, r0, #0x3
    ldr r0, [sp, #0x4]
    orr r0, r2, r1, lsl r0
    str r0, [r6, #0x38]
    b .L_2f0
.L_1dc:
    ldr r1, [r6, #0x38]
    ldr r0, [sp]
    and r0, r1, r0
    str r0, [r6, #0x38]
    b .L_2f0
.L_1f0:
    ldr r0, [sp, #0x10]
    cmp r0, #0x3
    bne .L_240
    cmp sl, #0x0
    beq .L_24c
    ldr r0, [r6, #0x38]
    and r2, r0, #0x3
    cmp r2, #0x2
    bcc .L_224
    bic r0, r0, #0x3
    str r0, [r6, #0x38]
    mov r4, r5
    b .L_24c
.L_224:
    bic r1, r0, #0x3
    add r0, r2, #0x1
    and r0, r0, #0xff
    and r0, r0, #0x3
    orr r0, r1, r0
    str r0, [r6, #0x38]
    b .L_24c
.L_240:
    ldr r0, [r6, #0x38]
    bic r0, r0, #0x3
    str r0, [r6, #0x38]
.L_24c:
    cmp r4, #0x0
    beq .L_274
    bl func_ov008_021aa42c
    mov r1, sl
    bl func_020b377c
    add r2, sp, #0x1c
    ldr r1, [r2, r1, lsl #0x2]
    mov r0, r8, lsl #0x1
    strh r1, [r9, r0]
    b .L_2f0
.L_274:
    mov r4, r8, lsl #0x1
    add fp, sp, #0x10c
.L_27c:
    bl func_ov008_021aa42c
    mov r1, r7
    bl func_020b377c
    ldr r0, [fp, r1, lsl #0x2]
    cmp r8, #0x0
    strh r0, [r9, r4]
    mov r1, #0x0
    ble .L_2bc
    ldrh r2, [r9, r4]
.L_2a0:
    mov r0, r1, lsl #0x1
    ldrh r0, [r9, r0]
    cmp r2, r0
    beq .L_2bc
    add r1, r1, #0x1
    cmp r1, r8
    blt .L_2a0
.L_2bc:
    cmp r1, r8
    moveq r5, #0x0
    cmp r5, #0x0
    bne .L_27c
    mov r0, r8, lsl #0x1
    ldrh r0, [r9, r0]
    bl func_0202bacc
    cmp r0, #0x0
    beq .L_2f0
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    and r0, r0, #0xff
    str r0, [sp, #0x10]
.L_2f0:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_c8
    ldr r1, _LIT0
    ldr r0, [sp, #0x14]
    strh r0, [r1, #0x6]
    add sp, sp, #0x1fc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2cc4
_LIT1: .word data_ov008_021b2660
