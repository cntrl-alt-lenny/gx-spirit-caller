; func_02094398 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02094398
        .arm
func_02094398:
    mov r3, #0x0
.L_658:
    cmp r3, r2
    strlth r0, [r1, r3]
    addlt r3, r3, #0x2
    blt .L_658
    bx lr
