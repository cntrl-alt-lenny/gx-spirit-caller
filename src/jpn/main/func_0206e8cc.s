; func_0206e8cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ec74
        .global func_0206e8cc
        .arm
func_0206e8cc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    ldr r1, _LIT0
    ldr r2, [r0, #-4]
    ldr r3, [r1]
    sub r1, r0, #0x4
    mov r0, #0x0
    blx r3
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ec74
