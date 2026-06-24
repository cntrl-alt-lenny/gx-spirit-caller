; func_ov002_021b6418 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b6418
        .arm
func_ov002_021b6418:
    ldrh r1, [r0]
    ldr ip, _LIT0
    cmp r1, ip
    bgt .L_d4
    bge .L_19c
    ldr r2, _LIT1
    cmp r1, r2
    bgt .L_68
    bge .L_194
    sub r0, r2, #0xf1
    cmp r1, r0
    bgt .L_44
    bge .L_19c
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_1c0
    b .L_1c8
.L_44:
    sub r0, r2, #0x2e
    cmp r1, r0
    bgt .L_58
    beq .L_194
    b .L_1c8
.L_58:
    sub r0, r2, #0x25
    cmp r1, r0
    beq .L_1c0
    b .L_1c8
.L_68:
    sub r0, ip, #0x34
    cmp r1, r0
    bgt .L_b0
    bge .L_1c0
    add r0, r2, #0x2b
    cmp r1, r0
    bgt .L_a0
    add r0, r2, #0x2a
    cmp r1, r0
    blt .L_1c8
    addne r0, r2, #0x2b
    cmpne r1, r0
    beq .L_19c
    b .L_1c8
.L_a0:
    add r0, r2, #0xba
    cmp r1, r0
    beq .L_1c0
    b .L_1c8
.L_b0:
    sub r0, ip, #0x13
    cmp r1, r0
    bgt .L_c4
    beq .L_19c
    b .L_1c8
.L_c4:
    sub r0, ip, #0xf
    cmp r1, r0
    beq .L_19c
    b .L_1c8
.L_d4:
    ldr r3, _LIT3
    cmp r1, r3
    bgt .L_13c
    bge .L_1c0
    sub r0, r3, #0x9a
    cmp r1, r0
    bgt .L_118
    bge .L_194
    add r0, ip, #0x55
    cmp r1, r0
    bgt .L_108
    beq .L_19c
    b .L_1c8
.L_108:
    add r0, ip, #0x88
    cmp r1, r0
    beq .L_1c0
    b .L_1c8
.L_118:
    sub r0, r3, #0x97
    cmp r1, r0
    bgt .L_12c
    beq .L_19c
    b .L_1c8
.L_12c:
    sub r0, r3, #0x5b
    cmp r1, r0
    beq .L_1c0
    b .L_1c8
.L_13c:
    add r2, r3, #0x198
    cmp r1, r2
    bgt .L_170
    bge .L_1a4
    add r0, r3, #0x2b
    cmp r1, r0
    bgt .L_160
    beq .L_19c
    b .L_1c8
.L_160:
    ldr r0, _LIT4
    cmp r1, r0
    beq .L_194
    b .L_1c8
.L_170:
    add r0, r3, #0x1b4
    cmp r1, r0
    bgt .L_184
    beq .L_194
    b .L_1c8
.L_184:
    ldr r0, _LIT5
    cmp r1, r0
    beq .L_1c0
    b .L_1c8
.L_194:
    mov r0, #0x1
    bx lr
.L_19c:
    mov r0, #0x2
    bx lr
.L_1a4:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    bne .L_1c8
    mov r0, #0x2
    bx lr
.L_1c0:
    mov r0, #0x3
    bx lr
.L_1c8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000151c
_LIT1: .word 0x000012fa
_LIT2: .word 0x000011f5
_LIT3: .word 0x00001803
_LIT4: .word 0x00001970
_LIT5: .word 0x00001b5a
