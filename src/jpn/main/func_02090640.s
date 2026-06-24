; func_02090640 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OSi_IrqCallbackTable
        .extern data_021a6274
        .global func_02090640
        .arm
func_02090640:
    ldr r2, _LIT0
    mov r3, #0x0
.L_8:
    ands r1, r0, #0x1
    beq .L_68
    cmp r3, #0x8
    blt .L_38
    cmp r3, #0xb
    bgt .L_38
    sub r1, r3, #0x8
    mov r0, #0xc
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    bx lr
.L_38:
    cmp r3, #0x3
    blt .L_60
    cmp r3, #0x6
    bgt .L_60
    add r1, r3, #0x1
    mov r0, #0xc
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    bx lr
.L_60:
    ldr r0, [r2]
    bx lr
.L_68:
    add r3, r3, #0x1
    cmp r3, #0x16
    mov r0, r0, lsr #0x1
    add r2, r2, #0x4
    blt .L_8
    mov r0, #0x0
    bx lr
_LIT0: .word OSi_IrqCallbackTable
_LIT1: .word data_021a6274
