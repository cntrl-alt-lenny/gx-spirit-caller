; func_0203b7e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203b7e0
        .arm
func_0203b7e0:
    ldrh r2, [r0, #0xb0]
    tst r2, #0x8000
    moveq r0, #0x8
    bxeq lr
    ldrb r1, [r0, #0xc1]
    cmp r1, #0x0
    moveq r0, #0x2
    bxeq lr
    ldr r1, _LIT0
    tst r2, r1
    movne r0, #0x8
    bxne lr
    ldr r0, [r0, #0x78]
    ldrsh r1, [r0, #0x4]
    ldrsh r0, [r0, #0x24]
    sub r0, r1, r0
    cmp r0, #0x0
    movle r0, #0x0
    bx lr
_LIT0: .word 0x00002002
