; func_020918c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .global func_020918c4
        .arm
func_020918c4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    b .L_10
.L_c:
    ldr r0, [r0, #0x68]
.L_10:
    cmp r0, #0x0
    bxeq lr
    ldr r1, [r0, #0x64]
    cmp r1, #0x1
    bne .L_c
    bx lr
_LIT0: .word data_021a62f0
