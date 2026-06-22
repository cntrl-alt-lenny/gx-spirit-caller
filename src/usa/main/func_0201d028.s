; func_0201d028 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218fddc
        .extern data_0218feac
        .global func_0201d028
        .arm
func_0201d028:
    ldr r0, _LIT0
    mov r1, #0x3
    str r1, [r0, #0x14]
    mov r2, #0x0
    ldr r0, _LIT1
    mov r1, r2
.L_18:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x20
    blt .L_18
    bx lr
_LIT0: .word data_0218fddc
_LIT1: .word data_0218feac
