; func_02034090 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02034090
        .arm
func_02034090:
    ldr r0, _LIT0
    cmp r1, r0
    blt .L_1c
    ldr r0, _LIT1
    cmp r1, r0
    movle r0, #0x1
    bxle lr
.L_1c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00007918
_LIT1: .word 0x00007cff
