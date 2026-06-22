; func_0207d21c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d21c
        .arm
func_0207d21c:
    ldrh r0, [r0, #-14]
    and r0, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bx lr
