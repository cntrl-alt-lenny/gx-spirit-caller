; func_02052704 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02052704
        .arm
func_02052704:
    cmp r0, #0x2
    beq .L_384
    cmp r0, #0x3
    beq .L_384
    cmp r0, #0x4
    bne .L_38c
.L_384:
    mov r0, #0xc
    bx lr
.L_38c:
    mov r0, #0x8
    bx lr
