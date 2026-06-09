; func_ov002_02203738 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .global func_ov002_02203738
        .arm
func_ov002_02203738:
    ldrh r0, [r0, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    moveq r0, #0x1
    bxeq lr
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    ldr r0, _LIT0
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT1
    add r0, r0, #0x350
    ldr r1, [r1, r2]
    cmp r1, r0
    movgt r0, #0x1
    movle r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
