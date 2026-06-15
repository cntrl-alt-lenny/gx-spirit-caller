; func_0200c6ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200c6ac
        .arm
func_0200c6ac:
    cmp r1, #0x0
    bge .L_134
    cmp r2, #0x0
    mvnne r1, #0x0
    moveq r1, #0x0
    str r1, [r0, #0x70]
    b .L_160
.L_134:
    cmp r2, #0x0
    mov r2, #0x1
    beq .L_150
    ldr r3, [r0, #0x70]
    orr r1, r3, r2, lsl r1
    str r1, [r0, #0x70]
    b .L_160
.L_150:
    mvn r1, r2, lsl r1
    ldr r2, [r0, #0x70]
    and r1, r2, r1
    str r1, [r0, #0x70]
.L_160:
    mov r0, #0x1
    bx lr
