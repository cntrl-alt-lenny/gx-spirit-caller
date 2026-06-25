; func_0202e898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e898
        .arm
func_0202e898:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_c4
    bge .L_15c
    sub r1, r3, #0x48
    cmp r0, r1
    bgt .L_80
    bge .L_184
    sub r1, r3, #0x4c
    cmp r0, r1
    bgt .L_70
    bge .L_184
    sub r1, r3, #0x8d
    sub r1, r0, r1
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_1ac
    b .L_15c
    b .L_164
    b .L_164
    b .L_164
    b .L_16c
    b .L_16c
    b .L_174
    b .L_174
    b .L_17c
    b .L_17c
    b .L_17c
.L_70:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_184
    b .L_1ac
.L_80:
    sub r1, r3, #0x44
    cmp r0, r1
    bgt .L_a0
    bge .L_18c
    sub r1, r3, #0x47
    cmp r0, r1
    beq .L_18c
    b .L_1ac
.L_a0:
    sub r1, r3, #0x3c
    cmp r0, r1
    bgt .L_b4
    beq .L_15c
    b .L_1ac
.L_b4:
    sub r1, r3, #0x3b
    cmp r0, r1
    beq .L_174
    b .L_1ac
.L_c4:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_118
    bge .L_19c
    add r1, r3, #0xa8
    cmp r0, r1
    bgt .L_f4
    bge .L_194
    sub r1, r2, #0x228
    cmp r0, r1
    beq .L_15c
    b .L_1ac
.L_f4:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_108
    beq .L_17c
    b .L_1ac
.L_108:
    sub r1, r2, #0x1
    cmp r0, r1
    beq .L_19c
    b .L_1ac
.L_118:
    add r1, r2, #0x5
    cmp r0, r1
    bgt .L_138
    bge .L_1a4
    add r1, r2, #0x1
    cmp r0, r1
    beq .L_19c
    b .L_1ac
.L_138:
    add r1, r2, #0x6
    cmp r0, r1
    bgt .L_14c
    beq .L_1a4
    b .L_1ac
.L_14c:
    add r1, r2, #0x7
    cmp r0, r1
    beq .L_1a4
    b .L_1ac
.L_15c:
    mov r0, #0x1
    bx lr
.L_164:
    mov r0, #0x2
    bx lr
.L_16c:
    mov r0, #0x3
    bx lr
.L_174:
    mov r0, #0x4
    bx lr
.L_17c:
    mov r0, #0x5
    bx lr
.L_184:
    mov r0, #0x6
    bx lr
.L_18c:
    mov r0, #0x7
    bx lr
.L_194:
    mov r0, #0x8
    bx lr
.L_19c:
    mov r0, #0x9
    bx lr
.L_1a4:
    mov r0, #0xa
    bx lr
.L_1ac:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000185e
_LIT1: .word 0x00001814
_LIT2: .word 0x00001ad7
_LIT3: .word 0x0000198c
