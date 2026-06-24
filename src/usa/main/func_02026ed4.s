; func_02026ed4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02026ed4
        .arm
func_02026ed4:
    cmp r1, #0x0
    bge .L_f60
    cmp r2, #0x0
    mvnne r1, #0x0
    moveq r1, #0x0
    str r1, [r0, #0x158]
    b .L_f8c
.L_f60:
    cmp r2, #0x0
    mov r2, #0x1
    beq .L_f7c
    ldr r3, [r0, #0x158]
    orr r1, r3, r2, lsl r1
    str r1, [r0, #0x158]
    b .L_f8c
.L_f7c:
    mvn r1, r2, lsl r1
    ldr r2, [r0, #0x158]
    and r1, r2, r1
    str r1, [r0, #0x158]
.L_f8c:
    mov r0, #0x1
    bx lr
