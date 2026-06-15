; func_02076260 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02076260
        .arm
func_02076260:
    mov r2, #0x8
.L_4:
    ldrb r1, [r0, #-1]!
    add r1, r1, #0x1
    ands r1, r1, #0xff
    strb r1, [r0]
    bxne lr
    subs r2, r2, #0x1
    bne .L_4
    bx lr
