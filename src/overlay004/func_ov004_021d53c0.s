; func_ov004_021d53c0 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104c78
        .extern data_02104c7a
        .extern data_02104cec
        .extern data_02104f4c
        .extern data_02105989
        .extern data_02105a4c
        .extern data_0219b2dc
        .extern data_ov004_0220b500
        .extern data_ov004_0220e500
        .extern func_02012454
        .extern func_02046ac4
        .extern func_02046ae0
        .extern func_020aadf8
        .extern func_ov004_021d3a58
        .extern func_ov004_021d62b8
        .global func_ov004_021d53c0
        .arm
func_ov004_021d53c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r5, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_6a8
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0]
    bl func_02046ac4
    cmp r0, #0x0
    movne r4, #0x1
    moveq r4, #0x0
    ldr r1, _LIT1
    ldr r3, _LIT2
    str r4, [r1, #0xc3c]
    mov ip, #0x0
    str ip, [r3, r4, lsl #0x2]
    rsb r0, r4, #0x1
    mov r2, #0x2
    str r2, [r3, r0, lsl #0x2]
    str ip, [r1, #0xba0]
    ldr r0, _LIT3
    ldr r3, _LIT4
    ldr r2, [r0, #0xc94]
    mov r0, #0x1
    str r2, [r1, #0xb88]
    str r0, [r1, #0xbb0]
    cmp r2, #0x0
    subeq r0, r0, #0x2
    ldrne r0, _LIT5
    ldr r2, _LIT1
    mov r1, #0x0
    str r0, [r2, #0xbb4]
    str r1, [r2, #0xbc4]
    str r1, [r2, #0xbc8]
    str r1, [r2, #0xbbc]
    str r1, [r2, #0xbc0]
    mov ip, #0x2
    mov r0, #0x1a
    str ip, [r2, #0xc48]
    ldr r1, _LIT6
    mla r0, r4, r0, r3
    ldrb r1, [r1, #0xa3c]
    ldr r2, _LIT7
    mov r1, r1, lsl #0x1d
    mov r3, r1, lsr #0x1d
    ldr r1, _LIT8
    strb r3, [r2, r4]
    bl func_020aadf8
    ldr r1, _LIT9
    mov r0, r4
    bl func_02012454
    bl func_02046ac4
    cmp r0, #0x0
    beq .L_6a8
    mov r0, #0x0
    bl func_ov004_021d62b8
.L_6a8:
    bl func_02046ae0
    cmp r0, #0x2
    bge .L_6d0
    mov r0, #0x27
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
.L_6d0:
    ldr r0, _LIT10
    ldr r0, [r0, #0x78]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, #0x25
    mov r2, #0x78
    bl func_ov004_021d3a58
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219b2dc
_LIT1: .word data_021040ac
_LIT2: .word data_02104cec
_LIT3: .word data_ov004_0220e500
_LIT4: .word data_02104c7a
_LIT5: .word 0x00023280
_LIT6: .word data_02104f4c
_LIT7: .word data_02104c78
_LIT8: .word data_02105989
_LIT9: .word data_02105a4c
_LIT10: .word data_ov004_0220b500
