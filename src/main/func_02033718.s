; func_02033718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020329dc
        .extern func_02032ac4
        .extern func_02046f24
        .global func_02033718
        .arm
func_02033718:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    mov r3, r0
    ldr ip, [r3, #0xeb4]
    mov r0, r1
    bic lr, ip, #0x2000
    bic ip, lr, #0x1000
    bic r1, ip, #0x4000
    bic ip, r1, #0x10000
    mov r1, r2
    str ip, [r3, #0xeb4]
    bic ip, ip, #0x40000
    ldr r2, _LIT0
    str ip, [r3, #0xeb4]
    str r2, [sp]
    ldr r2, _LIT1
    str r3, [sp, #0x4]
    bl func_02046f24
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word func_020329dc
_LIT1: .word func_02032ac4
