; func_0209d344 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83e0
        .extern func_020918f0
        .global func_0209d344
        .arm
func_0209d344:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0xb
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    cmp r2, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    ldr r1, _LIT0
    ldr r0, [r1, #0x114]
    bic r0, r0, #0x20
    str r0, [r1, #0x114]
    ldr r0, [r1, #0x104]
    bl func_020918f0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a83e0
