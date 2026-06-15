; func_0202f2e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f2e4
        .arm
func_0202f2e4:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_160
    bge .L_1b4
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_13c
    sub r1, r2, #0xc
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_12c
    b .L_1b4
    b .L_1b4
    b .L_1b4
    b .L_1b4
    b .L_1b4
    b .L_1b4
    b .L_1b4
    b .L_1bc
    b .L_1bc
    b .L_1bc
    b .L_1bc
    b .L_1b4
    b .L_1b4
.L_12c:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_1b4
    b .L_1bc
.L_13c:
    add r1, r2, #0xf9
    cmp r0, r1
    bgt .L_150
    beq .L_1b4
    b .L_1bc
.L_150:
    sub r1, r3, #0x2
    cmp r0, r1
    beq .L_1b4
    b .L_1bc
.L_160:
    add r1, r3, #0x6
    cmp r0, r1
    bgt .L_194
    bge .L_1b4
    add r1, r3, #0x1
    cmp r0, r1
    bgt .L_184
    beq .L_1b4
    b .L_1bc
.L_184:
    add r1, r3, #0x4
    cmp r0, r1
    beq .L_1b4
    b .L_1bc
.L_194:
    add r1, r3, #0x7
    cmp r0, r1
    bgt .L_1a8
    beq .L_1b4
    b .L_1bc
.L_1a8:
    add r1, r3, #0xa
    cmp r0, r1
    bne .L_1bc
.L_1b4:
    mov r0, #0x1
    bx lr
.L_1bc:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001a52
_LIT1: .word 0x000018fb
_LIT2: .word 0x0000157b
