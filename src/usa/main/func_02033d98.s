; func_02033d98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02033d98
        .arm
func_02033d98:
    ldr r2, _LIT0
    cmp r1, r2
    beq .L_f0
    add r0, r2, #0x2
    cmp r1, r0
    blt .L_24
    add r0, r2, #0x7
    cmp r1, r0
    ble .L_f0
.L_24:
    ldr r0, _LIT1
    cmp r1, r0
    beq .L_f0
    add r0, r0, #0x2
    cmp r1, r0
    blt .L_48
    ldr r0, _LIT2
    cmp r1, r0
    ble .L_f0
.L_48:
    ldr r0, _LIT3
    cmp r1, r0
    blt .L_60
    add r0, r0, #0x5e
    cmp r1, r0
    ble .L_f0
.L_60:
    ldr r0, _LIT4
    cmp r1, r0
    blt .L_78
    add r0, r0, #0x5e
    cmp r1, r0
    ble .L_f0
.L_78:
    ldr r0, _LIT5
    cmp r1, r0
    blt .L_90
    add r0, r0, #0x5e
    cmp r1, r0
    ble .L_f0
.L_90:
    ldr r0, _LIT6
    cmp r1, r0
    blt .L_a8
    add r0, r0, #0x63
    cmp r1, r0
    ble .L_f0
.L_a8:
    ldr r0, _LIT7
    cmp r1, r0
    blt .L_c0
    add r0, r0, #0x63
    cmp r1, r0
    ble .L_f0
.L_c0:
    ldr r0, _LIT8
    cmp r1, r0
    blt .L_d8
    add r0, r0, #0x63
    cmp r1, r0
    ble .L_f0
.L_d8:
    ldr r0, _LIT9
    cmp r1, r0
    blt .L_f8
    add r0, r0, #0x63
    cmp r1, r0
    bgt .L_f8
.L_f0:
    mov r0, #0x1
    bx lr
.L_f8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00004e84
_LIT1: .word 0x00004e8d
_LIT2: .word 0x00005207
_LIT3: .word 0x0000cb24
_LIT4: .word 0x0000cb88
_LIT5: .word 0x0000cbec
_LIT6: .word 0x0000cc4c
_LIT7: .word 0x0000cf08
_LIT8: .word 0x0000cf6c
_LIT9: .word 0x0000cfd0
