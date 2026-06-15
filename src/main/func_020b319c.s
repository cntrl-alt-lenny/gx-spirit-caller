; func_020b319c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b319c
        .arm
func_020b319c:
    ands r2, r0, #-2147483648
    rsbmi r0, r0, #0x0
    cmp r0, #0x0
    bxeq lr
    clz r3, r0
    movs r0, r0, lsl r3
    rsb r3, r3, #0x9e
    ands r1, r0, #0xff
    add r0, r0, r0
    orr r0, r2, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    bxeq lr
    tst r1, #0x80
    bxeq lr
    ands r3, r1, #0x7f
    andeqs r3, r0, #0x1
    addne r0, r0, #0x1
    bx lr
