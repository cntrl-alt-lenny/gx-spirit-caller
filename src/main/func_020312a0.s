; func_020312a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020312a0
        .arm
func_020312a0:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_cec
    bge .L_d2c
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_cc8
    bge .L_d2c
    sub r1, r3, #0x264
    cmp r0, r1
    beq .L_d2c
    b .L_d3c
.L_cc8:
    add r1, r2, #0xc1
    cmp r0, r1
    bgt .L_cdc
    beq .L_d2c
    b .L_d3c
.L_cdc:
    add r1, r2, #0xdc
    cmp r0, r1
    beq .L_d2c
    b .L_d3c
.L_cec:
    add r1, r3, #0x5d
    cmp r0, r1
    bgt .L_d0c
    bge .L_d2c
    add r1, r3, #0x50
    cmp r0, r1
    beq .L_d2c
    b .L_d3c
.L_d0c:
    add r1, r3, #0xaa
    cmp r0, r1
    bgt .L_d20
    beq .L_d34
    b .L_d3c
.L_d20:
    ldr r1, _LIT2
    cmp r0, r1
    bne .L_d3c
.L_d2c:
    mov r0, #0x1
    bx lr
.L_d34:
    mov r0, #0x1
    bx lr
.L_d3c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001962
_LIT1: .word 0x00001837
_LIT2: .word 0x00001a8d
