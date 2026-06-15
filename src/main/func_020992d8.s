; func_020992d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210268c
        .extern func_02099370
        .extern func_0209956c
        .extern func_020996c8
        .extern func_02099718
        .global func_020992d8
        .arm
func_020992d8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xa0
    ldr lr, _LIT0
    add ip, sp, #0x1c
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    mov r4, ip
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2}
    stmia ip, {r0, r1, r2}
    add lr, sp, #0x38
    add ip, sp, #0x8
    str lr, [sp, #0x24]
    ldr lr, _LIT1
    str ip, [sp, #0x28]
    ldr ip, _LIT2
    str lr, [sp, #0x2c]
    ldr lr, _LIT3
    str ip, [sp, #0x30]
    ldr ip, [sp, #0xb8]
    str lr, [sp, #0x34]
    str ip, [sp]
    mov r3, r5
    mov r0, r8
    mov r1, r7
    mov r2, r6
    str r4, [sp, #0x4]
    bl func_02099718
    add sp, sp, #0xa0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_0210268c
_LIT1: .word func_020996c8
_LIT2: .word func_0209956c
_LIT3: .word func_02099370
