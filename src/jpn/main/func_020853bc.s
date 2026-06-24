; func_020853bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020853bc
        .arm
func_020853bc:
    ldrh r2, [r0, #0xc]
    ldrh r1, [r0, #0xe]
    add r3, r0, r2
    cmp r1, #0x1
    bne .L_b8
    ldr r2, [r0]
    ldr r1, _LIT0
    cmp r2, r1
    ldreq r1, [r3]
    addeq r0, r0, r1
    movne r0, #0x0
    bx lr
.L_b8:
    ldr r1, [r3, #0x4]
    add r0, r0, r1
    bx lr
_LIT0: .word 0x30585442
