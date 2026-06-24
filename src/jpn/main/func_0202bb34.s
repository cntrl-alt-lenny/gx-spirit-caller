; func_0202bb34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4674
        .extern data_02104e6c
        .global func_0202bb34
        .arm
func_0202bb34:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r2, [r0]
    cmp r2, #0x0
    bxle lr
    ldr r3, _LIT1
.L_18:
    ldrb r0, [r3, #0xf6c]
    add r1, r1, #0x1
    cmp r1, r2
    bic r0, r0, #0x8
    strb r0, [r3, #0xf6c]
    add r3, r3, #0x1
    blt .L_18
    bx lr
_LIT0: .word data_020b4674
_LIT1: .word data_02104e6c
