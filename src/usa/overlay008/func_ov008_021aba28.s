; func_ov008_021aba28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005d90
        .extern func_020943b0
        .global func_ov008_021aba28
        .arm
func_ov008_021aba28:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r1
    sub r1, r5, #0x1
    sub r3, r0, #0x1
    and r0, r1, #0xff
    ldr r2, _LIT0
    mov r4, r3, lsl #0x17
    orr r0, r0, #-2147483648
    orr r3, r0, r4, lsr #0x7
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x8
    bl func_020943b0
    add r0, r5, #0x1f
    and r0, r0, #0xff
    orr r0, r0, #0x4000
    orr r0, r0, #-2147483648
    orr r3, r0, r4, lsr #0x7
    ldr r2, _LIT1
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x8
    bl func_020943b0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000027e
_LIT1: .word 0x00000282
