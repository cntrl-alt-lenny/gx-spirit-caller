; func_0202efa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202efa8
        .arm
func_0202efa8:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_e4
    bge .L_104
    sub r1, r2, #0xdc
    cmp r0, r1
    beq .L_104
    b .L_10c
.L_e4:
    add r1, r2, #0x4f
    cmp r0, r1
    bgt .L_f8
    beq .L_104
    b .L_10c
.L_f8:
    add r1, r2, #0xac
    cmp r0, r1
    bne .L_10c
.L_104:
    mov r0, #0x1
    bx lr
.L_10c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001913
