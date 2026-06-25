; func_0206ba78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebf8
        .extern data_0219ec04
        .extern data_0219ee08
        .extern data_0219ee18
        .extern data_0219ee3c
        .extern data_0219ee54
        .global func_0206ba78
        .arm
func_0206ba78:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr lr, [r1]
    ldr r3, [r0]
    ldr ip, [lr, #0x4]
    ldr r2, _LIT2
    ldr r1, _LIT3
    str ip, [r2]
    ldr ip, [lr, #0x8]
    ldr r2, _LIT4
    str ip, [r1]
    ldr ip, [lr, #0xc]
    ldr r1, _LIT5
    str ip, [r2]
    ldr ip, [lr, #0x10]
    orr r2, r3, #0x2
    str ip, [r1]
    ldr r3, [lr, #0x14]
    str r3, [r1, #0x4]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ebf8
_LIT1: .word data_0219ec04
_LIT2: .word data_0219ee3c
_LIT3: .word data_0219ee08
_LIT4: .word data_0219ee18
_LIT5: .word data_0219ee54
