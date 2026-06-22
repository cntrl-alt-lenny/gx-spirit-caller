; func_02005b1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103c8c
        .global func_02005b1c
        .arm
func_02005b1c:
    cmp r0, #0x1
    beq .L_25c
    cmp r0, #0x2
    beq .L_268
    b .L_274
.L_25c:
    ldr r0, _LIT0
    ldr r0, [r0]
    b .L_278
.L_268:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    b .L_278
.L_274:
    mov r0, #0x0
.L_278:
    add r0, r0, r1, lsl #0x5
    bx lr
_LIT0: .word data_02103c8c
