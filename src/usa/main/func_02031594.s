; func_02031594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031594
        .arm
func_02031594:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_34
    bge .L_80
    sub r1, r2, #0xa0
    cmp r0, r1
    bgt .L_24
    beq .L_80
    b .L_88
.L_24:
    sub r1, r2, #0xb
    cmp r0, r1
    beq .L_80
    b .L_88
.L_34:
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_54
    bge .L_80
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_80
    b .L_88
.L_54:
    add r1, r2, #0xd6
    cmp r0, r1
    bgt .L_88
    add r1, r2, #0xd4
    cmp r0, r1
    blt .L_88
    addne r1, r2, #0xd5
    cmpne r0, r1
    addne r1, r2, #0xd6
    cmpne r0, r1
    bne .L_88
.L_80:
    mov r0, #0x1
    bx lr
.L_88:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000010b3
_LIT1: .word 0x0000179c
_LIT2: .word 0x00001228
