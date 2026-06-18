; func_ov002_021f6940 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_021f6940
        .arm
func_ov002_021f6940:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r1
    movne r0, #0x0
    bxne lr
    cmp r2, #0x4
    movgt r0, #0x0
    bxgt lr
    ldr r0, _LIT0
    ldr r3, _LIT1
    and ip, r1, #0x1
    mla r1, ip, r0, r3
    mov r0, #0x14
    mla r0, r2, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
