; func_ov004_021d1308 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220e500
        .extern data_ov004_0220f168
        .extern func_0201cd1c
        .extern func_02037208
        .global func_ov004_021d1308
        .arm
func_ov004_021d1308:
    stmdb sp!, {r3, lr}
    mov r1, #0xe
    strh r1, [sp]
    ldr r0, _LIT0
    ldr ip, _LIT1
    ldr r3, [r0, #0xc80]
    add r1, sp, #0x0
    mov r0, #0x6
    mov r2, #0x4
    str r3, [ip]
    strh r3, [sp, #0x2]
    bl func_0201cd1c
    mov r0, #0x3a
    ldr ip, _LIT0
    mov r3, #0x1
    sub r1, r0, #0x3b
    mov r2, #0x0
    str r3, [ip, #0xc6c]
    bl func_02037208
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov004_0220e500
_LIT1: .word data_ov004_0220f168
