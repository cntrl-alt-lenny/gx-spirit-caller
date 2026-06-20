; func_ov002_0229a7e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Task_InvokeLocked
        .extern data_021040ac
        .extern data_02104ce4
        .extern data_ov002_022cd73c
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1014
        .extern data_ov002_022d11bc
        .extern data_ov002_022d1400
        .extern data_ov002_022d1410
        .extern data_ov002_022d1a48
        .extern data_ov002_022d1a9c
        .extern data_ov002_022d1ae4
        .extern data_ov002_022d1af8
        .extern data_ov002_022d1b64
        .extern data_ov002_022d1b7c
        .extern data_ov002_022d28fc
        .extern func_02006c0c
        .extern func_02011b8c
        .extern func_020373cc
        .extern func_0208e2f4
        .extern func_ov002_021ae89c
        .extern func_ov002_021aea58
        .extern func_ov002_021aea7c
        .extern func_ov002_02299d34
        .extern func_ov002_0229a414
        .extern func_ov002_0229d09c
        .extern func_ov002_0229f57c
        .extern func_ov002_022a37c4
        .extern func_ov002_022a57b8
        .extern func_ov002_022a5d28
        .extern func_ov002_022aa7b8
        .extern func_ov002_022aacc0
        .extern func_ov002_022ae7b4
        .extern func_ov002_022affe4
        .extern func_ov002_022b2fbc
        .extern func_ov002_022b52c4
        .extern func_ov002_022b5590
        .extern func_ov002_022bdb18
        .global func_ov002_0229a7e8
        .arm
func_ov002_0229a7e8:
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
    bl func_ov002_022b52c4
    ldr r0, _LIT4
    bl func_ov002_022b5590
    ldr r0, _LIT5
    bl func_ov002_022bdb18
    ldr r0, _LIT6
    bl func_ov002_022b2fbc
    ldr r2, _LIT7
    ldr r1, _LIT6
    ldr r3, [r2, #0xbbc]
    ldr r0, _LIT8
    str r3, [r1, #0x2c]
    ldr r2, [r2, #0xbc0]
    str r2, [r1, #0x30]
    bl func_ov002_0229d09c
    ldr r0, _LIT9
    bl func_ov002_022a37c4
    ldr r0, _LIT10
    bl func_ov002_022a5d28
    ldr r0, _LIT11
    bl func_ov002_022affe4
    ldr r0, _LIT12
    bl func_ov002_022aacc0
    ldr r0, _LIT13
    bl func_ov002_022ae7b4
    ldr r0, _LIT14
    bl func_ov002_0229f57c
    mov r0, #0x0
    bl func_ov002_0229a414
    ldr r0, _LIT7
    ldr r1, [r0, #0xb88]
    cmp r1, #0x3
    bne .L_e4
    ldr r0, [r0, #0xb8c]
    bl func_02011b8c
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    bl func_ov002_021aea7c
    mov r0, r4
    bl Task_InvokeLocked
    b .L_f8
.L_e4:
    cmp r1, #0x2
    bne .L_f4
    bl func_ov002_021aea58
    b .L_f8
.L_f4:
    bl func_ov002_021ae89c
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
    bl func_ov002_022aa7b8
    ldr r0, _LIT9
    mov r1, #0x1
    mov r2, #0x0
    bl func_ov002_022a57b8
    bl func_ov002_02299d34
    ldr r2, _LIT2
    mov r1, #0x1
    str r0, [r2, #0xd8]
    mov r2, #0x0
    sub r3, r2, #0x1
    bl func_020373cc
    mov r2, #0x0
    ldr r1, _LIT7
    mov r0, #0x1
    str r2, [r1, #0x2c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104ce4
_LIT1: .word data_ov002_022cd73c
_LIT2: .word data_ov002_022d0f2c
_LIT3: .word data_ov002_022d1b64
_LIT4: .word data_ov002_022d1b7c
_LIT5: .word data_ov002_022d28fc
_LIT6: .word data_ov002_022d1af8
_LIT7: .word data_021040ac
_LIT8: .word data_ov002_022d1014
_LIT9: .word data_ov002_022d1400
_LIT10: .word data_ov002_022d1410
_LIT11: .word data_ov002_022d1ae4
_LIT12: .word data_ov002_022d1a48
_LIT13: .word data_ov002_022d1a9c
_LIT14: .word data_ov002_022d11bc
_LIT15: .word 0x04000050
_LIT16: .word 0x04001050
