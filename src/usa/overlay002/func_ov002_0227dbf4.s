; func_ov002_0227dbf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0227dbf4
        .arm
func_ov002_0227dbf4:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_214
    bge .L_240
    sub r1, r2, #0x314
    cmp r0, r1
    bgt .L_204
    bge .L_240
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_240
    b .L_248
.L_204:
    sub r1, r2, #0xec
    cmp r0, r1
    beq .L_240
    b .L_248
.L_214:
    add r1, r2, #0xf6
    cmp r0, r1
    bgt .L_234
    bge .L_240
    add r1, r2, #0x69
    cmp r0, r1
    beq .L_240
    b .L_248
.L_234:
    ldr r1, _LIT2
    cmp r0, r1
    bne .L_248
.L_240:
    mov r0, #0x1
    bx lr
.L_248:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001958
_LIT1: .word 0x00001505
_LIT2: .word 0x00001a79
