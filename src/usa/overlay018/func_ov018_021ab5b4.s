; func_ov018_021ab5b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02102bb0
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov018_021ad780
        .extern data_ov018_021ad790
        .extern data_ov018_021ad7a4
        .extern data_ov018_021ad7c8
        .extern data_ov018_021ad7d8
        .extern func_02001ba8
        .extern func_02001c78
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001e20
        .extern func_02004f3c
        .extern func_0200506c
        .extern func_02005488
        .extern func_02006178
        .extern func_0200852c
        .extern func_0202c06c
        .extern func_02036540
        .extern func_020371b8
        .extern func_0203737c
        .extern func_020379a8
        .extern func_02037ae4
        .extern func_0207e2d4
        .extern func_0207e550
        .extern func_0207eb80
        .extern func_0207ecac
        .extern func_0207ef74
        .extern func_0207f774
        .extern func_0207f79c
        .extern func_0207fbf8
        .extern func_0207fc78
        .extern func_0208de78
        .extern func_0208e138
        .extern func_0208e230
        .extern func_0208e2f4
        .extern func_020943b0
        .extern func_020b377c
        .extern func_ov018_021aa51c
        .extern func_ov018_021aa6b4
        .extern func_ov018_021aa7a0
        .extern func_ov018_021aa840
        .extern func_ov018_021aa898
        .extern func_ov018_021aaa10
        .extern func_ov018_021aaaf8
        .extern func_ov018_021aac04
        .extern func_ov018_021aac84
        .extern func_ov018_021aacb0
        .extern func_ov018_021aacfc
        .extern func_ov018_021aaf74
        .extern func_ov018_021ab05c
        .global func_ov018_021ab5b4
        .arm
func_ov018_021ab5b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x20
    ldr r0, _LIT0
    mov r5, #0x0
    add r1, sp, #0x10
    str r5, [r1]
    str r5, [r1, #0x4]
    ldr r1, [r0, #0x9cc]
    ldr r4, _LIT1
    add r1, r1, #0x1000
    ldr r7, _LIT2
    mov r6, r5
    str r1, [r0, #0x9cc]
.L_1d4:
    mov r0, r7
    bl func_0207ecac
    mov r0, r7
    bl func_0207eb80
    add r0, r7, #0x1c
    add r6, r6, #0x1
    cmp r6, #0x2
    add r7, r0, #0x400
    blt .L_1d4
    add r0, r4, #0x48
    ldr r1, [r4]
    add r2, r4, #0x2c
    add r0, r0, #0x400
    str r2, [sp, #0x18]
    str r0, [sp, #0x1c]
    cmp r1, #0x13
    addls pc, pc, r1, lsl #0x2
    b .L_1210
    b .L_1210
    b .L_26c
    b .L_2b4
    b .L_2dc
    b .L_5d0
    b .L_3c4
    b .L_478
    b .L_510
    b .L_618
    b .L_6e8
    b .L_870
    b .L_908
    b .L_9b4
    b .L_ba8
    b .L_c38
    b .L_c70
    b .L_cd8
    b .L_fe4
    b .L_ffc
    b .L_1104
.L_26c:
    ldr r6, _LIT3
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    mov r3, r0
    strh r0, [r6]
    add r6, r6, #0x1000
    strh r0, [r6]
    bl func_ov018_021aa51c
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    mov r3, #0x100
    mov r2, #0x0
    orr r1, r1, #0x2
    str r3, [r4, #0x924]
    str r2, [r4, #0x928]
    strh r1, [r0, #0xb4]
    b .L_1210
.L_2b4:
    ldr r0, [r4, #0xc]
    sub r0, r0, #0x1000
    str r0, [r4, #0xc]
    cmp r0, #0x0
    bgt .L_1210
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_2dc:
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    bne .L_310
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_310:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    sub r0, r0, #0x1000
    str r0, [r4, #0xc]
    mov r0, r0, lsl #0x8
    bl func_020b377c
    ldr r1, [r4, #0xc]
    mov r2, #0x0
    str r0, [r4, #0x924]
    str r2, [r4, #0x928]
    cmp r1, #0x0
    bgt .L_1210
    mov r3, r2
    mov r0, #0x1
    mov r1, #0x2
    bl func_ov018_021aa7a0
    add r1, r4, #0x880
    add r0, r4, #0x74
    add r2, r4, #0x78
    add r3, r4, #0x7c
    str r1, [sp]
    add r1, r0, #0x800
    add r2, r2, #0x800
    add r3, r3, #0x800
    mov r0, #0x1
    bl func_ov018_021aa840
    ldr r0, [r4, #0x87c]
    mov r1, #0x0
    bl func_0207e2d4
    add r2, r4, #0x84
    mov r1, r0
    add r0, r2, #0x800
    ldr r2, [r4, #0x880]
    bl func_0207fc78
    add r0, r4, #0x84
    add r0, r0, #0x800
    mov r1, #0x1000
    bl func_0207fbf8
    mov r0, #0x1
    str r0, [r4, #0x88c]
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_3c4:
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    bne .L_40c
    mov r0, #0xc8
    sub r1, r0, #0xc9
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r2, _LIT4
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_40c:
    add r0, r4, #0x2c
    add r1, sp, #0x1c
    add r0, r0, #0x400
    mov r2, #0x0
    bl func_ov018_021aac04
    ldr r2, [sp, #0x14]
    ldr r1, [r4, #0xc]
    add r2, r2, r0
    sub r0, r1, #0x1000
    str r2, [sp, #0x14]
    str r0, [r4, #0xc]
    cmp r0, #0x0
    bgt .L_1210
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x5
    mov r3, #0x0
    bl func_ov018_021aa51c
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    mov r3, #0x100
    mov r2, #0x0
    orr r1, r1, #0x2
    str r3, [r4, #0x944]
    str r2, [r4, #0x948]
    strh r1, [r0, #0xb4]
    b .L_1210
.L_478:
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    bne .L_4ac
    ldr r2, _LIT4
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_4ac:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    sub r2, r0, #0x1000
    mov r0, r2, lsl #0x8
    str r2, [r4, #0xc]
    bl func_020b377c
    rsb r3, r0, #0x200
    add r0, r4, #0x2c
    mov r2, #0x0
    add r1, sp, #0x1c
    add r0, r0, #0x400
    str r3, [r4, #0x944]
    str r2, [r4, #0x948]
    bl func_ov018_021aac04
    ldr r2, [sp, #0x14]
    ldr r1, [r4, #0xc]
    add r0, r2, r0
    str r0, [sp, #0x14]
    cmp r1, #0x0
    bgt .L_1210
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_510:
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    bne .L_534
    mov r0, #0xc9
    sub r1, r0, #0xca
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_534:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    sub r2, r0, #0x1000
    mov r0, r2, lsl #0x4
    str r2, [r4, #0xc]
    bl func_020b377c
    mov r6, r0
    ldr r0, _LIT3
    mov r2, r6
    mov r1, #0x1
    bl func_0208e2f4
    ldr r0, _LIT5
    mov r2, r6
    mov r1, #0x11
    bl func_0208e2f4
    add r0, r4, #0x2c
    add r1, sp, #0x1c
    add r0, r0, #0x400
    mov r2, #0x0
    bl func_ov018_021aac04
    ldr r2, [sp, #0x14]
    ldr r1, [r4, #0xc]
    add r0, r2, r0
    str r0, [sp, #0x14]
    cmp r1, #0x0
    bgt .L_1210
    ldr r0, _LIT3
    mov r1, #0x1
    mov r2, #0x0
    bl func_0208e2f4
    ldr r0, _LIT5
    mov r1, #0x11
    mov r2, #0x0
    bl func_0208e2f4
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_5d0:
    ldr r0, [r4, #0xc]
    add r1, sp, #0x1c
    sub r3, r0, #0x1000
    add r0, r2, #0x400
    mov r2, #0x0
    str r3, [r4, #0xc]
    bl func_ov018_021aac04
    ldr r2, [sp, #0x14]
    ldr r1, [r4, #0xc]
    add r0, r2, r0
    str r0, [sp, #0x14]
    cmp r1, #0x0
    bgt .L_1210
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_618:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    sub r0, r0, #0x1000
    str r0, [r4, #0xc]
    mov r0, r0, lsl #0x8
    bl func_020b377c
    sub r3, r0, #0x100
    ldr r0, [r4, #0xc]
    mov r2, #0x0
    ldr r1, [r4, #0x8]
    mov r0, r0, lsl #0x8
    str r3, [r4, #0x924]
    str r2, [r4, #0x928]
    bl func_020b377c
    rsb r6, r0, #0x100
    add r0, r4, #0x2c
    mov r3, #0x0
    add r1, sp, #0x1c
    add r0, r0, #0x400
    rsb r2, r6, #0x0
    str r6, [r4, #0x944]
    str r3, [r4, #0x948]
    bl func_ov018_021aac04
    ldr r2, [sp, #0x14]
    ldr r1, [r4, #0xc]
    add r0, r2, r0
    str r0, [sp, #0x14]
    cmp r1, #0x0
    bgt .L_1210
    ldr r0, _LIT4
    mov r2, #0x4000000
    ldr r3, [r0]
    ldr r1, [r2]
    and r3, r3, #0x1f00
    mov r6, r3, lsr #0x8
    bic r3, r1, #0x1f00
    bic r1, r6, #0x1
    orr r1, r3, r1, lsl #0x8
    str r1, [r2]
    ldr r2, [r0]
    ldr r1, [r0]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0x11
    orr r1, r2, r1, lsl #0x8
    str r1, [r0]
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_6e8:
    ldr r0, [r4, #0xc]
    sub r1, r0, #0x1000
    mov r0, r1, asr #0xc
    str r1, [r4, #0xc]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_850
    b .L_850
    b .L_7d4
    b .L_78c
    b .L_76c
    b .L_744
    b .L_71c
.L_71c:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x2
    bl func_ov018_021aa51c
    mov r1, #0x100
    mov r0, #0x0
    str r1, [r4, #0x924]
    str r0, [r4, #0x928]
    b .L_850
.L_744:
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x3
    mov r1, #0x1
    bl func_ov018_021aa51c
    mov r1, #0x100
    mov r0, #0x0
    str r1, [r4, #0x92c]
    str r0, [r4, #0x930]
    b .L_850
.L_76c:
    mov r0, #0x5
    mov r1, #0x6
    mov r2, #0x0
    bl func_ov018_021aa6b4
    mov r0, #0x0
    str r0, [r4, #0x94c]
    str r0, [r4, #0x950]
    b .L_850
.L_78c:
    ldr r0, _LIT6
    bl func_0207f79c
    ldr r0, _LIT7
    bl func_0207f774
    mov r0, #0x0
    mov r2, r0
    mov r3, r0
    mov r1, #0x2
    bl func_ov018_021aa7a0
    ldr r0, _LIT8
    mov r2, #0x20
    add r1, r0, #0x20
    bl func_020943b0
    ldr r0, _LIT8
    add r1, r4, #0x164
    add r1, r1, #0x800
    mov r2, #0x20
    bl func_020943b0
.L_7d4:
    add r0, r4, #0x74
    add r1, r4, #0x78
    add r0, r0, #0x800
    add r1, r1, #0x800
    bl func_ov018_021aa898
    add r0, r4, #0x74
    add r2, r4, #0x78
    add r3, r4, #0x7c
    add r6, r4, #0x880
    add r1, r0, #0x800
    add r2, r2, #0x800
    add r3, r3, #0x800
    mov r0, #0x0
    str r6, [sp]
    bl func_ov018_021aa840
    mov r6, #0x0
.L_814:
    mov r1, r6, lsl #0x10
    ldr r0, [r4, #0x880]
    mov r1, r1, lsr #0x10
    bl func_0207e550
    add r1, r6, r6, lsr #0x1f
    mov r3, r6, lsr #0x1f
    rsb r2, r3, r6, lsl #0x1f
    mov r1, r1, asr #0x1
    add r6, r6, #0x1
    add r2, r3, r2, ror #0x1f
    add r1, r4, r1, lsl #0x3
    add r1, r1, r2, lsl #0x2
    str r0, [r1, #0x8d8]
    cmp r6, #0x4
    blt .L_814
.L_850:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bgt .L_1210
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_870:
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    bne .L_8a4
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x3
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_8a4:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    sub r0, r0, #0x1000
    str r0, [r4, #0xc]
    mov r0, r0, lsl #0x8
    bl func_020b377c
    mov r3, #0x0
    ldr r2, [r4, #0xc]
    str r0, [r4, #0x924]
    ldr r1, [r4, #0x8]
    mov r0, r2, lsl #0x8
    str r3, [r4, #0x928]
    bl func_020b377c
    ldr r1, [r4, #0xc]
    rsb r2, r0, #0x200
    mov r0, #0x0
    str r2, [r4, #0x92c]
    str r0, [r4, #0x930]
    cmp r1, #0x0
    bgt .L_1210
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_908:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    mov r0, r0, lsl #0x4
    bl func_020b377c
    mov r2, r0
    ldr r0, _LIT3
    mov r1, #0x3
    bl func_0208e2f4
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    bne .L_96c
    mov r0, #0xca
    sub r1, r0, #0xcb
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x4
    bl func_ov018_021aa51c
    mov r0, #0x0
    str r0, [r4, #0x924]
    str r0, [r4, #0x928]
.L_96c:
    ldr r0, [r4, #0xc]
    sub r0, r0, #0x1000
    str r0, [r4, #0xc]
    cmp r0, #0x0
    bgt .L_1210
    ldr r0, _LIT3
    mov r1, #0x1
    mov r2, #0x0
    bl func_0208e2f4
    ldr r0, _LIT5
    mov r1, #0x11
    mov r2, #0x0
    bl func_0208e2f4
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_9b4:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    mov r0, r0, lsl #0x4
    bl func_020b377c
    mov r6, r0
    ldr r0, _LIT3
    mov r2, r6
    mov r1, #0xb
    bl func_0208e2f4
    ldr r0, _LIT5
    mov r2, r6
    mov r1, #0x1b
    bl func_0208e2f4
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    bne .L_b24
    mov r0, #0x5
    mov r1, #0x6
    mov r2, #0x0
    bl func_ov018_021aa6b4
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x4
    bl func_ov018_021aa51c
    mov r1, #0x0
    ldr r0, _LIT6
    str r1, [r4, #0x924]
    str r1, [r4, #0x928]
    str r1, [r4, #0x944]
    str r1, [r4, #0x948]
    str r1, [r4, #0x94c]
    str r1, [r4, #0x950]
    bl func_0207f79c
    ldr r0, _LIT7
    bl func_0207f774
    mov r0, #0x0
    mov r1, #0x2
    mov r2, r0
    mov r3, r0
    bl func_ov018_021aa7a0
    ldr r0, _LIT8
    mov r2, #0x20
    add r1, r0, #0x20
    bl func_020943b0
    add r1, r4, #0x164
    ldr r0, _LIT8
    add r1, r1, #0x800
    mov r2, #0x20
    bl func_020943b0
    add r0, r4, #0x74
    add r1, r4, #0x78
    add r0, r0, #0x800
    add r1, r1, #0x800
    bl func_ov018_021aa898
    add r0, r4, #0x880
    add r1, r4, #0x74
    add r2, r4, #0x78
    add r3, r4, #0x7c
    str r0, [sp]
    mov r0, #0x0
    add r1, r1, #0x800
    add r2, r2, #0x800
    add r3, r3, #0x800
    bl func_ov018_021aa840
    mov r6, #0x0
.L_ac0:
    mov r1, r6, lsl #0x10
    ldr r0, [r4, #0x880]
    mov r1, r1, lsr #0x10
    bl func_0207e550
    add r1, r6, r6, lsr #0x1f
    mov r3, r6, lsr #0x1f
    rsb r2, r3, r6, lsl #0x1f
    mov r1, r1, asr #0x1
    add r6, r6, #0x1
    add r2, r3, r2, ror #0x1f
    add r1, r4, r1, lsl #0x3
    add r1, r1, r2, lsl #0x2
    str r0, [r1, #0x8d8]
    cmp r6, #0x4
    blt .L_ac0
    mov r2, #0x4000000
    ldr r0, [r2]
    add r1, r2, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x900
    str r0, [r2]
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1a00
    str r0, [r1]
.L_b24:
    ldr r1, [r4, #0xc]
    add r0, r4, #0x2c
    sub r2, r1, #0x1000
    add r1, sp, #0x1c
    add r0, r0, #0x400
    str r2, [r4, #0xc]
    bl func_ov018_021aaa10
    ldr r1, [sp, #0x14]
    add r2, r4, #0x2c
    add r0, r1, r0
    str r0, [sp, #0x14]
    add r1, sp, #0x1c
    add r0, r2, #0x400
    bl func_ov018_021aaaf8
    ldr r2, [sp, #0x14]
    ldr r1, [r4, #0xc]
    add r0, r2, r0
    str r0, [sp, #0x14]
    cmp r1, #0x0
    bgt .L_1210
    ldr r0, _LIT3
    mov r1, #0x9
    mov r2, #0x0
    bl func_0208e2f4
    ldr r0, _LIT5
    mov r1, #0x13
    mov r2, #0x0
    bl func_0208e2f4
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_ba8:
    ldr r0, [r4, #0xc]
    mov r3, #0x4000000
    sub r0, r0, #0x1000
    str r0, [r4, #0xc]
    ldr r0, [r3]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x900
    str r0, [r3]
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bgt .L_1210
    mov r1, #0x0
    mov r2, r1
    add r0, r3, #0x50
    bl func_0208e2f4
    mov r1, #0x0
    ldr r0, _LIT5
    mov r2, r1
    bl func_0208e2f4
    ldr r3, _LIT4
    add r0, r4, #0x900
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r6, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r6, #0x12
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    mov r2, #0x0
    ldrh r1, [r0, #0xb4]
    str r2, [r4, #0xc]
    str r2, [r4, #0x8]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_c38:
    add r1, sp, #0x1c
    add r0, r2, #0x400
    bl func_ov018_021aaa10
    ldr r1, [sp, #0x14]
    add r2, r4, #0x2c
    add r0, r1, r0
    str r0, [sp, #0x14]
    add r1, sp, #0x1c
    add r0, r2, #0x400
    bl func_ov018_021aaaf8
    ldr r1, [sp, #0x14]
    add r0, r1, r0
    str r0, [sp, #0x14]
    b .L_1210
.L_c70:
    add r1, sp, #0x1c
    add r0, r2, #0x400
    bl func_ov018_021aaa10
    ldr r1, [sp, #0x14]
    add r2, r4, #0x2c
    add r0, r1, r0
    str r0, [sp, #0x14]
    add r1, sp, #0x1c
    add r0, r2, #0x400
    bl func_ov018_021aaaf8
    ldr r2, [sp, #0x14]
    ldr r1, [r4, #0xc]
    add r2, r2, r0
    sub r0, r1, #0x1000
    str r2, [sp, #0x14]
    str r0, [r4, #0xc]
    cmp r0, #0x0
    bgt .L_1210
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    mov r2, #0x0
    str r2, [r4, #0xc]
    orr r1, r1, #0x2
    str r2, [r4, #0x8]
    strh r1, [r0, #0xb4]
    b .L_1210
.L_cd8:
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x8]
    sub r2, r1, #0x1000
    str r2, [r4, #0xc]
    cmp r2, r0, asr #0x1
    mov r1, r0, asr #0x1
    blt .L_d74
    sub r0, r0, r2
    mov r0, r0, lsl #0x4
    bl func_020b377c
    add r2, r4, #0x2c
    mov r6, r0
    add r1, sp, #0x1c
    add r0, r2, #0x400
    bl func_ov018_021aaa10
    ldr r1, [sp, #0x14]
    add r2, r4, #0x2c
    add r0, r1, r0
    str r0, [sp, #0x14]
    add r1, sp, #0x1c
    add r0, r2, #0x400
    bl func_ov018_021aaaf8
    ldr r1, [sp, #0x14]
    rsb r7, r6, #0x10
    add r0, r1, r0
    str r0, [sp, #0x14]
    ldr r0, _LIT3
    mov r1, #0x11
    mov r2, #0x8
    mov r3, r7
    str r6, [sp]
    bl func_0208e230
    ldr r0, _LIT5
    mov r3, r7
    mov r1, #0x11
    mov r2, #0x8
    str r6, [sp]
    bl func_0208e230
    b .L_dc8
.L_d74:
    mov r0, r2, lsl #0x3
    bl func_020b377c
    mov r8, #0x4000000
    ldr r1, [r8]
    add r3, r8, #0x1000
    bic r1, r1, #0x1f00
    orr r1, r1, #0x800
    sub r6, r0, #0x8
    str r1, [r8]
    ldr r0, [r3]
    mov r2, r6
    bic r0, r0, #0x1f00
    orr r7, r0, #0x800
    add r0, r8, #0x50
    mov r1, #0x8
    str r7, [r3]
    bl func_0208e2f4
    ldr r0, _LIT5
    mov r2, r6
    mov r1, #0x8
    bl func_0208e2f4
.L_dc8:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bgt .L_1210
    bl func_0208de78
    mov r6, r0
    bl func_0208e138
    mov r7, r0
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x8000
    bl Fill32
    ldr r8, _LIT9
    ldr r0, _LIT10
    ldrh r3, [r8]
    mov r1, #0x1e
    mov r2, #0x18
    and r3, r3, #0x43
    orr r3, r3, #0x1c00
    strh r3, [r8]
    bl func_02001cec
    ldr r0, _LIT11
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c78
    ldr r0, _LIT12
    bl func_0202c06c
    mov r1, #0xe
    mov r8, r0
    bl func_02005488
    rsb r0, r0, #0xf0
    mov r3, r0, asr #0x1
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldr r0, _LIT10
    mov r1, r8
    add r2, r6, #0x20
    bl func_0200506c
    mov r0, #0xe
    mov r1, #0x1
    bl func_02001c78
    ldr r0, _LIT13
    bl func_0202c06c
    mov r1, r0
    mov r0, #0x21
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT10
    add r2, r6, #0x20
    mov r3, #0x1
    bl func_02004f3c
    ldr r0, _LIT10
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_02001e20
    ldr r1, [sp, #0x8]
    mov r0, #0x0
    rsb r1, r1, #0xc0
    mov r2, r1, asr #0x1
    mov r1, r2, asr #0x2
    add r1, r2, r1, lsr #0x1d
    mov r6, r1, asr #0x3
    mov r1, r7
    mov r2, r6, lsl #0x6
    bl Fill32
    add r2, r6, #0x4
    str r6, [sp, #0x8]
    cmp r6, r2
    add r3, r7, r6, lsl #0x6
    mov r7, #0x1
    bge .L_f48
    mov r9, #0xf000
    mov r1, r9
    mov r0, r7
.L_f08:
    strh r1, [r3], #0x2
    str r0, [sp, #0xc]
.L_f10:
    orr r8, r7, #0xf000
    strh r8, [r3], #0x2
    ldr r8, [sp, #0xc]
    add r7, r7, #0x1
    add r8, r8, #0x1
    str r8, [sp, #0xc]
    cmp r8, #0x1f
    blt .L_f10
    strh r9, [r3], #0x2
    ldr r8, [sp, #0x8]
    add r8, r8, #0x1
    str r8, [sp, #0x8]
    cmp r8, r2
    blt .L_f08
.L_f48:
    add r0, r6, #0x4
    str r0, [sp, #0x8]
    cmp r0, #0x18
    bge .L_fa4
    mov r1, #0xe000
    mov r6, #0xf000
    mov r2, #0x1
.L_f64:
    strh r6, [r3], #0x2
    str r2, [sp, #0xc]
.L_f6c:
    orr r0, r7, #0xe000
    strh r0, [r3], #0x2
    ldr r0, [sp, #0xc]
    add r7, r7, #0x1
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    cmp r0, #0x1f
    blt .L_f6c
    strh r1, [r3], #0x2
    ldr r0, [sp, #0x8]
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x18
    blt .L_f64
.L_fa4:
    ldr r0, _LIT14
    ldr r1, _LIT15
    ldr r2, _LIT16
    bl func_02001ba8
    ldr r0, _LIT17
    ldr r1, _LIT18
    mov r2, #0x1f
    bl func_02001ba8
    mov r2, #0x0
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    str r2, [r4, #0xc]
    str r2, [r4, #0x8]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
.L_fe4:
    mov r1, #0x4000000
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x900
    str r0, [r1]
    b .L_1210
.L_ffc:
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    sub r2, r0, #0x1000
    mov r0, r2, lsl #0x3
    rsb r0, r0, #0x0
    str r2, [r4, #0xc]
    bl func_020b377c
    mov r8, #0x4000000
    ldr r1, [r8]
    add r3, r8, #0x1000
    bic r1, r1, #0x1f00
    mov r6, r0
    orr r0, r1, #0x800
    str r0, [r8]
    ldr r0, [r3]
    mov r2, r6
    bic r0, r0, #0x1f00
    orr r7, r0, #0x800
    add r0, r8, #0x50
    mov r1, #0x8
    str r7, [r3]
    bl func_0208e2f4
    ldr r0, _LIT5
    mov r2, r6
    mov r1, #0x8
    bl func_0208e2f4
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bgt .L_1210
    ldr r6, _LIT9
    mov r1, #0x0
    ldrh r0, [r6]
    mov r2, r1
    mov r3, r1
    and r0, r0, #0x43
    orr r7, r0, #0x1c80
    mov r0, #0x4
    strh r7, [r6]
    bl func_ov018_021aa51c
    mov r2, #0x0
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    str r2, [r4, #0xc]
    str r2, [r4, #0x8]
    orr r1, r1, #0x2
    strh r1, [r0, #0xb4]
    b .L_1210
_LIT0: .word data_ov018_021ad780
_LIT1: .word data_ov018_021ad7c8
_LIT2: .word data_ov018_021ad7d8
_LIT3: .word 0x04000050
_LIT4: .word 0x04001000
_LIT5: .word 0x04001050
_LIT6: .word data_ov018_021ad7a4
_LIT7: .word data_ov018_021ad790
_LIT8: .word 0x05000600
_LIT9: .word 0x04000008
_LIT10: .word data_02102bb0
_LIT11: .word data_02104e6c
_LIT12: .word 0x00000323
_LIT13: .word 0x00000322
_LIT14: .word 0x050001c0
_LIT15: .word 0x00007fff
_LIT16: .word 0x00000421
_LIT17: .word 0x050001e0
_LIT18: .word 0x000003ff
.L_1104:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    bne .L_11f4
    bl func_0208de78
    mov r6, r0
    bl func_0208e138
    mov r7, r0
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x800
    bl Fill32
    mov r0, #0x0
    mov r1, r6
    mov r2, #0x8000
    bl Fill32
    ldr r0, _LIT10
    mov r1, #0x1e
    mov r2, #0x18
    bl func_02001cec
    ldr r0, _LIT11
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    mov r0, #0xe
    mov r1, #0x1
    bl func_02001c78
    mov r0, #0x2d
    bl func_0202c06c
    mov r1, #0xe
    mov r8, r0
    bl func_02005488
    rsb r0, r0, #0xf0
    mov r3, r0, asr #0x1
    mov r0, #0x5a
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldr r0, _LIT10
    mov r1, r8
    add r2, r6, #0x20
    bl func_02004f3c
    mov r9, #0x1
    mov r8, #0x0
    mov r0, #0xf000
    mov r3, #0xe000
    mov r2, r9
.L_11c0:
    mov r6, r2
    strh r3, [r7], #0x2
.L_11c8:
    orr r1, r9, #0xe000
    add r6, r6, #0x1
    cmp r6, #0x1f
    strh r1, [r7], #0x2
    add r9, r9, #0x1
    blt .L_11c8
    add r8, r8, #0x1
    cmp r8, #0x18
    strh r0, [r7], #0x2
    blt .L_11c0
    bl func_0200852c
.L_11f4:
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    ldr r2, [r4, #0xc]
    add r2, r2, #0x1
    orr r1, r1, #0x2
    str r2, [r4, #0xc]
    strh r1, [r0, #0xb4]
.L_1210:
    add r7, r4, #0x2c
    add r8, r4, #0x10
    mov r9, #0x0
    add r6, sp, #0x10
.L_1220:
    ldr r0, [r6, r9, lsl #0x2]
    cmp r0, #0x0
    ble .L_1240
    mov r2, r0, lsl #0x10
    mov r0, r8
    mov r1, r7
    mov r2, r2, lsr #0x10
    bl func_0207ef74
.L_1240:
    add r0, r7, #0x1c
    add r1, r8, #0x1c
    add r9, r9, #0x1
    cmp r9, #0x2
    add r7, r0, #0x400
    add r8, r1, #0x400
    blt .L_1220
    ldr r0, [r4]
    cmp r0, #0xe
    addls pc, pc, r0, lsl #0x2
    b .L_12b4
    b .L_12b4
    b .L_12b4
    b .L_12a8
    b .L_12a8
    b .L_12a8
    b .L_12a8
    b .L_12a8
    b .L_12a8
    b .L_12a8
    b .L_12a8
    b .L_12a8
    b .L_12a8
    b .L_12b4
    b .L_12b4
    b .L_12b0
.L_12a8:
    bl func_ov018_021aac84
    b .L_12b4
.L_12b0:
    bl func_ov018_021aacfc
.L_12b4:
    bl func_02006178
    cmp r0, #0x0
    bne .L_132c
    ldr r0, [r4]
    cmp r0, #0x11
    addls pc, pc, r0, lsl #0x2
    b .L_132c
    b .L_132c
    b .L_132c
    b .L_1318
    b .L_1318
    b .L_1318
    b .L_1318
    b .L_1318
    b .L_1318
    b .L_1318
    b .L_1318
    b .L_1318
    b .L_1318
    b .L_132c
    b .L_132c
    b .L_1320
    b .L_132c
    b .L_132c
    b .L_1328
.L_1318:
    bl func_ov018_021aacb0
    b .L_132c
.L_1320:
    bl func_ov018_021aaf74
    b .L_132c
.L_1328:
    bl func_ov018_021ab05c
.L_132c:
    add r1, r4, #0x900
    ldrh r3, [r1, #0xb4]
    mov r0, r3, lsl #0x1d
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_13ec
    ldr r2, [r4]
    bic r3, r3, #0x4
    add r0, r4, #0x1b4
    strh r3, [r1, #0xb4]
    cmp r2, #0x11
    add r3, r0, #0x800
    addls pc, pc, r2, lsl #0x2
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ac
    b .L_13ac
    b .L_13ac
    b .L_13ac
    b .L_13ac
    b .L_13ac
    b .L_13ac
    b .L_13ac
    b .L_13ac
    b .L_13ac
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13ec
    b .L_13d4
.L_13ac:
    ldr r0, _LIT0
    mov r1, #0x3c000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    ldrh r0, [r3]
    mov r1, #0xc
    str r1, [r4]
    bic r0, r0, #0x2
    strh r0, [r3]
    b .L_13ec
.L_13d4:
    ldr r0, _LIT0
    mov r1, #0x1e000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x12
    str r0, [r4]
.L_13ec:
    add r0, r4, #0x900
    ldrh r2, [r0, #0xb4]
    mov r1, r2, lsl #0x1e
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    bne .L_1778
    ldr r1, [r4]
    bic r2, r2, #0x2
    strh r2, [r0, #0xb4]
    cmp r1, #0x13
    addls pc, pc, r1, lsl #0x2
    b .L_17c8
    b .L_17c8
    b .L_146c
    b .L_1488
    b .L_14a4
    b .L_1514
    b .L_14c0
    b .L_14dc
    b .L_14f8
    b .L_1530
    b .L_154c
    b .L_1568
    b .L_1584
    b .L_15a0
    b .L_15bc
    b .L_15c8
    b .L_15e4
    b .L_16a8
    b .L_16e0
    b .L_1728
    b .L_1708
.L_146c:
    ldr r0, _LIT0
    mov r1, #0x1e000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x2
    str r0, [r4]
    b .L_17c8
.L_1488:
    ldr r0, _LIT0
    mov r1, #0x1e000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x3
    str r0, [r4]
    b .L_17c8
.L_14a4:
    ldr r0, _LIT0
    mov r1, #0x3c000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x5
    str r0, [r4]
    b .L_17c8
.L_14c0:
    ldr r0, _LIT0
    mov r1, #0x1e000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x6
    str r0, [r4]
    b .L_17c8
.L_14dc:
    ldr r0, _LIT0
    mov r1, #0x3c000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x7
    str r0, [r4]
    b .L_17c8
.L_14f8:
    ldr r0, _LIT0
    mov r1, #0x5a000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x4
    str r0, [r4]
    b .L_17c8
.L_1514:
    ldr r0, _LIT0
    mov r1, #0x1e000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x8
    str r0, [r4]
    b .L_17c8
.L_1530:
    ldr r0, _LIT0
    mov r1, #0x5a000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x9
    str r0, [r4]
    b .L_17c8
.L_154c:
    ldr r0, _LIT0
    mov r1, #0x3c000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0xa
    str r0, [r4]
    b .L_17c8
.L_1568:
    ldr r0, _LIT0
    mov r1, #0x5a000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0xb
    str r0, [r4]
    b .L_17c8
.L_1584:
    ldr r0, _LIT0
    mov r1, #0x5a000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0xd
    str r0, [r4]
    b .L_17c8
.L_15a0:
    ldr r0, _LIT0
    mov r1, #0x5a000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0xe
    str r0, [r4]
    b .L_17c8
.L_15bc:
    mov r0, #0xe
    str r0, [r4]
    b .L_17c8
.L_15c8:
    ldr r0, _LIT0
    mov r1, #0x3c000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0xf
    str r0, [r4]
    b .L_17c8
.L_15e4:
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    bne .L_1634
    ldr r2, _LIT19
    mov r3, #0x1
    mov r0, #0x8f00000
    mov r1, #0x1e
    str r3, [r2, #0x3c]
    bl func_02036540
    ldr r0, _LIT20
    mov r1, #0x1e
    bl func_02036540
    ldr r0, _LIT0
    mov r1, #0x1e000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x14
    str r0, [r4]
    mov r5, #0x1
    b .L_17c8
.L_1634:
    ldrh r0, [r0, #0xb4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_168c
    ldr r2, _LIT19
    mov r3, #0x2
    mov r0, #0x8f00000
    mov r1, #0x1e
    str r3, [r2, #0x3c]
    bl func_02036540
    ldr r0, _LIT20
    mov r1, #0x1e
    bl func_02036540
    ldr r0, _LIT0
    mov r1, #0x1e000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x14
    str r0, [r4]
    mov r5, #0x1
    b .L_17c8
.L_168c:
    ldr r0, _LIT0
    mov r1, #0x3c000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x10
    str r0, [r4]
    b .L_17c8
.L_16a8:
    mov r0, #0x8f00000
    mov r1, #0x0
    bl func_02036540
    ldr r0, _LIT20
    mov r1, #0x0
    bl func_02036540
    mov r0, #0x36
    sub r1, r0, #0x37
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x11
    str r0, [r4]
    b .L_17c8
.L_16e0:
    ldr r0, _LIT0
    mov r2, #0x0
    str r2, [r0, #0x50]
    ldr r1, _LIT19
    mov r3, #0x2
    str r2, [r0, #0x54]
    mov r0, #0x13
    str r3, [r1, #0x3c]
    str r0, [r4]
    b .L_17c8
.L_1708:
    ldr r0, _LIT0
    mov r1, #0x1e000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x14
    str r0, [r4]
    mov r5, #0x1
    b .L_17c8
.L_1728:
    mov r1, #0x0
    ldr r0, _LIT0
    str r1, [r4, #0x4]
    mov r1, #0x1e000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    bl func_02037ae4
    mvn r1, #0x0
    cmp r0, r1
    bne .L_176c
    mov r0, #0x0
    bl func_020379a8
    mov r2, #0x0
    sub r3, r2, #0x1
    mov r0, #0x30
    mov r1, #0x1
    bl func_0203737c
.L_176c:
    mov r0, #0xd
    str r0, [r4]
    b .L_17c8
.L_1778:
    ldr r0, [r4]
    cmp r0, #0xe
    bne .L_17c8
    bl func_02037ae4
    mvn r1, #0x0
    cmp r0, r1
    bne .L_17c8
    mov r0, #0x8f00000
    mov r1, #0x0
    bl func_02036540
    ldr r0, _LIT20
    mov r1, #0x0
    bl func_02036540
    ldr r0, _LIT0
    mov r1, #0x1e000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
    mov r0, #0x14
    str r0, [r4]
    mov r5, #0x1
.L_17c8:
    mov r0, r5
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT19: .word data_02103fcc
_LIT20: .word 0x08f00003
