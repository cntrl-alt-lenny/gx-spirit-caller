; func_ov002_021ae7b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd31c
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd524
        .extern data_ov002_022cd73c
        .extern data_ov002_022cd968
        .extern data_ov002_022cdc78
        .extern data_ov002_022ce288
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_0229cd5c
        .global func_ov002_021ae7b8
        .arm
func_ov002_021ae7b8:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    mov r1, #0x1dc0
    bl func_ov002_0229cd5c
    ldr r0, _LIT1
    mov r1, #0x610
    bl func_ov002_0229cd5c
    ldr r0, _LIT2
    ldr r1, _LIT3
    bl func_ov002_0229cd5c
    ldr r0, _LIT4
    mov r1, #0x1c
    bl func_ov002_0229cd5c
    ldr r0, _LIT5
    ldr r1, _LIT6
    bl func_ov002_0229cd5c
    ldr r0, _LIT7
    mov r1, #0x130
    bl func_ov002_0229cd5c
    ldr r0, _LIT8
    mov r1, #0xd8
    bl func_ov002_0229cd5c
    ldr r0, _LIT9
    mov r1, #0x218
    bl func_ov002_0229cd5c
    ldr r0, _LIT10
    mov r1, #0x310
    bl func_ov002_0229cd5c
    ldr r0, _LIT11
    mov r2, #0x7
    ldr r1, [r0, #0x8]
    cmp r1, #0x2
    ldrne r0, [r0, #0xc]
    cmpne r0, #0x2
    ldreq r0, _LIT12
    moveq r1, #0x1
    streq r1, [r0, #0xd0c]
    ldr r1, _LIT12
    ldr r0, _LIT11
    str r2, [r1, #0xcf8]
    mov r1, #0x0
    str r1, [r0, #0x224]
    str r1, [r0, #0x228]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word data_ov002_022cdc78
_LIT2: .word data_ov002_022ce950
_LIT3: .word 0x0000081c
_LIT4: .word data_ov002_022cd300
_LIT5: .word data_ov002_022ce288
_LIT6: .word 0x000006c8
_LIT7: .word data_ov002_022cd3f4
_LIT8: .word data_ov002_022cd31c
_LIT9: .word data_ov002_022cd524
_LIT10: .word data_ov002_022cd968
_LIT11: .word data_ov002_022cd73c
_LIT12: .word data_ov002_022d016c
