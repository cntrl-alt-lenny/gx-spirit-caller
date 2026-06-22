; func_0206f3e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206f3e8
        .arm
func_0206f3e8:
    ldrb r2, [r0], #0x1
    cmp r2, #0x0
    bxeq lr
.L_59c:
    and r1, r2, #0xc0
    cmp r1, #0xc0
    addeq r0, r0, #0x1
    bxeq lr
    add r0, r0, r2
    ldrb r2, [r0], #0x1
    cmp r2, #0x0
    bne .L_59c
    bx lr
