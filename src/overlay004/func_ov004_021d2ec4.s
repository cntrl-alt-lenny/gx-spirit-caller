; func_ov004_021d2ec4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov004_0220b500
        .extern data_ov004_0220e500
        .extern data_ov004_022915e8
        .extern func_0201cd1c
        .extern func_0201cfa0
        .extern func_0201cfe0
        .extern func_0201d34c
        .extern func_02021c0c
        .extern func_0202c028
        .extern func_0202c0c0
        .extern func_020822f0
        .extern func_02084fe0
        .extern func_ov004_021c9dd4
        .extern func_ov004_021d0168
        .extern func_ov004_021d02f4
        .extern func_ov004_021d0530
        .extern func_ov004_021d05f4
        .extern func_ov004_021d0e98
        .extern func_ov004_021d1360
        .extern func_ov004_021d13dc
        .extern func_ov004_021d1448
        .extern func_ov004_021d1b08
        .extern func_ov004_021d2628
        .extern func_ov004_021d2aac
        .extern func_ov004_021d2c40
        .extern func_ov004_021d8798
        .extern func_ov004_021d8cd0
        .extern func_ov004_021d8d58
        .extern func_ov004_021d9134
        .global func_ov004_021d2ec4
        .arm
func_ov004_021d2ec4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x34
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r4, _LIT1
    str r1, [r0, #0xc88]
    str r1, [r4, #0xa0]
    str r1, [r4, #0x9c]
    mov r1, #0x0
    str r1, [r0, #0xc8c]
    bl func_0201cfa0
    cmp r0, #0x0
    bne .L_94c
    ldr r0, _LIT2
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r4, #0x48]
    str r1, [r4, #0x54]
    str r1, [r4, #0x58]
    str r1, [r4, #0x8c]
    cmp r0, #0x0
    movne r1, #0x1
    cmp r1, #0x0
    beq .L_904
    ldr r0, _LIT2
    bl func_ov004_021d8cd0
.L_904:
    ldr r0, _LIT1
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_d08
    ldr r0, _LIT2
    bl func_ov004_021d8d58
    bl func_ov004_021d02f4
    bl func_02021c0c
    bl func_ov004_021d2628
    ldr r0, _LIT2
    bl func_ov004_021d9134
    bl func_020822f0
    bl func_02084fe0
    ldr r1, _LIT3
    mov r0, #0x0
    str r0, [r1]
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
.L_94c:
    mov r0, r4
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_bc4
    bl func_ov004_021d2c40
    cmp r0, #0x0
    bne .L_b8c
    bl func_0201d34c
    cmp r0, #0x0
    bne .L_b8c
    ldr r0, [r4, #0x54]
    sub r0, r0, #0xe
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_b8c
    b .L_998
    b .L_9f4
    b .L_ab4
    b .L_b28
.L_998:
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc6c]
    cmp r1, #0x0
    addne r1, r1, #0x1
    strne r1, [r0, #0xc6c]
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc70]
    cmp r1, #0x0
    addne r1, r1, #0x1
    strne r1, [r0, #0xc70]
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc6c]
    cmp r1, #0x1e
    ldrgt r1, [r0, #0xc70]
    cmpgt r1, #0x1e
    ble .L_b8c
    ldr r1, [r4, #0x54]
    mov r2, #0x0
    add r1, r1, #0x1
    str r2, [r0, #0xc78]
    str r2, [r0, #0xc74]
    str r1, [r4, #0x54]
    b .L_b8c
.L_9f4:
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_b8c
    ldr r0, _LIT2
    ldr r0, [r0, #0x8]
    rsbs r0, r0, #0x1
    beq .L_a8c
    add r0, r4, #0x3000
    ldr r0, [r0, #0xc68]
    add r0, r4, r0, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc3c]
    bl func_0202c028
    rsb r3, r0, r0, lsl #0x3
    ldr r1, _LIT4
    ldr r2, _LIT5
    smull r0, r4, r1, r3
    mov r0, r3, lsr #0x1f
    ldr r1, [r2, #0xa60]
    add r4, r0, r4, asr #0x2
    cmp r4, r1
    bhi .L_a64
    bl func_ov004_021d1360
    b .L_b8c
.L_a64:
    ldr r0, _LIT6
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT2
    mov r2, #0x1
    bl func_ov004_021d8798
    bl func_ov004_021d13dc
    mov r0, #0x0
    bl func_ov004_021d0168
    b .L_b8c
.L_a8c:
    ldr r0, _LIT6
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT2
    mov r2, #0x1
    bl func_ov004_021d8798
    bl func_ov004_021d13dc
    mov r0, #0x0
    bl func_ov004_021d0168
    b .L_b8c
.L_ab4:
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc74]
    cmp r1, #0x0
    addne r1, r1, #0x1
    strne r1, [r0, #0xc74]
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc78]
    cmp r1, #0x0
    addne r1, r1, #0x1
    strne r1, [r0, #0xc78]
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc74]
    cmp r1, #0x0
    beq .L_b8c
    ldr r4, [r0, #0xc78]
    cmp r1, r4
    movle r4, r1
    bl func_0201cfe0
    cmp r0, #0x0
    beq .L_b8c
    cmp r4, #0xc0
    bne .L_b8c
    mov r3, #0x10
    add r1, sp, #0x0
    mov r0, #0x6
    mov r2, #0x2
    strh r3, [sp]
    bl func_0201cd1c
    b .L_b8c
.L_b28:
    add r0, r4, #0x3000
    ldr r3, [r0, #0xc0c]
    cmp r3, #0x0
    beq .L_b84
    mov r0, #0xc
    strh r0, [sp, #0x1a]
    strh r3, [sp, #0x1c]
    cmp r3, #0x0
    mov ip, #0x0
    ble .L_b74
    add r1, sp, #0x1a
.L_b54:
    add r0, r4, ip, lsl #0x2
    add r0, r0, #0x3000
    ldr r2, [r0, #0xc14]
    add r0, r1, ip, lsl #0x1
    add ip, ip, #0x1
    strh r2, [r0, #0x4]
    cmp ip, r3
    blt .L_b54
.L_b74:
    add r1, sp, #0x1a
    mov r0, #0x6
    mov r2, #0x18
    bl func_0201cd1c
.L_b84:
    mov r0, #0xe
    str r0, [r4, #0x54]
.L_b8c:
    ldr r0, _LIT2
    bl func_ov004_021d8d58
    bl func_ov004_021d02f4
    bl func_02021c0c
    bl func_ov004_021d2628
    ldr r0, _LIT2
    bl func_ov004_021d9134
    bl func_020822f0
    bl func_02084fe0
    ldr r1, _LIT3
    mov r0, #0x0
    str r0, [r1]
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
.L_bc4:
    bl func_ov004_021d2aac
    cmp r0, #0x0
    bne .L_d08
    bl func_0201d34c
    cmp r0, #0x0
    bne .L_d08
    ldr r0, [r4, #0x54]
    cmp r0, #0xe
    beq .L_bfc
    cmp r0, #0xf
    beq .L_c74
    cmp r0, #0x11
    beq .L_ca4
    b .L_d08
.L_bfc:
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc6c]
    cmp r1, #0x0
    addne r1, r1, #0x1
    strne r1, [r0, #0xc6c]
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc70]
    cmp r1, #0x0
    addne r1, r1, #0x1
    strne r1, [r0, #0xc70]
    bl func_ov004_021d1448
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc6c]
    cmp r1, #0x1e
    ldrgt r0, [r0, #0xc70]
    cmpgt r0, #0x1e
    ble .L_d08
    mov r0, #0x1
    bl func_ov004_021d0e98
    ldr r2, [r4, #0x54]
    add r1, r4, #0x3000
    mov r0, #0x0
    add r2, r2, #0x1
    str r0, [r1, #0xc78]
    str r0, [r1, #0xc74]
    str r2, [r4, #0x54]
    bl func_ov004_021d05f4
    ldr r0, _LIT7
    bl func_ov004_021d0530
    b .L_d08
.L_c74:
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc74]
    cmp r1, #0x0
    addne r1, r1, #0x1
    strne r1, [r0, #0xc74]
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc78]
    cmp r1, #0x0
    addne r1, r1, #0x1
    strne r1, [r0, #0xc78]
    bl func_ov004_021d1448
    b .L_d08
.L_ca4:
    add r0, r4, #0x3000
    ldr r3, [r0, #0xc0c]
    cmp r3, #0x0
    beq .L_d00
    mov r0, #0xc
    strh r0, [sp, #0x2]
    strh r3, [sp, #0x4]
    cmp r3, #0x0
    mov ip, #0x0
    ble .L_cf0
    add r1, sp, #0x2
.L_cd0:
    add r0, r4, ip, lsl #0x2
    add r0, r0, #0x3000
    ldr r2, [r0, #0xc14]
    add r0, r1, ip, lsl #0x1
    add ip, ip, #0x1
    strh r2, [r0, #0x4]
    cmp ip, r3
    blt .L_cd0
.L_cf0:
    add r1, sp, #0x2
    mov r0, #0x6
    mov r2, #0x18
    bl func_0201cd1c
.L_d00:
    mov r0, #0xe
    str r0, [r4, #0x54]
.L_d08:
    bl func_ov004_021d1b08
    add r1, r4, #0xef0
    ldr r0, _LIT8
    ldr r3, _LIT9
    add r1, r1, #0x5000
    mov r2, #0x4
    bl func_ov004_021c9dd4
    bl func_020822f0
    bl func_02084fe0
    ldr r1, _LIT3
    mov r0, #0x0
    str r0, [r1]
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_0220e500
_LIT1: .word data_ov004_0220b500
_LIT2: .word data_ov004_022915e8
_LIT3: .word 0x04000540
_LIT4: .word 0x66666667
_LIT5: .word data_02104f4c
_LIT6: .word 0x00000101
_LIT7: .word 0x000003c3
_LIT8: .word 0x05000638
_LIT9: .word 0x00600100
