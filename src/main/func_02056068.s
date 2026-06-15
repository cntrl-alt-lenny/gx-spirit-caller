; func_02056068 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3f0
        .extern func_0205673c
        .global func_02056068
        .arm
func_02056068:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    ldr r3, [r3]
    cmp r3, #0x1
    addne sp, sp, #0x4
    movne r0, #0x2
    ldmnefd sp!, {pc}
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x2
    ldmeqfd sp!, {pc}
    bl func_0205673c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219e3f0
