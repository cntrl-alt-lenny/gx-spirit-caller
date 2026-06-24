; func_02030e50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02030e50
        .arm
func_02030e50:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_2f4
    bge .L_42c
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_2a0
    bge .L_41c
    sub r1, r3, #0x520
    cmp r0, r1
    bgt .L_27c
    bge .L_3f4
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_26c
    beq .L_42c
    b .L_434
.L_26c:
    add r1, r1, #0xb
    cmp r0, r1
    beq .L_3f4
    b .L_434
.L_27c:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_290
    beq .L_3fc
    b .L_434
.L_290:
    sub r1, r2, #0x8d
    cmp r0, r1
    beq .L_41c
    b .L_434
.L_2a0:
    cmp r0, #0x1400
    bgt .L_2d0
    bge .L_404
    add r1, r2, #0x45
    cmp r0, r1
    bgt .L_2c0
    beq .L_42c
    b .L_434
.L_2c0:
    add r1, r2, #0x52
    cmp r0, r1
    beq .L_42c
    b .L_434
.L_2d0:
    sub r1, r3, #0x8c
    cmp r0, r1
    bgt .L_2e4
    beq .L_414
    b .L_434
.L_2e4:
    add r1, r2, #0x1e4
    cmp r0, r1
    beq .L_40c
    b .L_434
.L_2f4:
    add r1, r3, #0x2e8
    cmp r0, r1
    bgt .L_390
    ldr r2, _LIT4
    cmp r0, r2
    blt .L_320
    beq .L_3f4
    add r1, r2, #0x1
    cmp r0, r1
    beq .L_424
    b .L_434
.L_320:
    sub r1, r2, #0x174
    cmp r0, r1
    bgt .L_36c
    bge .L_41c
    sub r1, r2, #0x270
    cmp r0, r1
    bgt .L_35c
    sub r1, r2, #0x274
    cmp r0, r1
    blt .L_434
    beq .L_414
    sub r1, r2, #0x270
    cmp r0, r1
    beq .L_42c
    b .L_434
.L_35c:
    add r1, r3, #0xc5
    cmp r0, r1
    beq .L_42c
    b .L_434
.L_36c:
    sub r1, r2, #0x6f
    cmp r0, r1
    bgt .L_380
    beq .L_414
    b .L_434
.L_380:
    sub r1, r2, #0x1
    cmp r0, r1
    beq .L_42c
    b .L_434
.L_390:
    add r1, r3, #0x3e0
    cmp r0, r1
    bgt .L_3c4
    bge .L_42c
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_3b4
    beq .L_414
    b .L_434
.L_3b4:
    add r1, r1, #0x10
    cmp r0, r1
    beq .L_41c
    b .L_434
.L_3c4:
    ldr r1, _LIT6
    cmp r0, r1
    bgt .L_3e4
    bge .L_3fc
    sub r1, r1, #0x25
    cmp r0, r1
    beq .L_414
    b .L_434
.L_3e4:
    add r1, r1, #0x6
    cmp r0, r1
    beq .L_40c
    b .L_434
.L_3f4:
    ldr r0, _LIT7
    bx lr
.L_3fc:
    mov r0, #0x3
    bx lr
.L_404:
    mov r0, #0x2
    bx lr
.L_40c:
    mov r0, #0x3
    bx lr
.L_414:
    mov r0, #0x2
    bx lr
.L_41c:
    mov r0, #0x0
    bx lr
.L_424:
    mov r0, #0x0
    bx lr
.L_42c:
    ldr r0, _LIT7
    bx lr
.L_434:
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
