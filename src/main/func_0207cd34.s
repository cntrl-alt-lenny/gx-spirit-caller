; func_0207cd34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a0890
        .global func_0207cd34
        .arm
func_0207cd34:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r2, r0
    ldr ip, [r1, #0x28]
    cmp ip, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    ldrh r3, [r2, #0x6]
    add r0, r2, #0x1e
    add r1, r2, #0x18
    add r2, r2, #0x2c
    blx ip
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a0890
