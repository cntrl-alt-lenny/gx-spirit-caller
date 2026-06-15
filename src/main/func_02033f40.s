; func_02033f40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02033f40
        .arm
func_02033f40:
    ldr r2, _LIT0
    cmp r1, r2
    beq .L_54
    add r0, r2, #0x1
    cmp r1, r0
    blt .L_24
    add r0, r2, #0x3
    cmp r1, r0
    ble .L_54
.L_24:
    ldr r0, _LIT1
    cmp r1, r0
    blt .L_3c
    add r0, r0, #0x5e
    cmp r1, r0
    ble .L_54
.L_3c:
    ldr r0, _LIT2
    cmp r1, r0
    blt .L_5c
    add r0, r0, #0x62
    cmp r1, r0
    bgt .L_5c
.L_54:
    mov r0, #0x1
    bx lr
.L_5c:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000c79b
_LIT1: .word 0x0000c7a0
_LIT2: .word 0x0000c864
