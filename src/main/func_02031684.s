; func_02031684 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031684
        .arm
func_02031684:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_10ec
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_10a8
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    beq .L_1140
    b .L_1148
.L_10a8:
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_10c8
    bge .L_1140
    sub r1, r2, #0x11
    cmp r0, r1
    beq .L_1140
    b .L_1148
.L_10c8:
    add r1, r2, #0x13
    cmp r0, r1
    bgt .L_10dc
    beq .L_1140
    b .L_1148
.L_10dc:
    add r1, r2, #0xb7
    cmp r0, r1
    beq .L_1140
    b .L_1148
.L_10ec:
    add r1, r2, #0xd9
    cmp r0, r1
    bgt .L_1120
    bge .L_1140
    add r1, r2, #0x39
    cmp r0, r1
    bgt .L_1110
    beq .L_1140
    b .L_1148
.L_1110:
    add r1, r2, #0x58
    cmp r0, r1
    beq .L_1140
    b .L_1148
.L_1120:
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_1134
    beq .L_1140
    b .L_1148
.L_1134:
    add r1, r1, #0x75
    cmp r0, r1
    bne .L_1148
.L_1140:
    mov r0, #0x0
    bx lr
.L_1148:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x000018fd
_LIT1: .word 0x000014c7
_LIT2: .word 0x00001a53
