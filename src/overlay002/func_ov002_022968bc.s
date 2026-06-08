; func_ov002_022968bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_022968bc
        .arm
func_ov002_022968bc:
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mla r0, r2, r0, r1
    ldr r1, [r0, #0xf8]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x13
    cmp r0, r1, lsr #0x13
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x0000175e
