; func_020a7320 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a7320
        .arm
func_020a7320:
    cmp r2, #0x0
    and r3, r1, #0xff
    add r0, r0, r2
    beq .L_50
.L_3c:
    ldrb r1, [r0, #-1]!
    cmp r1, r3
    bxeq lr
    subs r2, r2, #0x1
    bne .L_3c
.L_50:
    mov r0, #0x0
    bx lr
