; func_ov008_021aba3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005dac
        .extern func_020944a4
        .global func_ov008_021aba3c
        .arm
func_ov008_021aba3c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r4, r1
    mov r5, r0
    sub r0, r4, #0x1
    sub r1, r5, #0x1
    and r0, r0, #0xff
    ldr r2, _LIT0
    mov r1, r1, lsl #0x17
    orr r0, r0, #-1073741824
    orr r3, r0, r1, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x8
    bl func_020944a4
    add r0, r4, #0x3f
    and r0, r0, #0xff
    orr sl, r0, #0x4000
    ldr r9, _LIT1
    mov r7, #0x0
    sub r8, r5, #0x1
    orr sl, sl, #-2147483648
    mov r6, #0x2
    mov r5, r7
    add r4, sp, #0x0
    mov fp, #0x8
.L_14c8:
    mov r0, r8, lsl #0x17
    orr r2, sl, r0, lsr #0x7
    mov r0, r6
    mov r1, r5
    str r2, [sp]
    strh r9, [sp, #0x4]
    bl func_02005dac
    mov r1, r0
    mov r0, r4
    mov r2, fp
    bl func_020944a4
    add r7, r7, #0x1
    cmp r7, #0x2
    add r8, r8, #0x20
    add r9, r9, #0x2
    blt .L_14c8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000026a
_LIT1: .word 0x0000027a
