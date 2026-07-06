; func_ov002_0227e804 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0227e804
        .arm
func_ov002_0227e804:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_4c
    bge .L_98
    sub r1, r2, #0xa4
    cmp r0, r1
    bgt .L_3c
    sub r1, r2, #0xa7
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_b0
    b .L_70
    b .L_78
    b .L_80
    b .L_88
.L_3c:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_90
    b .L_b0
.L_4c:
    add r1, r2, #0x1
    cmp r0, r1
    bgt .L_60
    beq .L_a0
    b .L_b0
.L_60:
    add r1, r2, #0x32
    cmp r0, r1
    beq .L_a8
    b .L_b0
.L_70:
    mov r0, #0x1
    bx lr
.L_78:
    mov r0, #0x2
    bx lr
.L_80:
    mov r0, #0x3
    bx lr
.L_88:
    mov r0, #0x4
    bx lr
.L_90:
    mov r0, #0x5
    bx lr
.L_98:
    mov r0, #0x6
    bx lr
.L_a0:
    mov r0, #0x7
    bx lr
.L_a8:
    mov r0, #0x8
    bx lr
.L_b0:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000194d
_LIT1: .word 0x000018f9
