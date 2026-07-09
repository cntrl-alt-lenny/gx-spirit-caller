; func_ov002_0227d310 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0227d310
        .arm
func_ov002_0227d310:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_100
    bge .L_1bc
    sub r1, r3, #0xc2
    cmp r0, r1
    bgt .L_a8
    bge .L_1bc
    sub r1, r3, #0x1d0
    cmp r0, r1
    bgt .L_84
    bge .L_1bc
    sub r1, r0, #0x33
    sub r1, r1, #0x1300
    cmp r1, #0xf
    addls pc, pc, r1, lsl #0x2
    b .L_1c4
    b .L_1bc
    b .L_1c4
    b .L_1bc
    b .L_1c4
    b .L_1c4
    b .L_1c4
    b .L_1bc
    b .L_1bc
    b .L_1c4
    b .L_1bc
    b .L_1c4
    b .L_1bc
    b .L_1bc
    b .L_1c4
    b .L_1c4
    b .L_1bc
.L_84:
    ldr r1, _LIT1
    cmp r0, r1
    bgt .L_98
    beq .L_1bc
    b .L_1c4
.L_98:
    add r1, r1, #0x29
    cmp r0, r1
    beq .L_1bc
    b .L_1c4
.L_a8:
    sub r1, r3, #0x77
    cmp r0, r1
    bgt .L_dc
    bge .L_1bc
    sub r1, r3, #0x90
    cmp r0, r1
    bgt .L_cc
    beq .L_1bc
    b .L_1c4
.L_cc:
    sub r1, r3, #0x86
    cmp r0, r1
    beq .L_1bc
    b .L_1c4
.L_dc:
    sub r1, r3, #0x3e
    cmp r0, r1
    bgt .L_f0
    beq .L_1bc
    b .L_1c4
.L_f0:
    sub r1, r3, #0x1
    cmp r0, r1
    beq .L_1bc
    b .L_1c4
.L_100:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_168
    bge .L_1bc
    sub r1, r2, #0x91
    cmp r0, r1
    bgt .L_144
    bge .L_1bc
    add r1, r3, #0x24
    cmp r0, r1
    bgt .L_134
    beq .L_1bc
    b .L_1c4
.L_134:
    sub r1, r2, #0xa4
    cmp r0, r1
    beq .L_1bc
    b .L_1c4
.L_144:
    sub r1, r2, #0x82
    cmp r0, r1
    bgt .L_158
    beq .L_1bc
    b .L_1c4
.L_158:
    sub r1, r2, #0x81
    cmp r0, r1
    beq .L_1bc
    b .L_1c4
.L_168:
    add r1, r2, #0xd2
    cmp r0, r1
    bgt .L_19c
    bge .L_1bc
    add r1, r2, #0x50
    cmp r0, r1
    bgt .L_18c
    beq .L_1bc
    b .L_1c4
.L_18c:
    add r1, r2, #0x90
    cmp r0, r1
    beq .L_1bc
    b .L_1c4
.L_19c:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_1b0
    beq .L_1bc
    b .L_1c4
.L_1b0:
    add r1, r1, #0x5b
    cmp r0, r1
    bne .L_1c4
.L_1bc:
    mov r0, #0x1
    bx lr
.L_1c4:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000156d
_LIT1: .word 0x0000139e
_LIT2: .word 0x00001867
_LIT3: .word 0x0000196a
