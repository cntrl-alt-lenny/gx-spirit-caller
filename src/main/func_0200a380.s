; func_0200a380 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02106810
        .global func_0200a380
        .arm
func_0200a380:
    ldr r1, _LIT0
    mov r2, #0x0
.L_b98:
    ldrh r0, [r1]
    add r2, r2, #0x1
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    ldrneh r0, [r1, #0x4]
    bicne r0, r0, #0x1
    strneh r0, [r1, #0x4]
    cmp r2, #0x50
    add r1, r1, #0x6
    blt .L_b98
    bx lr
_LIT0: .word data_02106810
