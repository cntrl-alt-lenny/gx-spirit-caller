; func_02060fdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02060fdc
        .arm
func_02060fdc:
    mov ip, #0x0
.L_90:
    cmp ip, #0x0
    beq .L_b4
    cmp ip, #0xd
    beq .L_b4
    ldrb r3, [r0, ip]
    ldrb r2, [r1, ip]
    cmp r3, r2
    movne r0, #0x0
    bxne lr
.L_b4:
    add ip, ip, #0x1
    cmp ip, #0x20
    blt .L_90
    mov r0, #0x1
    bx lr
