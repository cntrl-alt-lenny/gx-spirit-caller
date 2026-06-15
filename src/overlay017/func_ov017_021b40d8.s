; func_ov017_021b40d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005dac
        .extern func_020944a4
        .global func_ov017_021b40d8
        .arm
func_ov017_021b40d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r8, [sp, #0x30]
    mov sl, r1
    mov r9, r2
    cmp r8, #0x0
    and r0, r3, #0xff
    ldr r5, _LIT0
    mov r4, #0xa
    bne .L_a0
    orr r8, r0, #0x40000000
    mov r7, #0x2
    mov r6, #0x0
    add fp, sp, #0x0
.L_38:
    smull r1, r2, r5, sl
    mov r0, sl, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r4, r2
    sub r2, sl, r0
    add r0, r2, #0x27c
    orr r0, r0, #0x1400
    sub r9, r9, #0x8
    strh r0, [sp, #0x4]
    mov r0, r9, lsl #0x17
    orr r0, r8, r0, lsr #0x7
    mov r1, sl
    str r0, [sp]
    smull r0, sl, r5, r1
    mov r0, r1, lsr #0x1f
    add sl, r0, sl, asr #0x2
    mov r0, r7
    mov r1, r6
    bl func_02005dac
    mov r1, r0
    mov r0, fp
    mov r2, #0x6
    bl func_020944a4
    cmp sl, #0x0
    bgt .L_38
    b .L_114
.L_a0:
    orr r7, r0, #0x40000000
    mov r6, #0x2
    mov fp, #0x0
.L_ac:
    smull r1, r2, r5, sl
    mov r0, sl, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r4, r2
    sub r2, sl, r0
    add r0, r2, #0x27c
    orr r0, r0, #0x1400
    mov r1, sl
    strh r0, [sp, #0x4]
    smull r0, sl, r5, r1
    mov r0, r1, lsr #0x1f
    sub r9, r9, #0x8
    add sl, r0, sl, asr #0x2
    mov r0, r9, lsl #0x17
    orr r0, r7, r0, lsr #0x7
    str r0, [sp]
    mov r0, r6
    mov r1, fp
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020944a4
    sub r8, r8, #0x1
    cmp r8, #0x0
    bgt .L_ac
.L_114:
    mov r0, r9
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x66666667
