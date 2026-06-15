; func_02031470 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031470
        .arm
func_02031470:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_ecc
    bge .L_f5c
    sub r1, r3, #0x540
    cmp r0, r1
    bgt .L_ea8
    bge .L_f5c
    cmp r0, #0xfe0
    bgt .L_e98
    beq .L_f5c
    b .L_f64
.L_e98:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_f5c
    b .L_f64
.L_ea8:
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_ebc
    beq .L_f5c
    b .L_f64
.L_ebc:
    add r1, r1, #0xa
    cmp r0, r1
    beq .L_f5c
    b .L_f64
.L_ecc:
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_f14
    sub r1, r2, #0x1
    cmp r0, r1
    blt .L_ef0
    cmpne r0, r2
    beq .L_f5c
    b .L_f64
.L_ef0:
    add r1, r3, #0xe5
    cmp r0, r1
    bgt .L_f04
    beq .L_f5c
    b .L_f64
.L_f04:
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_f5c
    b .L_f64
.L_f14:
    add r1, r2, #0x11c
    cmp r0, r1
    bgt .L_f34
    bge .L_f5c
    add r1, r2, #0x3b
    cmp r0, r1
    beq .L_f5c
    b .L_f64
.L_f34:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_f64
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_f64
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    bne .L_f64
.L_f5c:
    mov r0, #0x1
    bx lr
.L_f64:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000168f
_LIT1: .word 0x00000fee
_LIT2: .word 0x0000158a
_LIT3: .word 0x00001a25
_LIT4: .word 0x0000179c
_LIT5: .word 0x00001b44
