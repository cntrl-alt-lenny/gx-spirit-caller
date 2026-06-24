; func_02054ed0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb24
        .extern data_0219e3ec
        .extern data_0219e3f4
        .extern data_0219e404
        .extern data_0219e418
        .extern func_0206e100
        .extern func_0206e5fc
        .global func_02054ed0
        .arm
func_02054ed0:
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
    bl func_0206e100
    ldr r1, _LIT4
    bl func_0206e5fc
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
_LIT0: .word data_020ffb24
_LIT1: .word data_0219e3f4
_LIT2: .word data_0219e3ec
_LIT3: .word data_0219e418
_LIT4: .word data_0219e404
