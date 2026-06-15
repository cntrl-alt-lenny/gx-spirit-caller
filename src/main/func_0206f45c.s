; func_0206f45c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206f45c
        .arm
func_0206f45c:
    ldrb r2, [r0], #0x1
    cmp r2, #0x0
    bxeq lr
.L_3a8:
    and r1, r2, #0xc0
    cmp r1, #0xc0
    addeq r0, r0, #0x1
    bxeq lr
    add r0, r0, r2
    ldrb r2, [r0], #0x1
    cmp r2, #0x0
    bne .L_3a8
    bx lr
