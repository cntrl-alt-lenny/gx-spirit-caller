; func_02033f60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02033f60
        .arm
func_02033f60:
    ldr r0, _LIT0
    cmp r1, r0
    blt .L_88
    add r0, r0, #0x3
    cmp r1, r0
    ble .L_b8
.L_88:
    ldr r0, _LIT1
    cmp r1, r0
    blt .L_a0
    add r0, r0, #0x3
    cmp r1, r0
    ble .L_b8
.L_a0:
    ldr r0, _LIT2
    cmp r1, r0
    blt .L_c0
    add r0, r0, #0x3
    cmp r1, r0
    bgt .L_c0
.L_b8:
    mov r0, #0x1
    bx lr
.L_c0:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000cb20
_LIT1: .word 0x0000cb84
_LIT2: .word 0x0000cbe8
