; func_02034004 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02034004
        .arm
func_02034004:
    ldr r0, _LIT0
    cmp r1, r0
    beq .L_24
    ldr r0, _LIT1
    cmp r1, r0
    blt .L_2c
    ldr r0, _LIT2
    cmp r1, r0
    bgt .L_2c
.L_24:
    mov r0, #0x1
    bx lr
.L_2c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00004e85
_LIT1: .word 0x000059d8
_LIT2: .word 0x00005dbf
