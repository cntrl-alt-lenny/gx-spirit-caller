; func_0202eeb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202eeb4
        .arm
func_0202eeb4:
    ldr r2, _LIT0
    cmp r0, r2
    addne r1, r2, #0x59
    cmpne r0, r1
    addne r1, r2, #0x16c
    cmpne r0, r1
    bne .L_464
    mov r0, #0x1
    bx lr
.L_464:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000018c3
