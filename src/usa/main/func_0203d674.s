; func_0203d674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203d674
        .arm
func_0203d674:
    ldrb r0, [r0, #0xd0b]
    mov r0, r0, lsl #0x1e
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    moveq r0, #0x30000
    movne r0, #0x20000
    bx lr
