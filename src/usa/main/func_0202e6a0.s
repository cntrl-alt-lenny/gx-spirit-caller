; func_0202e6a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e6a0
        .arm
func_0202e6a0:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_138
    bge .L_178
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_128
    bge .L_178
    cmp r0, #0x1440
    bgt .L_180
    sub r1, r2, #0xf2
    cmp r0, r1
    blt .L_180
    cmpne r0, #0x1440
    beq .L_178
    b .L_180
.L_128:
    add r1, r2, #0xed
    cmp r0, r1
    beq .L_178
    b .L_180
.L_138:
    add r1, r2, #0x30
    cmp r0, r1
    bgt .L_158
    bge .L_178
    add r1, r2, #0x2f
    cmp r0, r1
    beq .L_178
    b .L_180
.L_158:
    add r1, r2, #0x48
    cmp r0, r1
    bgt .L_16c
    beq .L_178
    b .L_180
.L_16c:
    add r1, r2, #0x4d
    cmp r0, r1
    bne .L_180
.L_178:
    mov r0, #0x1
    bx lr
.L_180:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001656
_LIT1: .word 0x00001531
