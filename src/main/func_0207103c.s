; func_0207103c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef3c
        .global func_0207103c
        .arm
func_0207103c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r3, [r1, #0x8]
    ldr r2, [r1]
    ldr r0, [r1, #0x4]
    umull lr, ip, r3, r2
    mla ip, r3, r0, ip
    ldr r0, [r1, #0xc]
    ldr r3, [r1, #0x10]
    mla ip, r0, r2, ip
    adds r2, r3, lr
    ldr r0, [r1, #0x14]
    str r2, [r1]
    adc r0, r0, ip
    str r0, [r1, #0x4]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ef3c
