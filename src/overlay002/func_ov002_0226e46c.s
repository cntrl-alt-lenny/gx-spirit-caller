; func_ov002_0226e46c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0226e46c
        .arm
func_ov002_0226e46c:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_3f4
    bge .L_474
    sub r1, r2, #0x240
    cmp r0, r1
    bgt .L_3d0
    sub r1, r2, #0x244
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_3c0
    b .L_46c
    b .L_474
    b .L_474
    b .L_474
    b .L_474
.L_3c0:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_464
    b .L_47c
.L_3d0:
    sub r1, r2, #0x2
    cmp r0, r1
    bgt .L_3e4
    beq .L_474
    b .L_47c
.L_3e4:
    sub r1, r2, #0x1
    cmp r0, r1
    beq .L_46c
    b .L_47c
.L_3f4:
    add r1, r2, #0x1d
    cmp r0, r1
    bgt .L_440
    bge .L_474
    add r1, r2, #0x1
    cmp r0, r1
    bgt .L_418
    beq .L_474
    b .L_47c
.L_418:
    add r1, r2, #0x4
    cmp r0, r1
    bgt .L_47c
    add r1, r2, #0x2
    cmp r0, r1
    blt .L_47c
    addne r1, r2, #0x4
    cmpne r0, r1
    beq .L_474
    b .L_47c
.L_440:
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_454
    beq .L_474
    b .L_47c
.L_454:
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_46c
    b .L_47c
.L_464:
    mov r0, #0x3
    bx lr
.L_46c:
    mov r0, #0x2
    bx lr
.L_474:
    mov r0, #0x1
    bx lr
.L_47c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000016c7
_LIT1: .word 0x00001466
_LIT2: .word 0x000018b4
_LIT3: .word 0x000019ca
