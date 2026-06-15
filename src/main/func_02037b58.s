; func_02037b58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b760
        .extern data_0219c408
        .global func_02037b58
        .arm
func_02037b58:
    ldr r1, _LIT0
    ldr r2, _LIT1
    cmp r0, r1
    bls .L_34
    tst r0, #0x8000000
    bne .L_34
    cmp r0, r2
    bcc .L_2c
    ldr r1, _LIT2
    cmp r0, r1
    bxls lr
.L_2c:
    mov r0, #0x0
    bx lr
.L_34:
    mov r1, r0, lsl #0x10
    mov r3, #0x0
.L_3c:
    ldrsb r0, [r2, #0x6a]
    cmp r0, #0x0
    blt .L_68
    ldr r0, [r2, #0x34]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, r1, lsr #0x10
    ldrneh r0, [r2, #0x74]
    cmpne r0, r1, lsr #0x10
    moveq r0, r2
    bxeq lr
.L_68:
    add r3, r3, #0x1
    cmp r3, #0x1c
    add r2, r2, #0x78
    blt .L_3c
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000ffff
_LIT1: .word data_0219b760
_LIT2: .word data_0219c408
