; func_0202f290 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f290
        .arm
func_0202f290:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_94
    bge .L_e8
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_70
    sub r1, r2, #0xc
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_60
    b .L_e8
    b .L_e8
    b .L_e8
    b .L_e8
    b .L_e8
    b .L_e8
    b .L_e8
    b .L_f0
    b .L_f0
    b .L_f0
    b .L_f0
    b .L_e8
    b .L_e8
.L_60:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_e8
    b .L_f0
.L_70:
    add r1, r2, #0xf9
    cmp r0, r1
    bgt .L_84
    beq .L_e8
    b .L_f0
.L_84:
    sub r1, r3, #0x2
    cmp r0, r1
    beq .L_e8
    b .L_f0
.L_94:
    add r1, r3, #0x6
    cmp r0, r1
    bgt .L_c8
    bge .L_e8
    add r1, r3, #0x1
    cmp r0, r1
    bgt .L_b8
    beq .L_e8
    b .L_f0
.L_b8:
    add r1, r3, #0x4
    cmp r0, r1
    beq .L_e8
    b .L_f0
.L_c8:
    add r1, r3, #0x7
    cmp r0, r1
    bgt .L_dc
    beq .L_e8
    b .L_f0
.L_dc:
    add r1, r3, #0xa
    cmp r0, r1
    bne .L_f0
.L_e8:
    mov r0, #0x1
    bx lr
.L_f0:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001a52
_LIT1: .word 0x000018fb
_LIT2: .word 0x0000157b
