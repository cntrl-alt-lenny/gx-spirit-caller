; func_ov008_021af910 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b25bc
        .extern data_ov008_021b2cc4
        .extern data_ov008_021b2ccc
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_02022228
        .extern func_0202bdf8
        .extern OS_SPrintf
        .extern func_ov008_021af5f8
        .global func_ov008_021af910
        .arm
func_ov008_021af910:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    ldr r1, _LIT0
    mov sl, r0
    ldr r1, [r1, #0xc0]
    add r0, sl, sl, lsl #0x2
    add r6, r1, r0, lsl #0x1
    mov r0, r6
    mov r1, sl
    bl func_ov008_021af5f8
    ldr r2, _LIT1
    mov r0, sl, lsr #0x1f
    smull r1, r3, r2, sl
    add r3, r0, r3, asr #0x1
    mov r2, #0x5
    smull r0, r1, r2, r3
    sub r3, sl, r0
    ldr r8, _LIT2
    ldr fp, _LIT3
    ldr r4, _LIT0
    add r9, r3, r3, lsl #0x2
    mov r7, #0x0
    add r5, sp, #0x0
.L_508:
    ldr r0, [r4, #0xb8]
    cmp r0, #0x0
    bne .L_54c
    mov r0, r7, lsl #0x1
    ldrh r2, [r6, r0]
    ldr r1, _LIT4
    mov r0, r8
    bl OS_SPrintf
    mov r1, r8
    add r0, r7, #0x2
    bl func_02022228
    strh fp, [r4, #0xaa]
    ldrh r0, [r4, #0x6]
    cmp r0, #0x1
    ldreqh r0, [r4, #0xaa]
    subeq r0, r0, #0x3c
    streqh r0, [r4, #0xaa]
.L_54c:
    ldrh r1, [r4]
    sub r0, r1, #0x1
    cmp sl, r0
    blt .L_5d0
    add r0, r1, #0x4
    cmp sl, r0
    bge .L_5d0
    mov r0, r5
    bl func_0201d428
    mov r0, r7, lsl #0x1
    ldrh r0, [r6, r0]
    bl func_0202bdf8
    ldrh r3, [sp, #0x14]
    mov r1, r9, lsl #0x3
    ldr r2, [sp, #0x18]
    bic r3, r3, #0xf
    orr r3, r3, #0x9
    strh r3, [sp, #0x14]
    ldrh r3, [sp, #0x14]
    add r1, r1, #0xf3
    add r1, r1, #0x200
    mov r1, r1, lsl #0x7
    str r1, [sp, #0xc]
    bic r1, r2, #0x1c000
    str r0, [sp]
    orr r2, r3, #0x10
    orr r1, r1, #0x1c000
    mov r0, r5
    strh r2, [sp, #0x14]
    str r1, [sp, #0x18]
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
.L_5d0:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x20
    add r9, r9, #0x1
    blt .L_508
    ldr r0, _LIT0
    ldrh r1, [r0, #0xc4]
    add r1, r1, #0x1
    strh r1, [r0, #0xc4]
    ldrh r2, [r0, #0xc4]
    ldrh r1, [r0, #0xa8]
    cmp r2, r1
    moveq r1, #0x1
    streq r1, [r0, #0xb4]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2cc4
_LIT1: .word 0x66666667
_LIT2: .word data_ov008_021b2ccc
_LIT3: .word 0x000001db
_LIT4: .word data_ov008_021b25bc
