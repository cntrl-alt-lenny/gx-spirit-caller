; func_02031358 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031358
        .arm
func_02031358:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_dec
    bge .L_e4c
    sub r1, r2, #0x22
    cmp r0, r1
    bgt .L_dbc
    bge .L_e4c
    cmp r0, #0x1100
    bgt .L_dac
    sub r1, r2, #0x1f8
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_e54
    b .L_e4c
    b .L_e4c
    b .L_e4c
    b .L_e4c
    b .L_e4c
    b .L_e4c
    b .L_e4c
    b .L_e4c
    b .L_e4c
.L_dac:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_e4c
    b .L_e54
.L_dbc:
    sub r1, r2, #0x7
    cmp r0, r1
    bgt .L_ddc
    bge .L_e4c
    sub r1, r2, #0x8
    cmp r0, r1
    beq .L_e4c
    b .L_e54
.L_ddc:
    sub r1, r2, #0x4
    cmp r0, r1
    beq .L_e4c
    b .L_e54
.L_dec:
    add r1, r2, #0x34
    cmp r0, r1
    bgt .L_e20
    bge .L_e4c
    add r1, r2, #0xa
    cmp r0, r1
    bgt .L_e10
    beq .L_e4c
    b .L_e54
.L_e10:
    add r1, r2, #0x17
    cmp r0, r1
    beq .L_e4c
    b .L_e54
.L_e20:
    add r1, r2, #0x3b
    cmp r0, r1
    bgt .L_e40
    bge .L_e4c
    add r1, r2, #0x35
    cmp r0, r1
    beq .L_e4c
    b .L_e54
.L_e40:
    ldr r1, _LIT2
    cmp r0, r1
    bne .L_e54
.L_e4c:
    mov r0, #0x1
    bx lr
.L_e54:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000012f0
_LIT1: .word 0x000012cc
_LIT2: .word 0x00001804
