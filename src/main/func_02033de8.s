; func_02033de8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02033de8
        .arm
func_02033de8:
    ldr r2, _LIT0
    cmp r1, r2
    beq .L_19c
    add r0, r2, #0x2
    cmp r1, r0
    blt .L_d0
    add r0, r2, #0x7
    cmp r1, r0
    ble .L_19c
.L_d0:
    ldr r0, _LIT1
    cmp r1, r0
    beq .L_19c
    add r0, r0, #0x2
    cmp r1, r0
    blt .L_f4
    ldr r0, _LIT2
    cmp r1, r0
    ble .L_19c
.L_f4:
    ldr r0, _LIT3
    cmp r1, r0
    blt .L_10c
    add r0, r0, #0x5e
    cmp r1, r0
    ble .L_19c
.L_10c:
    ldr r0, _LIT4
    cmp r1, r0
    blt .L_124
    add r0, r0, #0x5e
    cmp r1, r0
    ble .L_19c
.L_124:
    ldr r0, _LIT5
    cmp r1, r0
    blt .L_13c
    add r0, r0, #0x5e
    cmp r1, r0
    ble .L_19c
.L_13c:
    ldr r0, _LIT6
    cmp r1, r0
    blt .L_154
    add r0, r0, #0x63
    cmp r1, r0
    ble .L_19c
.L_154:
    ldr r0, _LIT7
    cmp r1, r0
    blt .L_16c
    add r0, r0, #0x63
    cmp r1, r0
    ble .L_19c
.L_16c:
    ldr r0, _LIT8
    cmp r1, r0
    blt .L_184
    add r0, r0, #0x63
    cmp r1, r0
    ble .L_19c
.L_184:
    ldr r0, _LIT9
    cmp r1, r0
    blt .L_1a4
    add r0, r0, #0x63
    cmp r1, r0
    bgt .L_1a4
.L_19c:
    mov r0, #0x1
    bx lr
.L_1a4:
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
