; func_0207e1c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210210c
        .extern data_02102120
        .global func_0207e1c4
        .arm
func_0207e1c4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr lr, [sp, #0x18]
    ldr r6, _LIT0
    mov ip, #0x18
    mla r7, r0, ip, r6
    ldr r0, _LIT1
    mla r5, r1, ip, r6
    mla r4, r2, ip, r6
    mla r2, r3, ip, r6
    mla r1, lr, ip, r6
    str r7, [r0]
    str r5, [r0, #0x4]
    str r4, [r0, #0x8]
    str r2, [r0, #0xc]
    str r1, [r0, #0x10]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02102120
_LIT1: .word data_0210210c
