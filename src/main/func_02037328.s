; func_02037328 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b760
        .global func_02037328
        .arm
func_02037328:
    ldr r3, _LIT0
    ldr r1, _LIT1
    mov ip, #0x0
.L_6c8:
    ldrsb r2, [r3, #0x6a]
    cmp r2, #0x0
    blt .L_6ec
    ldrh r2, [r3, #0x68]
    tst r2, r1
    bne .L_6ec
    cmp r3, r0
    movne r0, #0x1
    bxne lr
.L_6ec:
    add ip, ip, #0x1
    cmp ip, #0x1c
    add r3, r3, #0x78
    blt .L_6c8
    mov r0, #0x0
    bx lr
_LIT0: .word data_0219b760
_LIT1: .word 0x00003003
