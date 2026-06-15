; func_0200c078 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .global func_0200c078
        .arm
func_0200c078:
    ldr ip, [r0, #0x18]
    add ip, ip, r1, lsl #0x5
    ldr ip, [ip, #0x18]
    cmp ip, r2
    moveq r0, #0x1
    bxeq lr
    cmp r3, #0x1
    bne .L_b4
    cmp ip, r2
    bcs .L_c8
    mov r0, #0x1
    bx lr
.L_b4:
    cmp r3, #0x2
    bne .L_c8
    cmp ip, r2
    movhi r0, #0x1
    bxhi lr
.L_c8:
    str r2, [r0, #0x25c]
    str r1, [r0, #0x260]
    ldr r2, [r0, #0x7c]
    ldr r1, _LIT0
    orr r2, r2, #0x4000000
    str r2, [r0, #0x7c]
    mov r0, #0x1
    str r0, [r1, #0x20]
    bx lr
_LIT0: .word data_021040ac
