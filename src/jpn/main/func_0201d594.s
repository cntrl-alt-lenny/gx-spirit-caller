; func_0201d594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191d50
        .global func_0201d594
        .arm
func_0201d594:
    cmp r0, #0x4
    beq .L_14
    cmp r0, #0x9
    beq .L_20
    b .L_2c
.L_14:
    ldr r0, _LIT0
    ldr r0, [r0]
    bx lr
.L_20:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bx lr
.L_2c:
    mov r0, #0x0
    bx lr
_LIT0: .word data_02191d50
