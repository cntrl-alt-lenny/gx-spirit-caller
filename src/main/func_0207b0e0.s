; func_0207b0e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a088c
        .global func_0207b0e0
        .arm
func_0207b0e0:
    stmfd sp!, {lr}
    sub sp, sp, #0x14
    ldr ip, _LIT0
    ldr ip, [ip]
    add ip, ip, #0x2000
    ldr lr, [ip, #0x27c]
    cmp lr, #0x0
    addeq sp, sp, #0x14
    ldmeqfd sp!, {lr}
    bxeq lr
    ldr lr, [sp, #0x18]
    strh r0, [sp]
    str r2, [sp, #0x4]
    str r3, [sp, #0x8]
    str lr, [sp, #0xc]
    strh r1, [sp, #0x2]
    ldr r1, [ip, #0x27c]
    add r0, sp, #0x0
    blx r1
    add sp, sp, #0x14
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a088c
