; func_02054f44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc04
        .extern data_0219e4cc
        .extern data_0219e4d4
        .extern data_0219e4e4
        .extern data_0219e4f8
        .extern func_0206e174
        .extern func_0206e670
        .global func_02054f44
        .arm
func_02054f44:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    ldr r1, _LIT1
    ldr lr, _LIT2
    ldr r2, _LIT3
    mov ip, #0x2
    mov r3, #0x0
    ldr r0, _LIT4
    str r4, [r1]
    str lr, [r1, #0x4]
    strh ip, [r1, #0x8]
    strh r3, [r1, #0xa]
    str r2, [r1, #0xc]
    str r3, [r0]
    bl func_0206e174
    ldr r1, _LIT4
    bl func_0206e670
    ldr r2, _LIT4
    ldr r0, [r2]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT3
    mov r3, #0x0
    ldr r0, _LIT1
    mov ip, #0x4
    str r2, [r1]
    strh ip, [r0, #0xa]
    str r3, [r1, #0x4]
    ldmia sp!, {r4, pc}
_LIT0: .word data_020ffc04
_LIT1: .word data_0219e4d4
_LIT2: .word data_0219e4cc
_LIT3: .word data_0219e4f8
_LIT4: .word data_0219e4e4
