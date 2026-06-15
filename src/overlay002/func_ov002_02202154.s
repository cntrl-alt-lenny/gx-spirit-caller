; func_ov002_02202154 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .global func_ov002_02202154
        .arm
func_ov002_02202154:
    ldr r1, _LIT0
    ldr r2, [r1, #0xcf8]
    cmp r2, #0x1
    movne r0, #0x0
    bxne lr
    ldrh r2, [r0, #0x2]
    ldr r0, [r1, #0xcec]
    mov r1, r2, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    moveq r0, #0x0
    bxeq lr
    rsb r1, r0, #0x1
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
