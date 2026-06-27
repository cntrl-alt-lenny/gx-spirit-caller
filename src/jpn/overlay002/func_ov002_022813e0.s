; func_ov002_022813e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022813e0
        .arm
func_ov002_022813e0:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_23c
    bge .L_27c
    sub r1, r3, #0x8c
    cmp r0, r1
    bgt .L_22c
    sub r1, r3, #0x8f
    cmp r0, r1
    blt .L_21c
    subne r1, r3, #0x8c
    cmpne r0, r1
    beq .L_27c
    b .L_284
.L_21c:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_27c
    b .L_284
.L_22c:
    sub r1, r3, #0x76
    cmp r0, r1
    beq .L_27c
    b .L_284
.L_23c:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_25c
    bge .L_27c
    add r1, r3, #0x194
    cmp r0, r1
    beq .L_27c
    b .L_284
.L_25c:
    add r1, r2, #0x1e
    cmp r0, r1
    bgt .L_270
    beq .L_27c
    b .L_284
.L_270:
    add r1, r2, #0xf3
    cmp r0, r1
    bne .L_284
.L_27c:
    mov r0, #0x1
    bx lr
.L_284:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001310
_LIT1: .word 0x000010a6
_LIT2: .word 0x00001639
