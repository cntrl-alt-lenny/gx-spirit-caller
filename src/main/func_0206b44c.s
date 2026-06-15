; func_0206b44c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206b44c
        .arm
func_0206b44c:
    cmp r1, #0x0
    mov r3, #0x0
    ble .L_408
.L_3ec:
    ldrsb r2, [r0, r3]
    cmp r2, #0x0
    addeq r0, r3, #0x1
    bxeq lr
    add r3, r3, #0x1
    cmp r3, r1
    blt .L_3ec
.L_408:
    mvn r0, #0x0
    bx lr
