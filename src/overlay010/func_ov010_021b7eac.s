; func_ov010_021b7eac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_02106804
        .extern data_ov010_021b8d44
        .extern data_ov010_021b9884
        .extern data_ov010_021b9890
        .extern data_ov010_021b98a8
        .extern data_ov010_021b9bec
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001dc4
        .extern func_02001ddc
        .extern func_02004f58
        .extern func_02004fe8
        .extern func_02005088
        .extern func_020054a4
        .extern func_020055b4
        .extern func_02006194
        .extern func_02012560
        .extern func_0201261c
        .extern func_0202adf8
        .extern func_0202c0c0
        .extern func_02037208
        .extern func_0207ec68
        .extern func_0207ed94
        .extern func_0207f05c
        .extern func_0207fd28
        .extern Vram_GetBankBaseCD
        .extern func_ov005_021ab260
        .extern func_ov005_021ab3a0
        .extern func_ov005_021ab3b4
        .extern func_ov005_021ab6ac
        .extern func_ov005_021ac9d0
        .extern func_ov010_021b2924
        .extern func_ov010_021b2db8
        .extern func_ov010_021b2ddc
        .extern func_ov010_021b35e4
        .extern func_ov010_021b6868
        .extern func_ov010_021b69b4
        .extern func_ov010_021b6c4c
        .extern func_ov010_021b6e84
        .extern func_ov010_021b7104
        .extern func_ov010_021b7128
        .extern func_ov010_021b718c
        .extern func_ov010_021b7218
        .global func_ov010_021b7eac
        .arm
func_ov010_021b7eac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x18
    ldr r2, _LIT0
    ldr r1, _LIT1
    mov r5, #0x0
    ldr r0, _LIT2
    mov r6, r5
    str r2, [sp, #0x14]
    ldr r7, [r1, #0xc]
    ldr r4, _LIT3
    bl func_0207ed94
    ldr r0, _LIT2
    bl func_0207ec68
    ldr r0, _LIT1
    ldr r1, [r0, #0xc]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_1624
    b .L_1624
    b .L_1608
    b .L_12c4
    b .L_12d4
    b .L_144c
    b .L_1544
    b .L_1554
.L_12c4:
    add r0, sp, #0x14
    bl func_ov010_021b6c4c
    add r5, r5, r0
    b .L_1624
.L_12d4:
    mov r0, #0x1000
    bl func_ov010_021b718c
    cmp r0, #0x0
    bne .L_12f4
    add r0, sp, #0x14
    bl func_ov010_021b6c4c
    add r5, r5, r0
    b .L_1624
.L_12f4:
    ldr r0, [r4, #0x88]
    ldr r1, [r4, #0xe8]
    bl func_ov005_021ac9d0
    mov r8, r0
    ldr r0, [r4, #0x84]
    mov r1, r8
    bl func_ov005_021ab3a0
    mov r7, r0
    ldr r0, [r4, #0x84]
    mov r1, r8
    bl func_ov005_021ab3b4
    ldr r0, _LIT1
    mov r1, r8
    ldr r0, [r0, #0x90]
    bl func_ov005_021ab3b4
    ldr r0, _LIT4
    ldr r9, [r4, #0x344]
    add r0, r7, r0
    add r0, r4, r0, lsl #0x2
    ldr r8, [r0, #0x210]
    bl Vram_GetBankBaseCD
    mov r7, r0
    add r0, r9, r8
    mov r1, #0xe
    bl func_020054a4
    mov r0, #0x4
    mov r1, r5
    mov r2, #0x400
    bl func_ov010_021b2db8
    mov r0, #0x4
    bl func_ov010_021b2ddc
    ldr r0, _LIT5
    mov r1, #0x1a
    mov r2, #0x13
    bl func_02001d0c
    ldr r0, _LIT6
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT5
    mov r1, #0x4
    ldr r2, [r0, #0x20]
    bic r2, r2, #0x800000
    str r2, [r0, #0x20]
    bl func_02001dc4
    mov r0, #0x14
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldr r3, _LIT7
    ldr r0, _LIT5
    str r3, [sp, #0x8]
    add r1, r9, r8
    add r2, r7, #0x20
    mov r3, #0x4
    bl func_02001ddc
    mov r1, #0x1a
    strh r1, [sp, #0x10]
    mov r1, #0x6
    mov r2, #0x1
    mov r0, #0x4
    strh r1, [sp, #0x12]
    add r1, sp, #0xc
    mov r3, #0xd
    strh r2, [sp, #0xc]
    strh r0, [sp, #0xe]
    bl func_ov010_021b35e4
    mov ip, #0x1
    mov r9, #0xa
    mov r8, #0x1a
    mov r7, #0xd
    add r1, sp, #0xc
    mov r0, #0x4
    mov r2, #0x9d
    mov r3, #0xf
    strh ip, [sp, #0xc]
    strh r9, [sp, #0xe]
    strh r8, [sp, #0x10]
    strh r7, [sp, #0x12]
    bl func_ov010_021b35e4
    ldr r0, _LIT8
    mov r1, r5
    str r1, [r0]
    mov r7, #0x4
    b .L_1624
.L_144c:
    mov r1, #0x1000
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    mov r8, r1
.L_145c:
    mov r0, r8
    bl func_ov010_021b7218
    cmp r0, #0x0
    beq .L_145c
    ldr r0, _LIT5
    bl func_020055b4
    cmp r0, #0x1
    bne .L_1624
    bl Vram_GetBankBaseCD
    mov r7, r0
    ldr r0, _LIT5
    mov r1, #0x1a
    mov r2, #0x13
    bl func_02001d0c
    ldr r0, _LIT6
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT5
    mov r8, #0x3c
    ldr r1, [r0, #0x20]
    mov r3, #0xc
    bic r1, r1, #0x800000
    str r1, [r0, #0x20]
    ldr r9, [r4, #0x344]
    ldr r1, [r4, #0x320]
    add r2, r7, #0x20
    add r1, r9, r1
    str r8, [sp]
    str r3, [sp, #0x4]
    mov r3, #0x4
    bl func_02004f58
    add r0, r4, #0x1d4
    bl func_0202adf8
    ldr r1, _LIT6
    mov r0, #0x1f
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    str r1, [r4, #0x1d4]
    bl func_0202c0c0
    mov r8, r0
    mov r1, #0xe
    bl func_020054a4
    mov r1, r8
    add r2, r7, #0x20
    rsb r0, r0, #0xda
    mov r0, r0, asr #0x1
    sub r3, r0, #0x5
    mov r0, #0x70
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldr r0, _LIT5
    bl func_02004fe8
    mov r7, #0x5
    b .L_1624
.L_1544:
    add r0, sp, #0x14
    bl func_ov010_021b7104
    add r5, r5, r0
    b .L_1624
.L_1554:
    mov r0, #0x1000
    bl func_ov010_021b718c
    cmp r0, #0x0
    bne .L_1574
    add r0, sp, #0x14
    bl func_ov010_021b7104
    add r5, r5, r0
    b .L_1624
.L_1574:
    ldr r1, [r4, #0x10]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_15d8
    mov r0, #0x4
    bl func_ov010_021b2ddc
    ldr r1, [r4, #0x358]
    ldr r0, [r4, #0x88]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x358]
    bl func_ov005_021ab6ac
    ldr r3, [r4, #0x34]
    ldr r0, _LIT1
    ldr r2, [r3, #0x70]
    mov r1, #0x10000
    bic r2, r2, #0x2
    str r2, [r3, #0x70]
    ldr r2, [r4, #0x100]
    mov r7, #0x1
    bic r2, r2, #0x1
    str r2, [r4, #0x100]
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    b .L_1624
.L_15d8:
    ldr r0, [r4, #0x88]
    ldr r1, [r4, #0xe8]
    bl func_ov005_021ac9d0
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0x14]
    bl func_02012560
    ldr r1, _LIT9
    ldr r0, _LIT10
    mov r7, #0x7
    str r1, [r0, #0x6c]
    mov r6, #0x1
    b .L_1624
.L_1608:
    add r0, sp, #0x14
    bl func_ov010_021b6c4c
    add r5, r5, r0
    mov r0, #0x1000
    bl func_ov010_021b7218
    cmp r0, #0x1
    moveq r7, #0x2
.L_1624:
    add r2, sp, #0x14
    add r0, r4, #0x3c
    add r1, r4, #0x18
    bl func_ov010_021b2924
    add r0, r5, r0
    cmp r0, #0x0
    ble .L_1654
    mov r2, r0, lsl #0x10
    ldr r1, _LIT0
    add r0, r4, #0x18
    mov r2, r2, lsr #0x10
    bl func_0207f05c
.L_1654:
    bl func_02006194
    cmp r0, #0x0
    bne .L_168c
    ldr r0, [r4]
    cmp r0, #0x2
    beq .L_1678
    cmp r0, #0x5
    beq .L_1684
    b .L_168c
.L_1678:
    bl func_ov010_021b6e84
    mov r7, r0
    b .L_168c
.L_1684:
    bl func_ov010_021b7128
    mov r7, r0
.L_168c:
    ldr r0, [r4, #0x358]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_1724
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r4, #0x358]
    ldr r0, [r4]
    bic r1, r1, #0x4
    str r1, [r4, #0x358]
    cmp r0, #0x2
    beq .L_16d8
    cmp r0, #0x5
    beq .L_1708
    b .L_1724
.L_16d8:
    ldr r2, [r4, #0x34]
    mov r0, #0x3
    ldr r1, [r2, #0x70]
    mov r6, #0x1
    orr r1, r1, #0x2
    str r1, [r2, #0x70]
    ldr r1, [r4, #0x100]
    str r0, [r4]
    bic r0, r1, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x100]
    b .L_1724
.L_1708:
    mvn r1, #0x0
    ldr r0, _LIT1
    str r1, [r4, #0x10]
    mov r1, #0x10000
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    mov r7, #0x6
.L_1724:
    ldr r0, [r4, #0x358]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_1874
    ldr r8, [r4, #0xe8]
    ldr r0, [r4, #0x88]
    mov r1, r8
    bl func_ov005_021ac9d0
    mov r5, r0
    ldr r0, [r4, #0x84]
    mov r1, r5
    bl func_ov005_021ab3a0
    ldr r0, [r4, #0x84]
    mov r1, r5
    bl func_ov005_021ab3b4
    ldr r0, _LIT1
    mov r1, r5
    ldr r0, [r0, #0x90]
    bl func_ov005_021ab3b4
    ldr r2, [r4, #0x358]
    ldr r1, [r4]
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    bic r0, r2, #0x10
    str r0, [r4, #0x358]
    cmp r1, #0x2
    beq .L_17a0
    cmp r1, #0x5
    beq .L_1810
    b .L_1874
.L_17a0:
    ldr r0, [r4, #0x84]
    mov r1, r5
    bl func_ov005_021ab260
    cmp r0, #0x0
    bne .L_1800
    ldr r0, _LIT1
    mov r1, #0x10000
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    ldr r3, [r4, #0x34]
    mov r0, #0x3a
    ldr r2, [r3, #0x70]
    sub r1, r0, #0x3b
    orr r2, r2, #0x2
    str r2, [r3, #0x70]
    ldr r3, [r4, #0x100]
    mov r2, #0x0
    bic r3, r3, #0x1
    orr r5, r3, #0x1
    mov r3, #0x1
    str r5, [r4, #0x100]
    bl func_02037208
    mov r7, #0x3
    b .L_1874
.L_1800:
    mov r0, r8
    mvn r1, #0x0
    bl func_ov010_021b6868
    b .L_1874
.L_1810:
    ldr r0, _LIT11
    mov r1, r3, asr #0x5
    ldr r0, [r0, r1, lsl #0x2]
    and r1, r3, #0x1f
    mov r2, #0x1
    tst r0, r2, lsl r1
    moveq r2, #0x0
    cmp r2, #0x0
    str r3, [r4, #0x10]
    movne r0, #0x0
    bne .L_1848
    mov r0, r5
    bl func_ov010_021b69b4
    add r0, r0, #0x1
.L_1848:
    ldr r5, _LIT1
    str r0, [r4, #0x14]
    mov r7, #0x10000
    mov r0, #0x3a
    str r7, [r5, #0x14]
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    str r7, [r5, #0x18]
    bl func_02037208
    mov r7, #0x6
.L_1874:
    add r0, r4, #0x180
    mov r1, #0x1000
    bl func_0207fd28
    ldr r1, [r4, #0x1ac]
    mov r0, r6
    str r1, [r4, #0x17c]
    str r7, [r4]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov010_021b9bec
_LIT1: .word data_ov010_021b9884
_LIT2: .word data_ov010_021b98a8
_LIT3: .word data_ov010_021b9890
_LIT4: .word 0xfffff81c
_LIT5: .word data_02102c90
_LIT6: .word data_02104f4c
_LIT7: .word func_02005088
_LIT8: .word 0x04001010
_LIT9: .word func_0201261c
_LIT10: .word data_ov010_021b8d44
_LIT11: .word data_02106804
