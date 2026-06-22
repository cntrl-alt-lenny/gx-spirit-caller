; func_0209b440 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8358
        .global func_0209b440
        .arm
func_0209b440:
    ldr ip, _LIT0
.L_4:
    ldr r0, [ip]
    cmp r0, #0x1
    beq .L_4
    bx lr
_LIT0: .word data_021a8358
