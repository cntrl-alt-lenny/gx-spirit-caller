; func_0202f59c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f59c
        .arm
func_0202f59c:
    ldr r2, _LIT0
    cmp r0, r2
    addne r1, r2, #0x1
    cmpne r0, r1
    addne r1, r2, #0x2
    cmpne r0, r1
    bne .L_24
    mov r0, #0x1
    bx lr
.L_24:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001ad6
