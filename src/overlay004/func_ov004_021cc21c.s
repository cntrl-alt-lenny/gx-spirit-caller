; func_ov004_021cc21c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104c7a
        .extern data_ov004_0220b500
        .extern data_ov004_0220e500
        .extern func_02020d00
        .extern func_02037208
        .extern func_020aadf8
        .extern func_ov004_021cc0e0
        .global func_ov004_021cc21c
        .arm
func_ov004_021cc21c:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x20
    mov r0, #0x1
    bl func_ov004_021cc0e0
    ldr r0, _LIT0
    mov r1, #0x3
    str r1, [sp]
    add r0, r0, #0xb00
    ldrsb r2, [r0, #0xcc]
    ldr r1, _LIT1
    add r0, sp, #0x9
    strb r2, [sp, #0x8]
    bl func_020aadf8
    add r0, sp, #0x0
    mov r1, #0x0
    bl func_02020d00
    ldr r2, _LIT2
    mov r3, #0x1
    str r3, [r2, #0x48]
    ldr ip, [r2, #0x54]
    ldr r1, _LIT3
    add ip, ip, #0x1
    str ip, [r2, #0x54]
    mov r0, #0x3a
    str r3, [r1, #0xcd0]
    sub r1, r0, #0x3b
    mov r2, #0x0
    bl func_02037208
    add sp, sp, #0x20
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_02104c7a
_LIT2: .word data_ov004_0220b500
_LIT3: .word data_ov004_0220e500
