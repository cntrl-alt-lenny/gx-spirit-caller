; func_020614d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101448
        .extern data_021014c0
        .extern func_020a6d54
        .global func_020614d8
        .arm
func_020614d8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r2, [r5, #0x8]
    ldr r0, [r5, #0x4]
    mov r4, r1
    cmp r2, r0
    blt .L_5bc
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x23
    bl func_020a6d54
.L_5bc:
    ldr r1, [r5, #0x8]
    add r0, r1, #0x1
    str r0, [r5, #0x8]
    ldr r0, [r5]
    strb r4, [r0, r1]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021014c0
_LIT1: .word data_02101448
