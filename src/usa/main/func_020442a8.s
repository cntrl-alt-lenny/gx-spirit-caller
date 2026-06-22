; func_020442a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020442a8
        .arm
func_020442a8:
    mvn r2, #0x0
    mov ip, #0x0
    eor r3, r2, r2, lsr r0
    mov r2, ip
.L_10:
    rsb r0, r2, #0x18
    mov r0, r3, lsr r0
    strb r0, [r1, ip]
    add ip, ip, #0x1
    cmp ip, #0x4
    add r2, r2, #0x8
    blt .L_10
    bx lr
