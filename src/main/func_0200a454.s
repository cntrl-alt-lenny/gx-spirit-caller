; func_0200a454 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b476c
        .extern data_02104f4c
        .global func_0200a454
        .arm
func_0200a454:
    ldr r3, _LIT0
    ldr r2, _LIT1
    mov ip, #0x0
.L_c70:
    add r0, r3, ip, lsl #0x2
    ldr r1, [r2, ip, lsl #0x2]
    add r0, r0, #0x1000
    add ip, ip, #0x1
    str r1, [r0, #0xaa8]
    cmp ip, #0x4
    blt .L_c70
    bx lr
_LIT0: .word data_02104f4c
_LIT1: .word data_020b476c
