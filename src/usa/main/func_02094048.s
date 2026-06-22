; func_02094048 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6630
        .global func_02094048
        .arm
func_02094048:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0, #0x10]
    str r2, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldr r0, [r0, #0x14]
    ldmeqfd sp!, {lr}
    bxeq lr
    blx r1
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6630
