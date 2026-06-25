; func_ov002_022a1760 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022a1760
        .arm
func_ov002_022a1760:
    ldr r1, [r0, #0x4]
    cmp r1, #0xc
    cmpne r1, #0x20
    bne .L_302c
    mov r0, #0x0
    bx lr
.L_302c:
    ldr r0, [r0]
    bx lr
