; func_0202b95c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be72c
        .extern data_020be72e
        .global func_0202b95c
        .arm
func_0202b95c:
    ldr r2, _LIT0
    mov ip, #0x0
.L_8:
    mov r3, ip, lsl #0x2
    ldrh r1, [r2, r3]
    cmp r0, r1
    ldreq r0, _LIT1
    ldreqh r0, [r0, r3]
    bxeq lr
    add ip, ip, #0x1
    cmp ip, #0x62
    bcc .L_8
    mov r0, #0x3
    bx lr
_LIT0: .word data_020be72c
_LIT1: .word data_020be72e
