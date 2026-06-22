; func_020536d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020536d4
        .arm
func_020536d4:
    mvn ip, r3
    ands ip, r1, ip
    movne r0, #0x0
    bxne lr
    mvn r3, r3, lsl r2
    ldr ip, [r0]
    and r3, ip, r3
    orr r1, r3, r1, lsl r2
    str r1, [r0]
    mov r0, #0x1
    bx lr
