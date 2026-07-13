; func_ov017_021b4234 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern func_02001cec
        .extern func_0200506c
        .extern func_02005488
        .extern func_02094410
        .extern func_0209445c
        .global func_ov017_021b4234
        .arm
func_ov017_021b4234:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r7, r3
    ldr r6, [sp, #0x30]
    mov r3, r7, asr #0x2
    add r3, r7, r3, lsr #0x1d
    mov sl, r1
    mov r9, r0
    mov r8, r2
    and r5, r6, #0x3
    movs r6, r6, asr #0x2
    mov r4, r3, asr #0x3
    mov r1, sl
    mov r2, r7
    mov r0, #0x0
    moveq r6, #0xc
    bl func_02094410
    mov r0, r4, asr #0x2
    add r1, r4, r0, lsr #0x1d
    ldr r0, _LIT0
    mov r1, r1, asr #0x3
    mov r2, #0x2
    bl func_02001cec
    cmp r5, #0x0
    beq .L_1b0
    cmp r5, #0x1
    beq .L_1cc
    cmp r5, #0x2
    beq .L_204
    b .L_234
.L_1b0:
    ldr r0, _LIT0
    mov r3, #0x2
    mov r1, r8
    mov r2, sl
    stmia sp, {r3, r6}
    bl func_0200506c
    b .L_234
.L_1cc:
    mov r0, r8
    mov r1, r6
    bl func_02005488
    sub r0, r4, r0
    add r3, r0, r0, lsr #0x1f
    mov r0, #0x1
    str r0, [sp]
    ldr r0, _LIT0
    mov r1, r8
    mov r2, sl
    mov r3, r3, asr #0x1
    str r6, [sp, #0x4]
    bl func_0200506c
    b .L_234
.L_204:
    mov r0, r8
    mov r1, r6
    bl func_02005488
    sub r3, r4, r0
    mov r0, #0x2
    str r0, [sp]
    ldr r0, _LIT0
    mov r1, r8
    mov r2, sl
    sub r3, r3, #0x2
    str r6, [sp, #0x4]
    bl func_0200506c
.L_234:
    mov r0, r9, lsl #0x7
    add r5, r0, #0x6600000
    mov r1, r5
    mov r2, r7
    mov r0, #0x0
    bl func_02094410
    mov r0, r4, asr #0x4
    add r0, r4, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    mov r9, r0, lsl #0x1
    cmp r9, #0x0
    mov r6, #0x0
    addle sp, sp, #0x8
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4, lsl #0x3
    add r0, r0, r0, lsr #0x1f
    mov r7, r6
    mov r8, r6
    add fp, sl, r0, asr #0x1
.L_280:
    mov r0, r8, lsl #0x8
    add r4, r0, r0, lsr #0x1f
    add r1, r7, r7, lsr #0x1f
    mov r2, #0x80
    add r0, sl, r4, asr #0x1
    add r1, r5, r1, asr #0x1
    bl func_0209445c
    add r1, r6, #0x1
    mov r1, r1, lsl #0x8
    add r1, r1, r1, lsr #0x1f
    add r0, fp, r4, asr #0x1
    add r1, r5, r1, asr #0x1
    mov r2, #0x80
    bl func_0209445c
    add r6, r6, #0x2
    cmp r6, r9
    add r7, r7, #0x200
    add r8, r8, #0x1
    blt .L_280
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102bb0
