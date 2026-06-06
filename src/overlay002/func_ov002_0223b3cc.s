; func_ov002_0223b3cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca9bc
        .global func_ov002_0223b3cc
        .arm
func_ov002_0223b3cc:
    ldr r2, _LIT0
    mov ip, #0x0
.L_1640:
    mov r3, ip, lsl #0x3
    ldrh r1, [r2, r3]
    cmp r0, r1
    addeq r0, r2, r3
    bxeq lr
    add ip, ip, #0x1
    cmp ip, #0x60
    bcc .L_1640
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022ca9bc
