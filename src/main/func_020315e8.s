; func_020315e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020315e8
        .arm
func_020315e8:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_1014
    bge .L_1060
    sub r1, r2, #0xa0
    cmp r0, r1
    bgt .L_1004
    beq .L_1060
    b .L_1068
.L_1004:
    sub r1, r2, #0xb
    cmp r0, r1
    beq .L_1060
    b .L_1068
.L_1014:
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_1034
    bge .L_1060
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_1060
    b .L_1068
.L_1034:
    add r1, r2, #0xd6
    cmp r0, r1
    bgt .L_1068
    add r1, r2, #0xd4
    cmp r0, r1
    blt .L_1068
    addne r1, r2, #0xd5
    cmpne r0, r1
    addne r1, r2, #0xd6
    cmpne r0, r1
    bne .L_1068
.L_1060:
    mov r0, #0x1
    bx lr
.L_1068:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000010b3
_LIT1: .word 0x0000179c
_LIT2: .word 0x00001228
