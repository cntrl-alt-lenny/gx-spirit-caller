; func_020a60fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9858
        .extern func_02093b08
        .global func_020a60fc
        .arm
func_020a60fc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    and r0, r1, #0x3f
    cmp r0, #0x1
    ldreq r0, _LIT0
    moveq r1, #0x1
    streqh r1, [r0]
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    bl func_02093b08
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a9858
