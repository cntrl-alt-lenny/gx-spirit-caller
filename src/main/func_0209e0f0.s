; func_0209e0f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8d2c
        .extern func_0209def8
        .global func_0209e0f0
        .arm
func_0209e0f0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r2, #0xf00
    bl func_0209def8
    cmp r0, #0x0
    ldreq r1, _LIT0
    moveq r2, #0x0
    ldreq r1, [r1]
    streqh r2, [r1, #0x16]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a8d2c
