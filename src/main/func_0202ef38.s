; func_0202ef38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202ef38
        .arm
func_0202ef38:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_88
    bge .L_a8
    ldr r1, _LIT1
    cmp r0, r1
    bgt .L_78
    sub r1, r1, #0x12
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_b0
    b .L_a8
    b .L_b0
    b .L_b0
    b .L_b0
    b .L_a8
    b .L_a8
    b .L_a8
    b .L_a8
    b .L_a8
    b .L_a8
    b .L_b0
    b .L_b0
    b .L_b0
    b .L_b0
    b .L_b0
    b .L_a8
    b .L_b0
    b .L_b0
    b .L_a8
.L_78:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_a8
    b .L_b0
.L_88:
    add r1, r2, #0x1
    cmp r0, r1
    bgt .L_9c
    beq .L_a8
    b .L_b0
.L_9c:
    add r1, r2, #0x1c
    cmp r0, r1
    bne .L_b0
.L_a8:
    mov r0, #0x1
    bx lr
.L_b0:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001b3e
_LIT1: .word 0x00001973
_LIT2: .word 0x00001b3d
