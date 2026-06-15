; func_020a3144 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9850
        .global func_020a3144
        .arm
func_020a3144:
    ldr r0, _LIT0
    ldrb r1, [r0, #0xc]
    cmp r1, #0x2
    bxne lr
    ldr r2, [r0, #0x4]
    ldrb r1, [r2, #0x4b2]
    cmp r1, #0x0
    moveq r1, #0x9
    streqb r1, [r0, #0x10]
    streq r2, [r0, #0x8]
    addne r1, r2, #0x220
    movne r2, #0x4
    strne r1, [r0, #0x8]
    strneb r2, [r0, #0x10]
    ldr r0, _LIT0
    mov r1, #0x3
    strb r1, [r0, #0xc]
    bx lr
_LIT0: .word data_021a9850
