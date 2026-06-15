; func_0202e6f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e6f4
        .arm
func_0202e6f4:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_3ec
    bge .L_42c
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_3dc
    bge .L_42c
    cmp r0, #0x1440
    bgt .L_434
    sub r1, r2, #0xf2
    cmp r0, r1
    blt .L_434
    cmpne r0, #0x1440
    beq .L_42c
    b .L_434
.L_3dc:
    add r1, r2, #0xed
    cmp r0, r1
    beq .L_42c
    b .L_434
.L_3ec:
    add r1, r2, #0x30
    cmp r0, r1
    bgt .L_40c
    bge .L_42c
    add r1, r2, #0x2f
    cmp r0, r1
    beq .L_42c
    b .L_434
.L_40c:
    add r1, r2, #0x48
    cmp r0, r1
    bgt .L_420
    beq .L_42c
    b .L_434
.L_420:
    add r1, r2, #0x4d
    cmp r0, r1
    bne .L_434
.L_42c:
    mov r0, #0x1
    bx lr
.L_434:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001656
_LIT1: .word 0x00001531
