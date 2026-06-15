; func_0207c990 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_01ff8180
        .global func_0207c990
        .arm
func_0207c990:
    ldr r2, [r0, #0x8]
    cmp r2, #0x0
    bne .L_e0
    ldr r1, _LIT0
    str r1, [r0, #0x8]
    ldr r1, [r0, #0xc]
    add r1, r1, #0x1
    str r1, [r0, #0xc]
    mov r0, #0x1
    bx lr
.L_e0:
    ldr r1, _LIT0
    cmp r2, r1
    ldreq r1, [r0, #0xc]
    addeq r1, r1, #0x1
    streq r1, [r0, #0xc]
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
_LIT0: .word func_01ff8180
