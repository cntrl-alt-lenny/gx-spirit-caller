; func_02038dac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d00c
        .global func_02038dac
        .arm
func_02038dac:
    ldr r3, _LIT0
    mov r2, #0x1f
.L_11c:
    ldr r1, [r3, #0x4]
    cmp r1, r0
    moveq r0, r3
    bxeq lr
    sub r3, r3, #0x5c
    subs r2, r2, #0x1
    bpl .L_11c
    mov r0, #0x0
    bx lr
_LIT0: .word data_0219d00c
