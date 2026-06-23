; func_02079d64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02079d64
        .arm
func_02079d64:
    mov r1, r0
    mov r0, #0x0
    mov r3, #0x1
.L_f6c:
    clz r2, r1
    rsbs r2, r2, #0x1f
    bxcc lr
    bic r1, r1, r3, lsl r2
    add r0, r0, #0x1
    b .L_f6c
