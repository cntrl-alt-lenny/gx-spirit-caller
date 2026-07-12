; func_ov008_021ad44c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02104e6c
        .extern data_ov008_021b2660
        .extern data_ov008_021b267c
        .extern data_ov008_021b2b60
        .extern data_ov008_021b2ca0
        .extern data_ov008_021b2ca8
        .extern func_02006160
        .extern func_02006178
        .extern func_020371b8
        .extern func_ov008_021ac128
        .extern func_ov008_021ac3f0
        .extern func_ov008_021acdcc
        .extern func_ov008_021ace98
        .extern func_ov008_021acef4
        .global func_ov008_021ad44c
        .arm
func_ov008_021ad44c:
    stmdb sp!, {r3, lr}
    bl func_02006160
    cmp r0, #0x0
    beq .L_674
    ldr r0, _LIT0
    ldrh r1, [r0, #0x4]
    ldrh r2, [r0, #0x6]
    mov r0, r1, lsl #0x10
    mov r1, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x18
    add r0, r0, r1, lsr #0x18
    cmp r0, r2, lsr #0x18
    mov r2, r2, lsr #0x18
    bne .L_5dc
    mov r0, #0x34
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r2, #0x0
    ldrh r0, [r0, r1]
    mov r3, #0x1
    cmp r0, #0x0
    beq .L_5c8
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_5c8:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_5dc:
    ldr r0, _LIT2
    ldr r1, [r0, #0x55c]
    cmp r1, #0x0
    beq .L_608
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x2
    ldmia sp!, {r3, pc}
.L_608:
    ldr r0, [r0, #0x560]
    cmp r0, #0x0
    beq .L_9cc
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r1, [r1, #0xa60]
    ldr r0, [r0, #0x18]
    cmp r0, r1
    bls .L_648
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x4
    ldmia sp!, {r3, pc}
.L_648:
    cmp r0, #0x0
    ble .L_9cc
    cmp r0, r1
    bhi .L_9cc
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x3
    ldmia sp!, {r3, pc}
.L_674:
    bl func_02006178
    cmp r0, #0x0
    beq .L_688
    bl func_ov008_021acef4
    b .L_9cc
.L_688:
    ldr r0, _LIT5
    ldrh r1, [r0, #0x56]
    tst r1, #0x10
    beq .L_74c
    ldr r0, _LIT6
    ldr ip, _LIT0
    ldrh r3, [r0, #0x5a]
    ldrh r2, [ip, #0x4]
    cmp r3, #0x6
    movhi r1, #0x5
    subls r1, r3, #0x1
    mov r0, r2, lsl #0x10
    cmp r1, r0, lsr #0x18
    mov r0, r0, lsr #0x18
    ble .L_6f8
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x38
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr lr, r2, r1, lsr #0x10
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    strh lr, [ip, #0x4]
    bl func_020371b8
    b .L_9cc
.L_6f8:
    mov r1, r2, lsl #0x18
    sub r0, r3, #0x6
    cmp r0, r1, lsr #0x18
    mov r0, r1, lsr #0x18
    ble .L_9cc
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r2, r2, r1
    mov r1, r0
    strh r2, [ip, #0x4]
    bl func_ov008_021ac3f0
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9cc
.L_74c:
    tst r1, #0x20
    beq .L_7f0
    ldr ip, _LIT0
    ldrh r2, [ip, #0x4]
    mov r0, r2, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_7a0
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x38
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr lr, r2, r1, lsr #0x10
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    strh lr, [ip, #0x4]
    bl func_020371b8
    b .L_9cc
.L_7a0:
    mov r0, r2, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_9cc
    add r0, r0, #0xff
    add r0, r0, #0xff00
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r2, #0xff
    and r0, r0, #0xff
    orr r2, r1, r0
    mov r0, #0x1
    mov r1, #0x0
    strh r2, [ip, #0x4]
    bl func_ov008_021ac3f0
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9cc
.L_7f0:
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_880
    ldr r2, _LIT0
    mov r1, #0x34
    ldrh ip, [r2, #0x4]
    ldrh lr, [r2, #0x6]
    ldr r3, _LIT1
    mov r0, ip, lsl #0x10
    mov ip, ip, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, ip, lsr #0x18
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic ip, lr, #0xff
    and r0, r0, #0xff
    orr r0, ip, r0
    strh r0, [r2, #0x6]
    ldrh r0, [r2, #0x6]
    mov r2, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    mul r1, r0, r1
    ldrh r0, [r3, r1]
    mov r3, #0x1
    cmp r0, #0x0
    beq .L_870
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_870:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    b .L_9cc
.L_880:
    tst r0, #0x2
    beq .L_8a4
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x2
    ldmia sp!, {r3, pc}
.L_8a4:
    tst r0, #0x200
    beq .L_910
    ldr r1, _LIT0
    mov r0, #0x34
    ldrh r3, [r1, #0x4]
    ldr r1, _LIT1
    mov r2, r3, lsl #0x10
    mov r3, r3, lsl #0x18
    mov r2, r2, lsr #0x18
    add r2, r2, r3, lsr #0x18
    mul r0, r2, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_8f8
    bl func_ov008_021acdcc
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9cc
.L_8f8:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9cc
.L_910:
    tst r0, #0x100
    beq .L_964
    ldr r1, _LIT0
    mov r0, #0x34
    ldrh r3, [r1, #0x4]
    ldr r1, _LIT1
    mov r2, r3, lsl #0x10
    mov r3, r3, lsl #0x18
    mov r2, r2, lsr #0x18
    add r2, r2, r3, lsr #0x18
    mul r0, r2, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_94c
    bl func_ov008_021ace98
.L_94c:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_9cc
.L_964:
    tst r0, #0x400
    beq .L_9cc
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r1, [r1, #0xa60]
    ldr r0, [r0, #0x18]
    cmp r0, r1
    bls .L_9a0
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x4
    ldmia sp!, {r3, pc}
.L_9a0:
    cmp r0, #0x0
    ble .L_9cc
    cmp r0, r1
    bhi .L_9cc
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x3
    ldmia sp!, {r3, pc}
.L_9cc:
    bl func_ov008_021ac128
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b2ca0
_LIT1: .word data_ov008_021b267c
_LIT2: .word data_ov008_021b2660
_LIT3: .word data_02104e6c
_LIT4: .word data_ov008_021b2ca8
_LIT5: .word data_02104acc
_LIT6: .word data_ov008_021b2b60
