; func_0202f394 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f394
        .arm
func_0202f394:
    ldr r1, _LIT0
    cmp r0, r1
    addne r1, r1, #0x9
    cmpne r0, r1
    bne .L_93c
    mov r0, #0x1
    bx lr
.L_93c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001a53
