; func_02091f8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .global func_02091f8c
        .arm
func_02091f8c:
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r1, [r1, #0x8]
    b .L_368
.L_360:
    mov r2, r1
    ldr r1, [r1, #0x68]
.L_368:
    cmp r1, #0x0
    beq .L_378
    cmp r1, r0
    bne .L_360
.L_378:
    cmp r2, #0x0
    ldreq r1, [r0, #0x68]
    ldreq r0, _LIT0
    streq r1, [r0, #0x8]
    ldrne r0, [r0, #0x68]
    strne r0, [r2, #0x68]
    bx lr
_LIT0: .word data_021a62f0
