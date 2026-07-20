; func_ov013_021ca6ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02103fcc
        .extern data_ov000_021c7304
        .extern data_ov013_021cb6d4
        .extern data_ov013_021cbad0
        .extern data_ov013_021cbaf0
        .extern data_ov013_021cbb08
        .extern data_ov013_021cbb20
        .extern data_ov013_021cbb5c
        .extern func_02005c84
        .extern func_02005e04
        .extern func_02018b14
        .extern func_02018b60
        .extern func_0201960c
        .extern func_0201a5c0
        .extern func_0201a738
        .extern func_0201a80c
        .extern func_0201a8e0
        .extern func_0201a990
        .extern func_0201aa60
        .extern func_0201be58
        .extern func_0201bf0c
        .extern func_0201c144
        .extern func_0201c64c
        .extern func_0202c06c
        .extern func_ov000_021ab3dc
        .extern func_ov000_021ab40c
        .extern func_ov000_021ab4f8
        .extern func_ov000_021ab54c
        .extern func_ov000_021ab5a8
        .extern func_ov000_021ab5ec
        .extern func_ov000_021ab660
        .extern func_ov000_021ab818
        .extern func_ov000_021ac64c
        .extern func_ov000_021adb50
        .extern func_ov000_021adc64
        .extern func_ov000_021ae288
        .extern func_ov000_021ae380
        .extern func_ov000_021ae3a0
        .extern func_ov000_021aec2c
        .extern func_ov000_021af28c
        .extern func_ov000_021af304
        .extern func_ov000_021af334
        .extern func_ov002_021b20ac
        .extern Ov013_GetPageCount
        .extern func_ov013_021ca1d8
        .extern Ov013_SetBlendAlpha
        .extern Ov013_SetPage
        .extern func_ov013_021ca62c
        .global func_ov013_021ca6ec
        .arm
func_ov013_021ca6ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x5c
    ldr r0, _LIT0
    ldr r6, _LIT1
    ldr r1, [r0, #0x140]
    mov r7, #0x0
    orr r1, r1, #0x40
    str r1, [r0, #0x140]
    bl Ov013_SetBlendAlpha
    ldr r0, _LIT2
    ldr r1, [r0, #0x178]
    sub r1, r1, #0x800
    str r1, [r0, #0x178]
    ldr r0, [r0, #0x198]
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    cmp r0, #0x11
    addls pc, pc, r0, lsl #0x2
    b .L_eb8
    b .L_154
    b .L_2a4
    b .L_310
    b .L_38c
    b .L_5c8
    b .L_628
    b .L_6a8
    b .L_734
    b .L_980
    b .L_9f8
    b .L_b28
    b .L_b84
    b .L_c0c
    b .L_c48
    b .L_d50
    b .L_e1c
    b .L_e58
    b .L_e2c
.L_154:
    ldr r0, _LIT3
    ldr r0, [r0, #0x3c]
    cmp r0, #0x0
    beq .L_1c0
    subs r0, r0, #0x1
    cmpne r0, #0x1
    bne .L_180
    ldr r0, [r6, #0x17c]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r6, #0x17c]
.L_180:
    ldr r0, _LIT3
    mov r1, #0x1
    ldr r0, [r0, #0x3c]
    sub r0, r0, #0x1
    bl Ov013_SetPage
    ldr r0, [r6, #0x15c]
    ldr r1, [r6, #0x170]
    bic r0, r0, #0xff0000
    bic r3, r1, #0xff
    orr r2, r0, #0x20000
    ldr r0, _LIT3
    mov r1, #0x0
    str r3, [r6, #0x170]
    str r2, [r6, #0x15c]
    str r1, [r0, #0x3c]
    b .L_eb8
.L_1c0:
    bl func_ov000_021ae380
    cmp r0, #0x0
    beq .L_eb8
    bl func_ov000_021ae3a0
    cmp r0, #0x0
    bne .L_20c
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_1f8
    mov r0, r7
    mov r1, #0x10
    bl func_ov000_021ab660
.L_1f8:
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0xf0000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_20c:
    sub r0, r0, #0x1
    add r0, r6, r0
    add r0, r0, #0x100
    ldrsb r0, [r0, #0x6c]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_274
    ldr r0, [r6, #0x168]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x1e
    add r4, r0, #0x1
    bl Ov013_GetPageCount
    cmp r4, r0
    ldrcs r0, [r6, #0x168]
    biccs r0, r0, #0x30000
    bcs .L_25c
    ldr r1, [r6, #0x168]
    mov r0, r4, lsl #0x1e
    bic r1, r1, #0x30000
    orr r0, r1, r0, lsr #0xe
.L_25c:
    str r0, [r6, #0x168]
    ldr r0, [r6, #0x168]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x1e
    bl func_ov013_021ca1d8
    b .L_eb8
.L_274:
    mov r1, r7
    bl Ov013_SetPage
    bl func_ov000_021af334
    ldr r1, [r6, #0x15c]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r6, #0x15c]
    b .L_eb8
.L_2a4:
    bl func_ov000_021af28c
    cmp r0, #0x0
    bne .L_eb8
    ldr r1, [r6, #0x170]
    mov r0, #0x1
    bic r1, r1, #0xff
    orr r2, r1, #0xff
    mov r1, r0
    str r2, [r6, #0x170]
    bl func_ov000_021ab3dc
    mov r0, #0x1
    mov r1, r0
    mov r2, #0x2
    bl func_ov000_021ab4f8
    mov r0, #0x1
    mov r1, r7
    mov r2, #0x10
    bl func_ov000_021ab5a8
    ldr r1, [r6, #0x15c]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r6, #0x15c]
    b .L_eb8
.L_310:
    ldr r0, [r6, #0x170]
    ldr r3, _LIT4
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    subs r4, r0, #0x10
    movmi r4, r7
    rsb r5, r4, #0xff
    mov r1, r5, lsl #0x4
    mov r0, r1, lsr #0x1f
    smull r2, r1, r3, r1
    add r1, r1, r5, lsl #0x4
    add r1, r0, r1, asr #0x7
    rsb r2, r1, #0x10
    mov r0, #0x1
    bl func_ov000_021ab5a8
    ldr r1, [r6, #0x170]
    and r0, r4, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [r6, #0x170]
    cmp r4, #0x0
    bne .L_eb8
    ldr r1, [r6, #0x15c]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r6, #0x15c]
    b .L_eb8
.L_38c:
    mov r0, #0x1
    mov r1, r0
    mov r2, r7
    bl func_ov000_021ab54c
    mov r0, #0x3
    bl func_0201c144
    ldr r0, [r6, #0x168]
    mov r0, r0, lsl #0xb
    mov r0, r0, lsr #0x1d
    add r0, r0, #0x75
    bl func_0201960c
    mov r0, #0x1
    bl func_ov000_021aec2c
    bl func_0201be58
    cmp r0, #0x0
    bne .L_3d8
    bl func_0201bf0c
    cmp r0, #0x0
    beq .L_42c
.L_3d8:
    mov r0, #0x0
    bl func_ov002_021b20ac
    bl func_0201c64c
    bl func_02018b60
    ldr r0, [r0]
    .word 0xebff99e6
    mov r0, #0x0
    bl func_ov000_021aec2c
    ldr r1, [r6, #0x15c]
    ldr r2, [r6, #0x158]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    orr r2, r2, #0x10000
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r2, [r6, #0x158]
    str r0, [r6, #0x15c]
    bl func_ov000_021af304
    b .L_eb8
.L_42c:
    mov r0, #0x1
    mov r4, r7
    bl func_ov002_021b20ac
    mov r0, #0x9
    bl func_ov000_021adb50
    ldr r0, [r6, #0x168]
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x1d
    beq .L_45c
    cmp r0, #0x1
    beq .L_480
    b .L_4a4
.L_45c:
    ldr r0, [r6, #0x17c]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    mov r0, r7
    strne r0, [r6, #0x174]
    bne .L_4b4
    bl func_0201a5c0
    str r0, [r6, #0x174]
    b .L_4b4
.L_480:
    ldr r0, [r6, #0x17c]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    mov r0, r7
    strne r0, [r6, #0x174]
    bne .L_4b4
    bl func_0201a80c
    str r0, [r6, #0x174]
    b .L_4b4
.L_4a4:
    ldr r0, [r6, #0x158]
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1f
    ldreq r4, _LIT5
.L_4b4:
    mov r0, #0x0
    bl func_ov000_021aec2c
    cmp r4, #0x0
    beq .L_4cc
    mov r0, r4
    .word 0xebff99f4
.L_4cc:
    mov r0, #0x1
    mov r1, r0
    mov r2, #0x0
    bl func_ov000_021ab54c
    ldr r0, [r6, #0x174]
    mov r1, #0x0
    str r1, [r6, #0x178]
    cmp r0, #0x0
    beq .L_508
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x50000
    str r0, [r6, #0x15c]
    bl func_ov000_021af304
    b .L_eb8
.L_508:
    ldr r0, [r6, #0x158]
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1f
    beq .L_564
    bl func_ov000_021af334
    ldr r2, [r6, #0x15c]
    mov r0, #0x1
    mov r1, r2, lsl #0x8
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff0000
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x8
    str r1, [r6, #0x15c]
    bl func_ov000_021aec2c
    ldr r1, [r6, #0x15c]
    ldr r0, [r6, #0x158]
    bic r1, r1, #0xff0000
    orr r1, r1, #0xa0000
    bic r0, r0, #0x10000
    str r1, [r6, #0x15c]
    str r0, [r6, #0x158]
    b .L_eb8
.L_564:
    bl func_ov013_021ca62c
    cmp r0, #0x0
    bne .L_5b0
    bl func_ov000_021af334
    ldr r2, [r6, #0x15c]
    mov r0, #0x1
    mov r1, r2, lsl #0x8
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff0000
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x8
    str r1, [r6, #0x15c]
    bl func_ov000_021aec2c
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0xa0000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_5b0:
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x90000
    str r0, [r6, #0x15c]
    bl func_ov000_021af304
    b .L_eb8
.L_5c8:
    .word 0xebff99d1
    cmp r0, #0x0
    beq .L_eb8
    bl func_02018b14
    cmp r0, #0x0
    beq .L_614
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_600
    mov r0, r7
    mov r1, #0x10
    bl func_ov000_021ab660
.L_600:
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0xf0000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_614:
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x30000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_628:
    ldr r0, [r6, #0x178]
    ldr r2, [r6, #0x174]
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_654
.L_63c:
    ldr r0, [r6, #0x178]
    ldr r2, [r6, #0x174]
    add r0, r0, #0x1
    str r0, [r6, #0x178]
    tst r2, r1, lsl r0
    beq .L_63c
.L_654:
    add r1, sp, #0x39
    bl func_0201aa60
    ldr r0, [r6, #0x178]
    mov r2, #0x1
    add r1, r0, #0x1
    mvn r2, r2, lsl r0
    ldr r3, [r6, #0x174]
    add r0, sp, #0x39
    and r2, r3, r2
    str r2, [r6, #0x174]
    str r1, [r6, #0x178]
    .word 0xebff9986
    ldr r1, [r6, #0x15c]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r6, #0x15c]
    b .L_eb8
.L_6a8:
    .word 0xebff9999
    cmp r0, #0x0
    beq .L_eb8
    ldr r0, [r6, #0x174]
    cmp r0, #0x0
    beq .L_6d4
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x50000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_6d4:
    bl func_ov013_021ca62c
    cmp r0, #0x0
    bne .L_720
    bl func_ov000_021af334
    ldr r2, [r6, #0x15c]
    mov r0, #0x1
    mov r1, r2, lsl #0x8
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff0000
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x8
    str r1, [r6, #0x15c]
    bl func_ov000_021aec2c
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0xa0000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_720:
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x90000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_734:
    ldr r1, [r6, #0x174]
    ldr r3, [r6, #0x178]
    mov r0, #0x1
    cmp r1, #0x0
    mov r0, r0, lsl r3
    bne .L_798
    bl func_ov000_021af334
    ldr r2, [r6, #0x15c]
    mov r0, #0x1
    mov r1, r2, lsl #0x8
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff0000
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x8
    str r1, [r6, #0x15c]
    bl func_ov000_021aec2c
    ldr r1, [r6, #0x15c]
    ldr r0, [r6, #0x17c]
    bic r1, r1, #0xff0000
    orr r1, r1, #0xa0000
    bic r0, r0, #0x1
    str r1, [r6, #0x15c]
    str r0, [r6, #0x17c]
    b .L_eb8
.L_798:
    tst r1, r0
    bne .L_7c0
    mov r1, #0x1
.L_7a4:
    ldr r3, [r6, #0x178]
    ldr r2, [r6, #0x174]
    add r3, r3, #0x1
    str r3, [r6, #0x178]
    tst r2, r1, lsl r3
    mov r0, r0, lsl #0x1
    beq .L_7a4
.L_7c0:
    cmp r0, #0x10000
    bgt .L_7f0
    bge .L_8f4
    cmp r0, #0x100
    bgt .L_7e4
    bge .L_8bc
    cmp r0, #0x80
    beq .L_824
    b .L_928
.L_7e4:
    cmp r0, #0x8000
    beq .L_8f4
    b .L_928
.L_7f0:
    cmp r0, #0x40000
    bgt .L_808
    bge .L_8f4
    cmp r0, #0x20000
    beq .L_8f4
    b .L_928
.L_808:
    cmp r0, #0x80000
    bgt .L_818
    beq .L_8f4
    b .L_928
.L_818:
    cmp r0, #0x100000
    beq .L_8f4
    b .L_928
.L_824:
    mov r4, #0x0
    bl GetSystemWork
    ldr r0, [r0, #0x904]
    tst r0, #0x1
    bne .L_850
    mov r5, #0x1
.L_83c:
    add r4, r4, #0x1
    bl GetSystemWork
    ldr r0, [r0, #0x904]
    tst r0, r5, lsl r4
    beq .L_83c
.L_850:
    bl func_02018b60
    ldr r2, [r0, #0x18]
    add r1, r4, #0x1
    bic r2, r2, #0xff0000
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x8
    str r1, [r0, #0x18]
    bl GetSystemWork
    mov r1, #0x1
    mvn r1, r1, lsl r4
    ldr r2, [r0, #0x904]
    and r1, r2, r1
    str r1, [r0, #0x904]
    bl GetSystemWork
    ldr r0, [r0, #0x904]
    cmp r0, #0x0
    bne .L_8ac
    ldr r0, [r6, #0x178]
    mov r1, #0x1
    mvn r0, r1, lsl r0
    ldr r1, [r6, #0x174]
    and r0, r1, r0
    str r0, [r6, #0x174]
.L_8ac:
    ldr r0, [r6, #0x178]
    add r1, sp, #0x18
    bl func_0201a738
    b .L_954
.L_8bc:
    mov r0, #0x1
    bl func_0201a5c0
    tst r0, #0x100
    bne .L_8e4
    ldr r0, [r6, #0x178]
    mov r1, #0x1
    mvn r0, r1, lsl r0
    ldr r1, [r6, #0x174]
    and r0, r1, r0
    str r0, [r6, #0x174]
.L_8e4:
    ldr r0, [r6, #0x178]
    add r1, sp, #0x18
    bl func_0201a738
    b .L_954
.L_8f4:
    bl func_0201a8e0
    ldr r0, [r6, #0x178]
    mov r1, #0x1
    mvn r2, r1, lsl r0
    ldr r3, [r6, #0x174]
    add r1, sp, #0x18
    and r2, r3, r2
    str r2, [r6, #0x174]
    bl func_0201a990
    ldr r0, [r6, #0x178]
    add r0, r0, #0x1
    str r0, [r6, #0x178]
    b .L_954
.L_928:
    add r1, sp, #0x18
    mov r0, r3
    bl func_0201aa60
    ldr r1, [r6, #0x178]
    mov r2, #0x1
    add r0, r1, #0x1
    mvn r1, r2, lsl r1
    ldr r2, [r6, #0x174]
    str r0, [r6, #0x178]
    and r0, r2, r1
    str r0, [r6, #0x174]
.L_954:
    add r0, sp, #0x18
    .word 0xebff98d0
    ldr r1, [r6, #0x15c]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r6, #0x15c]
    b .L_eb8
.L_980:
    .word 0xebff98e3
    cmp r0, #0x0
    beq .L_eb8
    ldr r0, [r6, #0x174]
    cmp r0, #0x0
    beq .L_9ac
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x70000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_9ac:
    bl func_ov000_021af334
    ldr r2, [r6, #0x15c]
    mov r0, #0x1
    mov r1, r2, lsl #0x8
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff0000
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x8
    str r1, [r6, #0x15c]
    bl func_ov000_021aec2c
    ldr r1, [r6, #0x15c]
    ldr r0, [r6, #0x17c]
    bic r1, r1, #0xff0000
    orr r1, r1, #0xa0000
    bic r0, r0, #0x1
    str r1, [r6, #0x15c]
    str r0, [r6, #0x17c]
    b .L_eb8
.L_9f8:
    bl func_ov000_021ae380
    cmp r0, #0x0
    beq .L_aec
    bl func_ov000_021ae3a0
    cmp r0, #0x3
    cmpne r0, #0x0
    bne .L_ab0
    ldr r0, [r6, #0x168]
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x1d
    beq .L_a30
    cmp r0, #0x1
    beq .L_a58
    b .L_a80
.L_a30:
    mov r0, #0x1
    bl func_0201a5c0
    ldr r2, [r6, #0x15c]
    mov r1, #0x0
    bic r2, r2, #0xff0000
    orr r2, r2, #0x70000
    str r0, [r6, #0x174]
    str r2, [r6, #0x15c]
    str r1, [r6, #0x178]
    b .L_eb8
.L_a58:
    mov r0, #0x1
    bl func_0201a80c
    ldr r2, [r6, #0x15c]
    mov r1, #0x0
    bic r2, r2, #0xff0000
    orr r2, r2, #0x70000
    str r0, [r6, #0x174]
    str r2, [r6, #0x15c]
    str r1, [r6, #0x178]
    b .L_eb8
.L_a80:
    bl func_ov000_021af334
    ldr r2, [r6, #0x15c]
    mov r0, #0x1
    mov r1, r2, lsl #0x8
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff0000
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x8
    str r1, [r6, #0x15c]
    bl func_ov000_021aec2c
    b .L_eb8
.L_ab0:
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_ad0
    mov r0, r7
    mov r1, #0x10
    bl func_ov000_021ab660
.L_ad0:
    ldr r1, [r6, #0x15c]
    mov r0, #0x1
    bic r1, r1, #0xff0000
    orr r1, r1, #0xf0000
    str r1, [r6, #0x15c]
    bl func_ov000_021aec2c
    b .L_eb8
.L_aec:
    .word 0xebff9888
    cmp r0, #0x0
    beq .L_eb8
    bl func_ov000_021af334
    ldr r2, [r6, #0x15c]
    mov r0, #0x1
    mov r1, r2, lsl #0x8
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff0000
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x8
    str r1, [r6, #0x15c]
    bl func_ov000_021aec2c
    b .L_eb8
.L_b28:
    bl func_ov000_021af28c
    cmp r0, #0x0
    bne .L_eb8
    ldr r1, [r6, #0x170]
    mov r0, #0x1
    bic r1, r1, #0xff
    orr r2, r1, #0xff
    mov r1, r0
    str r2, [r6, #0x170]
    bl func_ov000_021ab3dc
    mov r0, #0x1
    mov r1, r0
    mov r2, #0x2
    bl func_ov000_021ab4f8
    ldr r1, [r6, #0x15c]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r6, #0x15c]
    b .L_eb8
.L_b84:
    ldr r0, [r6, #0x170]
    ldr r2, _LIT4
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    subs r4, r0, #0x10
    movmi r4, r7
    mov r3, r4, lsl #0x4
    smull r0, r1, r2, r3
    add r1, r1, r4, lsl #0x4
    mov r0, r3, lsr #0x1f
    add r1, r0, r1, asr #0x7
    rsb r2, r1, #0x10
    mov r0, #0x1
    bl func_ov000_021ab5a8
    ldr r1, [r6, #0x170]
    and r0, r4, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [r6, #0x170]
    cmp r4, #0x0
    bne .L_eb8
    bl func_ov000_021af304
    mov r0, #0x1
    mov r1, r0
    bl func_ov000_021ab40c
    ldr r1, [r6, #0x15c]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r6, #0x15c]
    b .L_eb8
.L_c0c:
    bl func_ov000_021af28c
    cmp r0, #0x0
    bne .L_eb8
    ldr r0, [r6, #0x168]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x1e
    bl func_ov013_021ca1d8
    ldr r0, _LIT6
    bl func_0202c06c
    mov r1, r7
    bl func_ov000_021adc64
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_c48:
    ldr r0, [r6, #0x158]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1e
    bcc .L_eb8
    ldr r8, _LIT7
    add r4, sp, #0x0
    ldmia r8!, {r0, r1, r2, r3}
    mov r5, r4
    stmia r4!, {r0, r1, r2, r3}
    ldr r2, [r6, #0x154]
    ldmia r8, {r0, r1}
    mov r2, r2, lsl #0x1c
    stmia r4, {r0, r1}
    mov r2, r2, lsr #0x1c
    sub r4, r2, #0x1
    ldr r1, [r5, r4, lsl #0x2]
    mvn r0, #0x0
    mov r2, r1, lsl #0x18
    cmp r0, r2, asr #0x18
    mov r8, r2, asr #0x18
    bne .L_cd4
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_cc0
    mov r0, r7
    mov r1, #0x10
    bl func_ov000_021ab660
.L_cc0:
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0xf0000
    str r0, [r6, #0x15c]
    b .L_d40
.L_cd4:
    mov r0, r1, lsl #0x10
    mov r0, r0, asr #0x18
    add r0, r0, #0x1d
    add r0, r0, #0x500
    bl func_0202c06c
    .word 0xebff9a8e
    ldr r1, [r5, r4, lsl #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x8
    mov r0, r0, asr #0x18
    add r0, r0, #0x21
    add r0, r0, #0x500
    bl func_0202c06c
    .word 0xebff9a86
    mov r1, r4
    mov r2, r0
    mov r0, r8
    mov r3, #0x1
    bl func_ov000_021ae288
    ldr r0, [r6, #0x15c]
    bic r1, r0, #0xff0000
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r6, #0x15c]
.L_d40:
    ldr r0, [r6, #0x158]
    bic r0, r0, #0xff
    str r0, [r6, #0x158]
    b .L_eb8
.L_d50:
    bl func_ov000_021ae380
    cmp r0, #0x0
    beq .L_eb8
    bl func_ov000_021ae3a0
    cmp r0, #0x0
    beq .L_e0c
    ldr r1, [r6, #0x154]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x4
    bne .L_dc8
    cmp r0, #0x1
    beq .L_d90
    cmp r0, #0x2
    beq .L_dac
    b .L_eb8
.L_d90:
    ldr r0, _LIT8
    .word 0xebff97c1
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x110000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_dac:
    ldr r0, _LIT9
    .word 0xebff97ba
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0x110000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_dc8:
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_de8
    mov r0, r7
    mov r1, #0x10
    bl func_ov000_021ab660
.L_de8:
    ldr r1, [r6, #0x15c]
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r6, #0x15c]
    b .L_eb8
.L_e0c:
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_e1c:
    bl func_ov000_021ab5ec
    cmp r0, #0x0
    movne r7, #0x1
    b .L_eb8
.L_e2c:
    .word 0xebff97b8
    cmp r0, #0x0
    beq .L_eb8
    ldr r0, _LIT10
    bl func_0202c06c
    mov r1, #0x1
    bl func_ov000_021adc64
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    str r0, [r6, #0x15c]
    b .L_eb8
.L_e58:
    ldr r1, [r6, #0x158]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r1, r1, r0, lsr #0x10
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    str r1, [r6, #0x158]
    cmp r0, #0x1e
    bcc .L_eb8
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1f
    bne .L_ea8
    mov r0, r7
    mov r1, #0x10
    bl func_ov000_021ab660
.L_ea8:
    ldr r0, [r6, #0x15c]
    bic r0, r0, #0xff0000
    orr r0, r0, #0xf0000
    str r0, [r6, #0x15c]
.L_eb8:
    add r5, r6, #0x124
    mov r4, #0x0
.L_ec0:
    mov r0, r5
    bl func_ov000_021ac64c
    add r4, r4, #0x1
    cmp r4, #0x1
    add r5, r5, #0x14
    bcc .L_ec0
    .word 0xebff992f
    mov r0, #0x1
    bl func_02005e04
    mov r0, #0x2
    bl func_02005e04
    mov r0, #0x1
    bl func_02005c84
    mov r0, #0x2
    bl func_02005c84
    bl func_ov000_021ab818
    mov r0, r7
    add sp, sp, #0x5c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov000_021c7304
_LIT1: .word data_ov013_021cbb5c
_LIT2: .word data_ov013_021cbb20
_LIT3: .word data_02103fcc
_LIT4: .word 0x80808081
_LIT5: .word data_ov013_021cbad0
_LIT6: .word 0x00000709
_LIT7: .word data_ov013_021cb6d4
_LIT8: .word data_ov013_021cbaf0
_LIT9: .word data_ov013_021cbb08
_LIT10: .word 0x00000515
