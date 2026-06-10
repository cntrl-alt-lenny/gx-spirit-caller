; func_ov002_0229a060 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov002_022ca370
        .global func_ov002_0229a060
        .arm
func_ov002_0229a060:
    ldr r1, _LIT0
    ldr r1, [r1, #0xa64]
    and r1, r1, #0x1f00000
    mov r1, r1, lsr #0x14
    cmp r1, #0x0
    ble .L_34
    sub r2, r1, #0x1
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1
    ldrh r1, [r1, r2]
    cmp r0, r1
    moveq r0, #0x1
    bxeq lr
.L_34:
    mov r0, #0x0
    bx lr
_LIT0: .word data_02104f4c
_LIT1: .word data_ov002_022ca370
