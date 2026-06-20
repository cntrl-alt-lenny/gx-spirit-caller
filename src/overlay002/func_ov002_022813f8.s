; func_ov002_022813f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022813f8
        .arm
func_ov002_022813f8:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_168
    sub r1, r3, #0x2
    cmp r0, r1
    blt .L_110
    cmpne r0, r3
    beq .L_1c4
    b .L_1cc
.L_110:
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_144
    bge .L_1c4
    sub r1, r3, #0x2ec
    cmp r0, r1
    bgt .L_134
    beq .L_1c4
    b .L_1cc
.L_134:
    sub r1, r2, #0xa
    cmp r0, r1
    beq .L_1c4
    b .L_1cc
.L_144:
    add r1, r2, #0x3b
    cmp r0, r1
    bgt .L_158
    beq .L_1c4
    b .L_1cc
.L_158:
    add r1, r2, #0x6b
    cmp r0, r1
    beq .L_1c4
    b .L_1cc
.L_168:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_19c
    bge .L_1c4
    sub r1, r2, #0x210
    cmp r0, r1
    bgt .L_18c
    beq .L_1c4
    b .L_1cc
.L_18c:
    sub r1, r2, #0xe5
    cmp r0, r1
    beq .L_1c4
    b .L_1cc
.L_19c:
    cmp r0, #0x1a00
    bgt .L_1b8
    bge .L_1c4
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_1c4
    b .L_1cc
.L_1b8:
    add r1, r2, #0x258
    cmp r0, r1
    bne .L_1cc
.L_1c4:
    mov r0, #0x1
    bx lr
.L_1cc:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001598
_LIT1: .word 0x00001441
_LIT2: .word 0x00001855
_LIT3: .word 0x000019ff
