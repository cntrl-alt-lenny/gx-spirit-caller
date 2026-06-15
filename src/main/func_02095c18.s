; func_02095c18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8220
        .global func_02095c18
        .arm
func_02095c18:
    ldr r1, _LIT0
    mov r2, #0x0
    mov r0, r2
.L_c:
    str r0, [r1]
    str r0, [r1, #0x4]
    add r2, r2, #0x1
    strb r0, [r1, #0x8]
    cmp r2, #0x8
    add r1, r1, #0xc
    blt .L_c
    bx lr
_LIT0: .word data_021a8220
