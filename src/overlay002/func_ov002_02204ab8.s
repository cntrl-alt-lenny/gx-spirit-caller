; func_ov002_02204ab8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .global func_ov002_02204ab8
        .arm
func_ov002_02204ab8:
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    and r2, r3, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x3e8
    movgt r0, #0x0
    bxgt lr
    ldr r0, _LIT2
    ldr r0, [r0, #0xcec]
    cmp r0, r3
    moveq r0, #0x0
    movne r0, #0x2
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022d016c
