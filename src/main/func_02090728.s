; func_02090728 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OSi_IrqCallbackTable
        .extern data_021a6354
        .global func_02090728
        .arm
func_02090728:
    ldr r2, _LIT0
    mov r3, #0x0
.L_1bc:
    ands r1, r0, #0x1
    beq .L_21c
    cmp r3, #0x8
    blt .L_1ec
    cmp r3, #0xb
    bgt .L_1ec
    sub r1, r3, #0x8
    mov r0, #0xc
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    bx lr
.L_1ec:
    cmp r3, #0x3
    blt .L_214
    cmp r3, #0x6
    bgt .L_214
    add r1, r3, #0x1
    mov r0, #0xc
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    bx lr
.L_214:
    ldr r0, [r2]
    bx lr
.L_21c:
    add r3, r3, #0x1
    cmp r3, #0x16
    mov r0, r0, lsr #0x1
    add r2, r2, #0x4
    blt .L_1bc
    mov r0, #0x0
    bx lr
_LIT0: .word OSi_IrqCallbackTable
_LIT1: .word data_021a6354
