; func_0209b354 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8304
        .global func_0209b354
        .arm
func_0209b354:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    ldr r1, [r2]
    ldr ip, [r2, #0x4]
    cmp r1, #0x0
    movne r3, #0x0
    strne r3, [r2]
    cmp ip, #0x0
    addeq sp, sp, #0x4
    ldr r1, [r2, #0x8]
    ldmeqfd sp!, {lr}
    bxeq lr
    ldr r2, _LIT0
    mov r3, #0x0
    str r3, [r2, #0x4]
    blx ip
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a8304
