; func_ov002_0229a6d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Task_InvokeLocked
        .extern data_02103fcc
        .extern data_02104c04
        .extern data_ov002_022cd65c
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d0f34
        .extern data_ov002_022d10dc
        .extern data_ov002_022d1320
        .extern data_ov002_022d1330
        .extern data_ov002_022d1968
        .extern data_ov002_022d19bc
        .extern data_ov002_022d1a04
        .extern data_ov002_022d1a18
        .extern data_ov002_022d1a84
        .extern data_ov002_022d1a9c
        .extern data_ov002_022d281c
        .extern func_02006bf0
        .extern func_02011b58
        .extern func_0203737c
        .extern func_0208e2f4
        .extern func_ov002_021ae7bc
        .extern func_ov002_021ae978
        .extern func_ov002_021ae99c
        .extern func_ov002_02299c24
        .extern func_ov002_0229a304
        .extern func_ov002_0229cf8c
        .extern func_ov002_0229f46c
        .extern func_ov002_022a36b4
        .extern func_ov002_022a567c
        .extern func_ov002_022a5bec
        .extern func_ov002_022aa67c
        .extern func_ov002_022aab84
        .extern func_ov002_022ae678
        .extern func_ov002_022afea8
        .extern func_ov002_022b2e78
        .extern func_ov002_022b51b4
        .extern func_ov002_022b5480
        .extern func_ov002_022bda08
        .global func_ov002_0229a6d8
        .arm
func_ov002_0229a6d8:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x22c
    bl Copy32
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd0]
    ldr r2, [r0, #0xd4]
    ldr r1, _LIT2
    cmp r2, #0x4
    movlt r2, #0x4
    ldr r0, _LIT3
    str r2, [r1, #0xd4]
    bl func_ov002_022b51b4
    ldr r0, _LIT4
    bl func_ov002_022b5480
    ldr r0, _LIT5
    bl func_ov002_022bda08
    ldr r0, _LIT6
    bl func_ov002_022b2e78
    ldr r2, _LIT7
    ldr r1, _LIT6
    ldr r3, [r2, #0xbbc]
    ldr r0, _LIT8
    str r3, [r1, #0x2c]
    ldr r2, [r2, #0xbc0]
    str r2, [r1, #0x30]
    bl func_ov002_0229cf8c
    ldr r0, _LIT9
    bl func_ov002_022a36b4
    ldr r0, _LIT10
    bl func_ov002_022a5bec
    ldr r0, _LIT11
    bl func_ov002_022afea8
    ldr r0, _LIT12
    bl func_ov002_022aab84
    ldr r0, _LIT13
    bl func_ov002_022ae678
    ldr r0, _LIT14
    bl func_ov002_0229f46c
    mov r0, #0x0
    bl func_ov002_0229a304
    ldr r0, _LIT7
    ldr r1, [r0, #0xb88]
    cmp r1, #0x3
    bne .L_e4
    ldr r0, [r0, #0xb8c]
    bl func_02011b58
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    bl func_ov002_021ae99c
    mov r0, r4
    bl Task_InvokeLocked
    b .L_f8
.L_e4:
    cmp r1, #0x2
    bne .L_f4
    bl func_ov002_021ae978
    b .L_f8
.L_f4:
    bl func_ov002_021ae7bc
.L_f8:
    mov r1, #0x3f
    ldr r0, _LIT15
    sub r2, r1, #0x4f
    bl func_0208e2f4
    mov r1, #0x3f
    ldr r0, _LIT16
    sub r2, r1, #0x4f
    bl func_0208e2f4
    ldr r0, _LIT10
    bl func_ov002_022aa67c
    ldr r0, _LIT9
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_022a567c
    bl func_ov002_02299c24
    ldr r2, _LIT2
    mov r1, #0x1
    str r0, [r2, #0xd8]
    mov r2, #0x0
    sub r3, r2, #0x1
    bl func_0203737c
    mov r2, #0x0
    ldr r1, _LIT7
    mov r0, #0x1
    str r2, [r1, #0x2c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104c04
_LIT1: .word data_ov002_022cd65c
_LIT2: .word data_ov002_022d0e4c
_LIT3: .word data_ov002_022d1a84
_LIT4: .word data_ov002_022d1a9c
_LIT5: .word data_ov002_022d281c
_LIT6: .word data_ov002_022d1a18
_LIT7: .word data_02103fcc
_LIT8: .word data_ov002_022d0f34
_LIT9: .word data_ov002_022d1320
_LIT10: .word data_ov002_022d1330
_LIT11: .word data_ov002_022d1a04
_LIT12: .word data_ov002_022d1968
_LIT13: .word data_ov002_022d19bc
_LIT14: .word data_ov002_022d10dc
_LIT15: .word 0x04000050
_LIT16: .word 0x04001050
