; func_02031538 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031538
        .arm
func_02031538:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_fa4
    bge .L_fc4
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_fc4
    b .L_fcc
.L_fa4:
    add r1, r2, #0x7b
    cmp r0, r1
    bgt .L_fb8
    beq .L_fc4
    b .L_fcc
.L_fb8:
    ldr r1, _LIT2
    cmp r0, r1
    bne .L_fcc
.L_fc4:
    mov r0, #0x1
    bx lr
.L_fcc:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000149c
_LIT1: .word 0x00001232
_LIT2: .word 0x00001a67
