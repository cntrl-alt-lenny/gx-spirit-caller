; func_020310d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020310d8
        .arm
func_020310d8:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_b48
    bge .L_bc4
    sub r1, r3, #0x7b
    cmp r0, r1
    bgt .L_b38
    sub r1, r3, #0x85
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_b28
    b .L_b94
    b .L_b9c
    b .L_bec
    b .L_bec
    b .L_bec
    b .L_ba4
    b .L_bec
    b .L_bac
    b .L_bec
    b .L_bec
    b .L_bb4
.L_b28:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_b8c
    b .L_bec
.L_b38:
    sub r1, r3, #0x71
    cmp r0, r1
    beq .L_bbc
    b .L_bec
.L_b48:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_b68
    bge .L_bdc
    add r1, r3, #0x49
    cmp r0, r1
    beq .L_bcc
    b .L_bec
.L_b68:
    add r1, r2, #0x53
    cmp r0, r1
    bgt .L_b7c
    beq .L_bd4
    b .L_bec
.L_b7c:
    add r1, r2, #0x16c
    cmp r0, r1
    beq .L_be4
    b .L_bec
.L_b8c:
    mov r0, #0x1
    bx lr
.L_b94:
    mov r0, #0x3
    bx lr
.L_b9c:
    mov r0, #0x3
    bx lr
.L_ba4:
    mov r0, #0xff
    bx lr
.L_bac:
    mov r0, #0x1
    bx lr
.L_bb4:
    mov r0, #0x3
    bx lr
.L_bbc:
    mov r0, #0xff
    bx lr
.L_bc4:
    mov r0, #0xff
    bx lr
.L_bcc:
    mov r0, #0xff
    bx lr
.L_bd4:
    mov r0, #0xff
    bx lr
.L_bdc:
    mov r0, #0x5
    bx lr
.L_be4:
    mov r0, #0xff
    bx lr
.L_bec:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001695
_LIT1: .word 0x0000128e
_LIT2: .word 0x00001817
