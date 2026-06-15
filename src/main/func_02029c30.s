; func_02029c30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02029c30
        .arm
func_02029c30:
    cmp r1, #0x0
    bge .L_580
    cmp r2, #0x0
    mvnne r1, #0x0
    moveq r1, #0x0
    str r1, [r0, #0x168]
    b .L_5ac
.L_580:
    cmp r2, #0x0
    mov r2, #0x1
    beq .L_59c
    ldr r3, [r0, #0x168]
    orr r1, r3, r2, lsl r1
    str r1, [r0, #0x168]
    b .L_5ac
.L_59c:
    mvn r1, r2, lsl r1
    ldr r2, [r0, #0x168]
    and r1, r2, r1
    str r1, [r0, #0x168]
.L_5ac:
    mov r0, #0x1
    bx lr
