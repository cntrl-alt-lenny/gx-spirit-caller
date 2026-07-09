; func_ov002_022ac540 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern func_02001cec
        .extern func_02001e3c
        .extern func_0200516c
        .extern func_0202b0ac
        .extern func_0202b854
        .extern func_0202b89c
        .extern func_0202b8cc
        .extern func_0202e1e0
        .extern func_02094410
        .extern func_ov002_021afae4
        .extern func_ov002_022abe4c
        .extern func_ov002_022ac4d4
        .global func_ov002_022ac540
        .arm
func_ov002_022ac540:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    str r0, [sp, #0x8]
    bl func_ov002_021afae4
    cmp r0, #0x6
    movgt r0, #0x6
    strgt r0, [sp, #0xc]
    bgt .L_28
    bl func_ov002_021afae4
    str r0, [sp, #0xc]
.L_28:
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x2
    bl func_02001cec
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    mov r0, #0x0
    str r0, [sp, #0x14]
    addle sp, sp, #0x20
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r2, #0x6600000
    add r0, r2, #0x1e80
    add r1, r2, #0xe80
    add r2, r2, #0xf80
    add r7, r0, #0xc000
    add r0, r1, #0x10000
    str r0, [sp, #0x10]
    add r8, r2, #0x10000
.L_70:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x14]
    ldr r2, [r0, #0x28]
    add r1, r2, r1
    bl func_ov002_022abe4c
    ldr r1, [sp, #0x8]
    mov r4, r0
    ldr r1, [r1, #0x64]
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_248
    b .L_bc
    b .L_bc
    b .L_134
    b .L_134
    b .L_134
    b .L_bc
    b .L_248
    b .L_248
.L_bc:
    bl func_0202b0ac
    mov r4, r0
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x200
    bl func_02094410
    ldr r0, [r4]
    ldr r4, _LIT0
    add r9, sp, #0x1c
    str r0, [sp, #0x18]
    mov r6, #0x4
    mov r5, #0x0
    mov sl, #0x2
    mov fp, #0xc
.L_f4:
    strb r5, [r9]
    mov r0, r4
    add r1, sp, #0x18
    mov r2, r7
    mov r3, #0x4
    stmia sp, {sl, fp}
    bl func_0200516c
    mov r0, r4
    bl func_02001e3c
    cmp r0, #0x0
    bne .L_248
    sub r9, r9, #0x1
    sub r6, r6, #0x1
    cmp r6, #0x1
    bge .L_f4
    b .L_248
.L_134:
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_248
    ldr r0, [sp, #0x8]
    ldr r3, [sp, #0x10]
    ldr r0, [r0, #0x64]
    mov r1, r7
    sub r5, r0, #0x2
    mov r0, #0x0
    mov r2, #0x200
    add r5, r3, r5, lsl #0x6
    bl func_02094410
    ldr r0, [sp, #0x8]
    mov r6, #0x1a
    ldr r0, [r0, #0x64]
    mov r9, #0x0
    cmp r0, #0x2
    beq .L_190
    cmp r0, #0x3
    beq .L_1b4
    cmp r0, #0x4
    beq .L_1d8
    b .L_1fc
.L_190:
    mov r0, r7
    mov r1, r9
    mov r3, r5
    mov r2, #0x8
    bl func_ov002_022ac4d4
    mov r0, r4
    bl func_0202b89c
    mov r9, r0
    b .L_1fc
.L_1b4:
    mov r0, r7
    mov r1, r9
    mov r3, r5
    mov r2, #0x8
    bl func_ov002_022ac4d4
    mov r0, r4
    bl func_0202b8cc
    mov r9, r0
    b .L_1fc
.L_1d8:
    mov r0, r7
    mov r3, r5
    mov r1, #0x6
    mov r2, #0x8
    bl func_ov002_022ac4d4
    mov r0, r4
    mov r6, #0x14
    bl func_0202b854
    mov r9, r0
.L_1fc:
    ldr r5, _LIT1
    mov sl, #0x6
    mov r4, #0xa
.L_208:
    mov r0, r9, lsr #0x1f
    smull r1, r2, r5, r9
    add r2, r0, r2, asr #0x2
    smull r0, r1, r4, r2
    sub r2, r9, r0
    add r3, r8, r2, lsl #0x6
    mov r0, r7
    mov r1, r6
    mov r2, sl
    bl func_ov002_022ac4d4
    mov r1, r9
    sub r6, r6, #0x6
    smull r0, r9, r5, r1
    mov r0, r1, lsr #0x1f
    adds r9, r0, r9, asr #0x2
    bne .L_208
.L_248:
    ldr r0, [sp, #0x14]
    add r7, r7, #0x200
    add r1, r0, #0x1
    ldr r0, [sp, #0xc]
    str r1, [sp, #0x14]
    cmp r1, r0
    blt .L_70
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102bb0
_LIT1: .word 0x66666667
