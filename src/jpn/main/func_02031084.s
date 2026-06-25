; func_02031084 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031084
        .arm
func_02031084:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_4d4
    bge .L_550
    sub r1, r3, #0x7b
    cmp r0, r1
    bgt .L_4c4
    sub r1, r3, #0x85
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_4b4
    b .L_520
    b .L_528
    b .L_578
    b .L_578
    b .L_578
    b .L_530
    b .L_578
    b .L_538
    b .L_578
    b .L_578
    b .L_540
.L_4b4:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_518
    b .L_578
.L_4c4:
    sub r1, r3, #0x71
    cmp r0, r1
    beq .L_548
    b .L_578
.L_4d4:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_4f4
    bge .L_568
    add r1, r3, #0x49
    cmp r0, r1
    beq .L_558
    b .L_578
.L_4f4:
    add r1, r2, #0x53
    cmp r0, r1
    bgt .L_508
    beq .L_560
    b .L_578
.L_508:
    add r1, r2, #0x16c
    cmp r0, r1
    beq .L_570
    b .L_578
.L_518:
    mov r0, #0x1
    bx lr
.L_520:
    mov r0, #0x3
    bx lr
.L_528:
    mov r0, #0x3
    bx lr
.L_530:
    mov r0, #0xff
    bx lr
.L_538:
    mov r0, #0x1
    bx lr
.L_540:
    mov r0, #0x3
    bx lr
.L_548:
    mov r0, #0xff
    bx lr
.L_550:
    mov r0, #0xff
    bx lr
.L_558:
    mov r0, #0xff
    bx lr
.L_560:
    mov r0, #0xff
    bx lr
.L_568:
    mov r0, #0x5
    bx lr
.L_570:
    mov r0, #0xff
    bx lr
.L_578:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001695
_LIT1: .word 0x0000128e
_LIT2: .word 0x00001817
