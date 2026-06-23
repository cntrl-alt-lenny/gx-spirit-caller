; func_ov004_021d2de4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220e2a0
        .extern data_ov004_02291388
        .extern func_0201ccc8
        .extern func_0201cf4c
        .extern func_0201cf8c
        .extern func_0201d2f8
        .extern func_02021bb8
        .extern func_0202bfd4
        .extern func_0202c06c
        .extern func_02082208
        .extern func_02084ef8
        .extern func_ov004_021c9cf4
        .extern func_ov004_021d0088
        .extern func_ov004_021d0214
        .extern func_ov004_021d0450
        .extern func_ov004_021d0514
        .extern func_ov004_021d0db8
        .extern func_ov004_021d1280
        .extern func_ov004_021d12fc
        .extern func_ov004_021d1368
        .extern func_ov004_021d1a28
        .extern func_ov004_021d2548
        .extern func_ov004_021d29cc
        .extern func_ov004_021d2b60
        .extern func_ov004_021d86ac
        .extern func_ov004_021d8be4
        .extern func_ov004_021d8c6c
        .extern func_ov004_021d9000
        .global func_ov004_021d2de4
        .arm
func_ov004_021d2de4:
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
    bl func_0201cf4c
    cmp r0, #0x0
    bne .L_b0
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
    beq .L_68
    ldr r0, _LIT2
    bl func_ov004_021d8be4
.L_68:
    ldr r0, _LIT1
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_46c
    ldr r0, _LIT2
    bl func_ov004_021d8c6c
    bl func_ov004_021d0214
    bl func_02021bb8
    bl func_ov004_021d2548
    ldr r0, _LIT2
    bl func_ov004_021d9000
    bl func_02082208
    bl func_02084ef8
    ldr r1, _LIT3
    mov r0, #0x0
    str r0, [r1]
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
.L_b0:
    mov r0, r4
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_328
    bl func_ov004_021d2b60
    cmp r0, #0x0
    bne .L_2f0
    bl func_0201d2f8
    cmp r0, #0x0
    bne .L_2f0
    ldr r0, [r4, #0x54]
    sub r0, r0, #0xe
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_2f0
    b .L_fc
    b .L_158
    b .L_218
    b .L_28c
.L_fc:
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
    ble .L_2f0
    ldr r1, [r4, #0x54]
    mov r2, #0x0
    add r1, r1, #0x1
    str r2, [r0, #0xc78]
    str r2, [r0, #0xc74]
    str r1, [r4, #0x54]
    b .L_2f0
.L_158:
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_2f0
    ldr r0, _LIT2
    ldr r0, [r0, #0x8]
    rsbs r0, r0, #0x1
    beq .L_1f0
    add r0, r4, #0x3000
    ldr r0, [r0, #0xc68]
    add r0, r4, r0, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xc3c]
    bl func_0202bfd4
    rsb r3, r0, r0, lsl #0x3
    ldr r1, _LIT4
    ldr r2, _LIT5
    smull r0, r4, r1, r3
    mov r0, r3, lsr #0x1f
    ldr r1, [r2, #0xa60]
    add r4, r0, r4, asr #0x2
    cmp r4, r1
    bhi .L_1c8
    bl func_ov004_021d1280
    b .L_2f0
.L_1c8:
    ldr r0, _LIT6
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT2
    mov r2, #0x1
    bl func_ov004_021d86ac
    bl func_ov004_021d12fc
    mov r0, #0x0
    bl func_ov004_021d0088
    b .L_2f0
.L_1f0:
    ldr r0, _LIT6
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT2
    mov r2, #0x1
    bl func_ov004_021d86ac
    bl func_ov004_021d12fc
    mov r0, #0x0
    bl func_ov004_021d0088
    b .L_2f0
.L_218:
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
    beq .L_2f0
    ldr r4, [r0, #0xc78]
    cmp r1, r4
    movle r4, r1
    bl func_0201cf8c
    cmp r0, #0x0
    beq .L_2f0
    cmp r4, #0xc0
    bne .L_2f0
    mov r3, #0x10
    add r1, sp, #0x0
    mov r0, #0x6
    mov r2, #0x2
    strh r3, [sp]
    bl func_0201ccc8
    b .L_2f0
.L_28c:
    add r0, r4, #0x3000
    ldr r3, [r0, #0xc0c]
    cmp r3, #0x0
    beq .L_2e8
    mov r0, #0xc
    strh r0, [sp, #0x1a]
    strh r3, [sp, #0x1c]
    cmp r3, #0x0
    mov ip, #0x0
    ble .L_2d8
    add r1, sp, #0x1a
.L_2b8:
    add r0, r4, ip, lsl #0x2
    add r0, r0, #0x3000
    ldr r2, [r0, #0xc14]
    add r0, r1, ip, lsl #0x1
    add ip, ip, #0x1
    strh r2, [r0, #0x4]
    cmp ip, r3
    blt .L_2b8
.L_2d8:
    add r1, sp, #0x1a
    mov r0, #0x6
    mov r2, #0x18
    bl func_0201ccc8
.L_2e8:
    mov r0, #0xe
    str r0, [r4, #0x54]
.L_2f0:
    ldr r0, _LIT2
    bl func_ov004_021d8c6c
    bl func_ov004_021d0214
    bl func_02021bb8
    bl func_ov004_021d2548
    ldr r0, _LIT2
    bl func_ov004_021d9000
    bl func_02082208
    bl func_02084ef8
    ldr r1, _LIT3
    mov r0, #0x0
    str r0, [r1]
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
.L_328:
    bl func_ov004_021d29cc
    cmp r0, #0x0
    bne .L_46c
    bl func_0201d2f8
    cmp r0, #0x0
    bne .L_46c
    ldr r0, [r4, #0x54]
    cmp r0, #0xe
    beq .L_360
    cmp r0, #0xf
    beq .L_3d8
    cmp r0, #0x11
    beq .L_408
    b .L_46c
.L_360:
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
    bl func_ov004_021d1368
    add r0, r4, #0x3000
    ldr r1, [r0, #0xc6c]
    cmp r1, #0x1e
    ldrgt r0, [r0, #0xc70]
    cmpgt r0, #0x1e
    ble .L_46c
    mov r0, #0x1
    bl func_ov004_021d0db8
    ldr r2, [r4, #0x54]
    add r1, r4, #0x3000
    mov r0, #0x0
    add r2, r2, #0x1
    str r0, [r1, #0xc78]
    str r0, [r1, #0xc74]
    str r2, [r4, #0x54]
    bl func_ov004_021d0514
    ldr r0, _LIT7
    bl func_ov004_021d0450
    b .L_46c
.L_3d8:
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
    bl func_ov004_021d1368
    b .L_46c
.L_408:
    add r0, r4, #0x3000
    ldr r3, [r0, #0xc0c]
    cmp r3, #0x0
    beq .L_464
    mov r0, #0xc
    strh r0, [sp, #0x2]
    strh r3, [sp, #0x4]
    cmp r3, #0x0
    mov ip, #0x0
    ble .L_454
    add r1, sp, #0x2
.L_434:
    add r0, r4, ip, lsl #0x2
    add r0, r0, #0x3000
    ldr r2, [r0, #0xc14]
    add r0, r1, ip, lsl #0x1
    add ip, ip, #0x1
    strh r2, [r0, #0x4]
    cmp ip, r3
    blt .L_434
.L_454:
    add r1, sp, #0x2
    mov r0, #0x6
    mov r2, #0x18
    bl func_0201ccc8
.L_464:
    mov r0, #0xe
    str r0, [r4, #0x54]
.L_46c:
    bl func_ov004_021d1a28
    add r1, r4, #0xef0
    ldr r0, _LIT8
    ldr r3, _LIT9
    add r1, r1, #0x5000
    mov r2, #0x4
    bl func_ov004_021c9cf4
    bl func_02082208
    bl func_02084ef8
    ldr r1, _LIT3
    mov r0, #0x0
    str r0, [r1]
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_0220e2a0
_LIT1: .word data_ov004_0220b2a0
_LIT2: .word data_ov004_02291388
_LIT3: .word 0x04000540
_LIT4: .word 0x66666667
_LIT5: .word data_02104e6c
_LIT6: .word 0x00000101
_LIT7: .word 0x000003c3
_LIT8: .word 0x05000638
_LIT9: .word 0x00600100
