; func_ov002_021f4004 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021f4004
        .arm
func_ov002_021f4004:
    ldrh r2, [r0]
    ldr r1, _LIT0
    cmp r2, r1
    bgt .L_ce8
    sub r0, r1, #0x2
    cmp r2, r0
    blt .L_cc4
    cmpne r2, r1
    beq .L_d18
    b .L_d28
.L_cc4:
    ldr r0, _LIT1
    cmp r2, r0
    bgt .L_cd8
    beq .L_d20
    b .L_d28
.L_cd8:
    sub r0, r1, #0x70
    cmp r2, r0
    beq .L_d18
    b .L_d28
.L_ce8:
    ldr r0, _LIT2
    cmp r2, r0
    bgt .L_d08
    bge .L_d18
    sub r0, r0, #0x85
    cmp r2, r0
    beq .L_d20
    b .L_d28
.L_d08:
    add r0, r0, #0x23
    cmp r2, r0
    beq .L_d20
    b .L_d28
.L_d18:
    mov r0, #0x1
    bx lr
.L_d20:
    mov r0, #0x2
    bx lr
.L_d28:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001661
_LIT1: .word 0x000014ea
_LIT2: .word 0x0000198c
