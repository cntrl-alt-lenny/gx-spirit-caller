; func_020372d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b680
        .global func_020372d8
        .arm
func_020372d8:
    ldr r3, _LIT0
    ldr r1, _LIT1
    mov ip, #0x0
.L_e8:
    ldrsb r2, [r3, #0x6a]
    cmp r2, #0x0
    blt .L_10c
    ldrh r2, [r3, #0x68]
    tst r2, r1
    bne .L_10c
    cmp r3, r0
    movne r0, #0x1
    bxne lr
.L_10c:
    add ip, ip, #0x1
    cmp ip, #0x1c
    add r3, r3, #0x78
    blt .L_e8
    mov r0, #0x0
    bx lr
_LIT0: .word data_0219b680
_LIT1: .word 0x00003003
