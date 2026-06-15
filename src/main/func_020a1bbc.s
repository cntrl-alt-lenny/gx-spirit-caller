; func_020a1bbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98fc
        .global func_020a1bbc
        .arm
func_020a1bbc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    ldr r3, [r3]
    add r3, r3, #0x1000
    ldr r3, [r3, #0x4e4]
    cmp r3, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    blx r3
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a98fc
