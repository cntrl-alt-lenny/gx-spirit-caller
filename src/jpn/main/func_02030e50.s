; func_02030e50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02030e50
        .arm
func_02030e50:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_cc
    bge .L_204
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_78
    bge .L_1f4
    sub r1, r3, #0x520
    cmp r0, r1
    bgt .L_54
    bge .L_1cc
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_44
    beq .L_204
    b .L_20c
.L_44:
    add r1, r1, #0xb
    cmp r0, r1
    beq .L_1cc
    b .L_20c
.L_54:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_68
    beq .L_1d4
    b .L_20c
.L_68:
    sub r1, r2, #0x8d
    cmp r0, r1
    beq .L_1f4
    b .L_20c
.L_78:
    cmp r0, #0x1400
    bgt .L_a8
    bge .L_1dc
    add r1, r2, #0x45
    cmp r0, r1
    bgt .L_98
    beq .L_204
    b .L_20c
.L_98:
    add r1, r2, #0x52
    cmp r0, r1
    beq .L_204
    b .L_20c
.L_a8:
    sub r1, r3, #0x8c
    cmp r0, r1
    bgt .L_bc
    beq .L_1ec
    b .L_20c
.L_bc:
    add r1, r2, #0x1e4
    cmp r0, r1
    beq .L_1e4
    b .L_20c
.L_cc:
    add r1, r3, #0x2e8
    cmp r0, r1
    bgt .L_168
    ldr r2, _LIT4
    cmp r0, r2
    blt .L_f8
    beq .L_1cc
    add r1, r2, #0x1
    cmp r0, r1
    beq .L_1fc
    b .L_20c
.L_f8:
    sub r1, r2, #0x174
    cmp r0, r1
    bgt .L_144
    bge .L_1f4
    sub r1, r2, #0x270
    cmp r0, r1
    bgt .L_134
    sub r1, r2, #0x274
    cmp r0, r1
    blt .L_20c
    beq .L_1ec
    sub r1, r2, #0x270
    cmp r0, r1
    beq .L_204
    b .L_20c
.L_134:
    add r1, r3, #0xc5
    cmp r0, r1
    beq .L_204
    b .L_20c
.L_144:
    sub r1, r2, #0x6f
    cmp r0, r1
    bgt .L_158
    beq .L_1ec
    b .L_20c
.L_158:
    sub r1, r2, #0x1
    cmp r0, r1
    beq .L_204
    b .L_20c
.L_168:
    add r1, r3, #0x3e0
    cmp r0, r1
    bgt .L_19c
    bge .L_204
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_18c
    beq .L_1ec
    b .L_20c
.L_18c:
    add r1, r1, #0x10
    cmp r0, r1
    beq .L_1f4
    b .L_20c
.L_19c:
    ldr r1, _LIT6
    cmp r0, r1
    bgt .L_1bc
    bge .L_1d4
    sub r1, r1, #0x25
    cmp r0, r1
    beq .L_1ec
    b .L_20c
.L_1bc:
    add r1, r1, #0x6
    cmp r0, r1
    beq .L_1e4
    b .L_20c
.L_1cc:
    ldr r0, _LIT7
    bx lr
.L_1d4:
    mov r0, #0x3
    bx lr
.L_1dc:
    mov r0, #0x2
    bx lr
.L_1e4:
    mov r0, #0x3
    bx lr
.L_1ec:
    mov r0, #0x2
    bx lr
.L_1f4:
    mov r0, #0x0
    bx lr
.L_1fc:
    mov r0, #0x0
    bx lr
.L_204:
    ldr r0, _LIT7
    bx lr
.L_20c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001529
_LIT1: .word 0x000012c8
_LIT2: .word 0x00000fee
_LIT3: .word 0x00001102
_LIT4: .word 0x00001810
_LIT5: .word 0x0000187c
_LIT6: .word 0x00001aa3
_LIT7: .word 0x0000ffff
