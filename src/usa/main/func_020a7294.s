; func_020a7294 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a7294
        .arm
func_020a7294:
    cmp r1, r0
    bcc .L_28
    mov ip, r0
    cmp r2, #0x0
    bxeq lr
.L_14:
    ldrsb r3, [r1], #0x1
    subs r2, r2, #0x1
    strb r3, [ip], #0x1
    bne .L_14
    bx lr
.L_28:
    cmp r2, #0x0
    add r3, r1, r2
    add ip, r0, r2
    bxeq lr
.L_38:
    ldrsb r1, [r3, #-1]!
    subs r2, r2, #0x1
    strb r1, [ip, #-1]!
    bne .L_38
    bx lr
