; func_ov002_021ae7bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd664
        .extern data_ov002_022cd670
        .extern data_ov002_022cd778
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae6d8
        .extern func_ov002_021b077c
        .extern func_ov002_021ba150
        .extern func_ov002_021ba754
        .extern func_ov002_021d46ac
        .extern func_ov002_0229acd0
        .global func_ov002_021ae7bc
        .arm
func_ov002_021ae7bc:
    stmdb sp!, {r3, lr}
    bl func_ov002_021ae6d8
    ldr r2, _LIT0
    mov r3, #0x1f40
    str r3, [r2]
    ldr r1, _LIT1
    mov r0, #0x0
    str r3, [r2, #0x868]
    bl func_ov002_021ba754
    ldr r1, _LIT2
    mov r0, #0x1
    bl func_ov002_021ba754
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r2, [r1]
    str r2, [r0, #0xce4]
    ldr r0, [r1, #0x10]
    bl func_ov002_021ba150
    ldr r0, _LIT3
    ldr r0, [r0, #0x10]
    rsb r0, r0, #0x1
    bl func_ov002_021ba150
    mov r0, #0xd
    mov r1, #0x0
    ldr r2, _LIT0
    mov r3, r1
    ldr r2, [r2]
    bl func_ov002_0229acd0
    mov r0, #0xd
    mov r1, #0x1
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r2, [r2, #0x868]
    bl func_ov002_0229acd0
    mov r0, #0x14
    mov r1, #0x0
    mov r2, #0xd
    mov r3, r1
    bl func_ov002_0229acd0
    mov r0, #0x14
    mov r1, #0x1
    mov r2, #0xd
    mov r3, #0x0
    bl func_ov002_0229acd0
    mov r0, #0x14
    mov r1, #0x0
    mov r2, #0xc
    mov r3, r1
    bl func_ov002_0229acd0
    mov r0, #0x14
    mov r1, #0x1
    mov r2, #0xc
    mov r3, #0x0
    bl func_ov002_0229acd0
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r3, [r1, #0x10]
    ldr r2, _LIT5
    str r3, [r0, #0xcec]
    str r2, [r0, #0xcf4]
    ldr r1, [r1, #0x8]
    cmp r1, #0x3
    bne .L_108
    mov r0, #0x0
    bl func_ov002_021b077c
    b .L_198
.L_108:
    ldr r0, [r0, #0xd0c]
    cmp r0, #0x0
    beq .L_124
    ldr r0, _LIT6
    ldr r0, [r0, r3, lsl #0x2]
    cmp r0, #0x2
    beq .L_198
.L_124:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x1
    bl func_ov002_021d46ac
    ldr r0, _LIT4
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    mov r3, r1
    cmp r0, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x55
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, #0x5
    bl func_ov002_021d46ac
    ldr r0, _LIT4
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    mov r3, r1
    rsbs r0, r0, #0x1
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x55
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, #0x5
    bl func_ov002_021d46ac
.L_198:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word data_ov002_022cd670
_LIT2: .word data_ov002_022cd778
_LIT3: .word data_ov002_022cd65c
_LIT4: .word data_ov002_022d008c
_LIT5: .word 0x0000ffff
_LIT6: .word data_ov002_022cd664
