; func_ov009_021acd80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020060f4
        .global func_ov009_021acd80
        .arm
func_ov009_021acd80:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    ldr r0, [sp, #0x4]
    cmp r0, #0x21
    blt .L_1590
    cmp r0, #0xdf
    bge .L_1590
    ldr r0, [sp]
    cmp r0, #0x15
    blt .L_1590
    cmp r0, #0x9d
    blt .L_15a8
.L_1590:
    mov r0, #0x1
    str r0, [r4, #0x3c]
    mov r0, #0x0
    add sp, sp, #0x8
    str r0, [r4, #0x30]
    ldmia sp!, {r4, pc}
.L_15a8:
    mov lr, #0x0
    str lr, [r4, #0x3c]
    ldr r0, [sp]
    ldr r1, _LIT0
    sub r2, r0, #0x15
    smull r0, r3, r1, r2
    mov r0, r2, lsr #0x1f
    ldr r2, [sp, #0x4]
    add r3, r0, r3, asr #0x4
    cmp r2, #0xa8
    rsb ip, r3, #0x3
    bge .L_15f4
    ldr r1, _LIT1
    sub r2, r2, #0x21
    smull r0, r3, r1, r2
    add r3, r2, r3
    mov r0, r2, lsr #0x1f
    add r3, r0, r3, asr #0x5
    add lr, r3, #0x1
.L_15f4:
    str lr, [r4, #0x34]
    str ip, [r4, #0x38]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x78787879
_LIT1: .word 0xb60b60b7
