; func_ov002_02202c18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern data_ov002_022d008c
        .global func_ov002_02202c18
        .arm
func_ov002_02202c18:
    ldr r1, _LIT0
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x2
    movne r0, #0x0
    bxne lr
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x14
    tst r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a8
