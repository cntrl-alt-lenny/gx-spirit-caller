; func_02000d4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02105904
        .global func_02000d4c
        .arm
func_02000d4c:
    stmdb sp!, {r3, lr}
    ldr lr, _LIT0
    ldr r0, [lr, #0x80]
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, pc}
    sub ip, r0, #0x1
    add r2, lr, ip, lsl #0x4
    ldr r3, [r2, #0x4]
    ldr r1, _LIT1
    ldr r0, [r2, #0x8]
    ldr r2, [r2, #0xc]
    str r3, [r1, #0x3c]
    str ip, [lr, #0x80]
    str r0, [r1, #0x40]
    ldr r0, [lr, ip, lsl #0x4]
    str r2, [r1, #0x44]
    ldmia sp!, {r3, pc}
_LIT0: .word data_02105904
_LIT1: .word data_021040ac
