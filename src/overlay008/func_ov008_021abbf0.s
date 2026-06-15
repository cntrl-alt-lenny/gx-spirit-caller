; func_ov008_021abbf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005dac
        .extern func_020944a4
        .global func_ov008_021abbf0
        .arm
func_ov008_021abbf0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    and r1, r1, #0xff
    orr r7, r1, #0x40000000
    ldr r0, _LIT0
    ldr r4, _LIT1
    mov r9, r2
    mov r8, r3
    orr r2, r0, r8, lsl #0xc
    mov r1, sl, lsl #0x17
    orr r3, r7, r1, lsr #0x7
    cmp r9, r4
    mov r0, #0x2
    mov r1, #0x0
    movgt r9, r4
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x8
    bl func_020944a4
    ldr r5, _LIT2
    sub sl, sl, #0xe
    mov r6, #0x2
    mov fp, #0x0
    mov r4, #0xa
.L_70:
    smull r1, r2, r5, r9
    mov r0, r9, lsr #0x1f
    add r2, r0, r2, asr #0x2
    smull r0, r1, r4, r2
    sub r2, r9, r0
    add r0, r2, #0x288
    mov r1, sl, lsl #0x17
    orr r1, r7, r1, lsr #0x7
    orr r0, r0, #0x400
    str r1, [sp]
    orr r1, r0, r8, lsl #0xc
    strh r1, [sp, #0x4]
    mov r0, r6
    mov r1, fp
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x8
    bl func_020944a4
    mov r1, r9
    smull r0, r9, r5, r1
    mov r0, r1, lsr #0x1f
    add r9, r0, r9, asr #0x2
    cmp r9, #0x0
    sub sl, sl, #0xb
    bgt .L_70
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000692
_LIT1: .word 0x0098967f
_LIT2: .word 0x66666667
