; func_0203124c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203124c
        .arm
func_0203124c:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_54
    bge .L_94
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_30
    bge .L_94
    sub r1, r3, #0x264
    cmp r0, r1
    beq .L_94
    b .L_a4
.L_30:
    add r1, r2, #0xc1
    cmp r0, r1
    bgt .L_44
    beq .L_94
    b .L_a4
.L_44:
    add r1, r2, #0xdc
    cmp r0, r1
    beq .L_94
    b .L_a4
.L_54:
    add r1, r3, #0x5d
    cmp r0, r1
    bgt .L_74
    bge .L_94
    add r1, r3, #0x50
    cmp r0, r1
    beq .L_94
    b .L_a4
.L_74:
    add r1, r3, #0xaa
    cmp r0, r1
    bgt .L_88
    beq .L_9c
    b .L_a4
.L_88:
    ldr r1, _LIT2
    cmp r0, r1
    bne .L_a4
.L_94:
    mov r0, #0x1
    bx lr
.L_9c:
    mov r0, #0x1
    bx lr
.L_a4:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001962
_LIT1: .word 0x00001837
_LIT2: .word 0x00001a8d
