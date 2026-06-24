; func_020943b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020943b0
        .arm
func_020943b0:
    mov ip, #0x0
.L_4:
    cmp ip, r2
    ldrlth r3, [r0, ip]
    strlth r3, [r1, ip]
    addlt ip, ip, #0x2
    blt .L_4
    bx lr
