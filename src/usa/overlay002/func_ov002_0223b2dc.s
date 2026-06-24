; func_ov002_0223b2dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca8bc
        .global func_ov002_0223b2dc
        .arm
func_ov002_0223b2dc:
    ldr r2, _LIT0
    mov ip, #0x0
.L_a88:
    mov r3, ip, lsl #0x3
    ldrh r1, [r2, r3]
    cmp r0, r1
    addeq r0, r2, r3
    bxeq lr
    add ip, ip, #0x1
    cmp ip, #0x60
    bcc .L_a88
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022ca8bc
