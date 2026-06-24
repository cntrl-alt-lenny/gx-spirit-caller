; func_020a34e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9818
        .global func_020a34e8
        .arm
func_020a34e8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r1, #0x2
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    ldr r2, _LIT0
    strh r0, [sp]
    ldr r0, [r2]
    strh r1, [sp, #0x2]
    ldr r2, [r0, #0x51c]
    add r1, sp, #0x0
    mov r0, #0xff
    blx r2
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a9818
