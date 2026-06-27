; func_02031710 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031710
        .arm
func_02031710:
    ldr r2, _LIT0
    cmp r0, r2
    addne r1, r2, #0xb8
    cmpne r0, r1
    addne r1, r2, #0x180
    cmpne r0, r1
    bne .L_1180
    mov r0, #0x1
    bx lr
.L_1180:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001652
