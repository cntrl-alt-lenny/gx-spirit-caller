; func_020aaf60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aaf60
        .arm
func_020aaf60:
    cmp r2, #0x0
    beq .L_140
.L_11c:
    ldrb ip, [r1], #0x1
    ldrb r3, [r0], #0x1
    cmp r3, ip
    subne r0, r3, ip
    bxne lr
    cmp r3, #0x0
    beq .L_140
    subs r2, r2, #0x1
    bne .L_11c
.L_140:
    mov r0, #0x0
    bx lr
