; func_020a72f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a72f4
        .arm
func_020a72f4:
    cmp r2, #0x0
    and r3, r1, #0xff
    beq .L_24
.L_c:
    ldrb r1, [r0], #0x1
    cmp r1, r3
    subeq r0, r0, #0x1
    bxeq lr
    subs r2, r2, #0x1
    bne .L_c
.L_24:
    mov r0, #0x0
    bx lr
