; func_ov002_0229ab6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_021040ac
        .extern data_02104ce4
        .extern data_021067fc
        .extern data_02106804
        .extern data_ov002_022cd73c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0f2c
        .extern func_02001ba4
        .extern func_020057dc
        .extern func_02005800
        .extern func_02006918
        .extern func_0200ad90
        .extern func_0201261c
        .extern func_020139fc
        .extern func_020210b8
        .extern func_0202af40
        .extern func_0202c4b4
        .extern func_02036590
        .extern func_0208c884
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208e2f4
        .extern func_02094504
        .global func_ov002_0229ab6c
        .arm
func_ov002_0229ab6c:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x4]
    add r1, r1, #0x1
    str r1, [r0, #0x4]
    cmp r1, #0x10
    bcs .L_44
    ldr r0, _LIT1
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r1, _LIT0
    ldr r0, _LIT2
    ldr r1, [r1, #0x4]
    rsb r1, r1, #0x0
    bl func_0208c884
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_44:
    mov r3, #0x4000000
    ldr r0, [r3]
    add r2, r3, #0x1000
    bic r0, r0, #0xe000
    str r0, [r3]
    ldr r1, [r2]
    mov r0, #0x0
    bic r1, r1, #0xe000
    str r1, [r2]
    ldr r1, [r3]
    bic r1, r1, #0x1f00
    str r1, [r3]
    ldr r1, [r2]
    bic r1, r1, #0x1f00
    str r1, [r2]
    bl func_02005800
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT3
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    bl func_020210b8
    bl func_0200ad90
    bl func_0202c4b4
    bl func_0202af40
    bl func_02001ba4
    bl func_02006918
    ldr r0, _LIT4
    ldr r1, _LIT5
    mov r2, #0x22c
    bl Copy32
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl func_0208c8cc
    mov r0, #0x0
    bl func_0208c8b0
    mov r1, #0x0
    ldr r2, _LIT6
    ldr r0, _LIT7
    str r1, [r2]
    str r1, [r2, #0x4]
    str r1, [r2, #0x8]
    str r1, [r0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    ldr r0, _LIT8
    bl func_02036590
    mov r0, #0x8f00000
    mov r1, #0x0
    bl func_02036590
    ldr r0, _LIT9
    mov r1, #0x3f
    sub r2, r1, #0x4f
    bl func_0208e2f4
    mov r1, #0x3f
    ldr r0, _LIT10
    sub r2, r1, #0x4f
    bl func_0208e2f4
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_0208c884
    ldr r0, _LIT2
    mov r1, #0x0
    bl func_0208c884
    ldr r0, _LIT11
    ldr r1, [r0, #0xb88]
    cmp r1, #0x3
    bne .L_1a4
    ldr ip, [r0, #0xb8c]
    ldr r2, _LIT12
    mov r3, ip, lsr #0x5
    ldr r1, [r2, r3, lsl #0x2]
    and ip, ip, #0x1f
    mov lr, #0x1
    orr r1, r1, lr, lsl ip
    str r1, [r2, r3, lsl #0x2]
    ldr r0, [r0, #0xb9c]
    cmp r0, #0x1
    bne .L_1a4
    ldr r1, _LIT13
    ldr r0, [r1, r3, lsl #0x2]
    orr r0, r0, lr, lsl ip
    str r0, [r1, r3, lsl #0x2]
.L_1a4:
    ldr r0, _LIT14
    ldr r1, [r0, #0xd0c]
    cmp r1, #0x0
    bne .L_1cc
    ldr r1, [r0, #0xd04]
    cmp r1, #0x3
    beq .L_1cc
    ldr r0, [r0, #0xcf0]
    mov r0, r0, lsl #0x1
    bl func_020139fc
.L_1cc:
    ldr r0, _LIT15
    bl func_020057dc
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0f2c
_LIT1: .word 0x0400006c
_LIT2: .word 0x0400106c
_LIT3: .word 0x05000400
_LIT4: .word data_ov002_022cd73c
_LIT5: .word data_02104ce4
_LIT6: .word 0x04000014
_LIT7: .word 0x04001010
_LIT8: .word 0x08f00001
_LIT9: .word 0x04000050
_LIT10: .word 0x04001050
_LIT11: .word data_021040ac
_LIT12: .word data_021067fc
_LIT13: .word data_02106804
_LIT14: .word data_ov002_022d016c
_LIT15: .word func_0201261c
