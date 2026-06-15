; func_0200c65c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200c65c
        .arm
func_0200c65c:
    cmp r1, #0x0
    bge .L_e4
    cmp r2, #0x0
    mvnne r1, #0x0
    moveq r1, #0x0
    str r1, [r0, #0x6c]
    b .L_110
.L_e4:
    cmp r2, #0x0
    mov r2, #0x1
    beq .L_100
    ldr r3, [r0, #0x6c]
    orr r1, r3, r2, lsl r1
    str r1, [r0, #0x6c]
    b .L_110
.L_100:
    mvn r1, r2, lsl r1
    ldr r2, [r0, #0x6c]
    and r1, r2, r1
    str r1, [r0, #0x6c]
.L_110:
    mov r0, #0x1
    bx lr
