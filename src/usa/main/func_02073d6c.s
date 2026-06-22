; func_02073d6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02073d6c
        .arm
func_02073d6c:
    and r0, r0, #-268435456
    cmp r0, #-536870912
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
