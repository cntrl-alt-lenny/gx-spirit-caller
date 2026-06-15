; func_0201d5e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191e30
        .global func_0201d5e8
        .arm
func_0201d5e8:
    cmp r0, #0x4
    beq .L_1d4
    cmp r0, #0x9
    beq .L_1e0
    b .L_1ec
.L_1d4:
    ldr r0, _LIT0
    ldr r0, [r0]
    bx lr
.L_1e0:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bx lr
.L_1ec:
    mov r0, #0x0
    bx lr
_LIT0: .word data_02191e30
