; func_ov002_02216530 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .global func_ov002_02216530
        .arm
func_ov002_02216530:
    ldr r2, _LIT0
    ldr r2, [r2, #0x48c]
    ldrh r2, [r2, #0x2]
    mov r2, r2, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    beq .L_130
    cmp r1, #0xb
    moveq r0, #0x800
    bxeq lr
.L_130:
    mov r0, #0x0
    bx lr
_LIT0: .word data_ov002_022ce288
