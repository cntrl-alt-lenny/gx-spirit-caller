; func_02033fdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02033fdc
        .arm
func_02033fdc:
    ldr r0, _LIT0
    cmp r1, r0
    blt .L_1c
    add r0, r0, #0x63
    cmp r1, r0
    movle r0, #0x1
    bxle lr
.L_1c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000c350
