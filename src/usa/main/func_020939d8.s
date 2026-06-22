; func_020939d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6618
        .extern data_021a661c
        .global func_020939d8
        .arm
func_020939d8:
    ldr r0, _LIT0
    mov r3, #0x0
    str r3, [r0]
    ldr r0, _LIT1
    mov r2, r3
.L_9c:
    mov r1, r3, lsl #0x1
    add r3, r3, #0x1
    strh r2, [r0, r1]
    cmp r3, #0x9
    blt .L_9c
    bx lr
_LIT0: .word data_021a6618
_LIT1: .word data_021a661c
