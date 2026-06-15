; func_0202ed90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202ed90
        .arm
func_0202ed90:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_314
    bge .L_360
    sub r1, r2, #0x5c
    cmp r0, r1
    bgt .L_304
    sub r1, r2, #0x5f
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_368
    b .L_360
    b .L_360
    b .L_360
    b .L_360
.L_304:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_360
    b .L_368
.L_314:
    add r1, r2, #0x4
    cmp r0, r1
    bgt .L_354
    add r1, r2, #0x2
    cmp r0, r1
    blt .L_344
    addne r1, r2, #0x3
    cmpne r0, r1
    addne r1, r2, #0x4
    cmpne r0, r1
    beq .L_360
    b .L_368
.L_344:
    add r1, r2, #0x1
    cmp r0, r1
    beq .L_360
    b .L_368
.L_354:
    add r1, r2, #0xc4
    cmp r0, r1
    bne .L_368
.L_360:
    mov r0, #0x1
    bx lr
.L_368:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001a61
_LIT1: .word 0x00001a60
