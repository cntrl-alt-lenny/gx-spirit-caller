; func_0205bc58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0205bc58
        .arm
func_0205bc58:
    ldr r0, [r0]
    ldr r1, [r0, #0x424]
    cmp r1, #0x0
    beq .L_e38
.L_e10:
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    beq .L_e2c
    ldr r0, [r1]
    cmp r0, #0x3
    movne r0, #0x1
    bxne lr
.L_e2c:
    ldr r1, [r1, #0x20]
    cmp r1, #0x0
    bne .L_e10
.L_e38:
    mov r0, #0x0
    bx lr
