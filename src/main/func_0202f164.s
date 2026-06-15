; func_0202f164 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f164
        .arm
func_0202f164:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_268
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_258
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    beq .L_288
    b .L_290
.L_258:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_288
    b .L_290
.L_268:
    add r1, r2, #0xe8
    cmp r0, r1
    bgt .L_27c
    beq .L_288
    b .L_290
.L_27c:
    add r1, r2, #0xe9
    cmp r0, r1
    bne .L_290
.L_288:
    mov r0, #0x1
    bx lr
.L_290:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000017c9
_LIT1: .word 0x0000152e
