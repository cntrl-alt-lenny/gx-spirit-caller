; func_ov008_021abcdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov008_021b23b8
        .extern data_ov008_021b2780
        .extern data_ov008_021b2790
        .extern data_ov008_021b2dc0
        .extern data_ov008_021b2dc8
        .extern func_0207e840
        .extern func_0207e910
        .extern func_0207fd08
        .extern func_0207fd28
        .extern func_ov008_021ab008
        .extern func_ov008_021ab484
        .extern func_ov008_021abbf0
        .extern func_ov008_021b1ee0
        .global func_ov008_021abcdc
        .arm
func_ov008_021abcdc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    ldr r2, _LIT0
    ldr r0, _LIT1
    ldrh r4, [r2]
    ldrh r3, [r2, #0x2]
    add r1, sp, #0x10
    strh r4, [sp, #0x10]
    strh r3, [sp, #0x12]
    ldrh ip, [r2, #0x4]
    ldrh r4, [r2, #0x6]
    ldr r3, _LIT2
    mov r2, #0x4
    strh ip, [sp, #0x14]
    strh r4, [sp, #0x16]
    bl func_ov008_021ab008
    ldr r0, _LIT3
    ldrh r0, [r0]
    cmp r0, #0x6
    bcc .L_144
    cmp r0, #0x9
    bcc .L_184
.L_144:
    ldr r0, _LIT3
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x1
    movne r0, #0x8
    moveq r0, #0x7
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, #0xe3
    mov r1, #0xa4
    str r2, [sp, #0xc]
    bl func_ov008_021ab484
.L_184:
    ldr r0, _LIT3
    ldrh r0, [r0]
    cmp r0, #0x6
    bcc .L_19c
    cmp r0, #0xa
    bcc .L_328
.L_19c:
    ldr r0, _LIT3
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r1, #0x400
    tst r0, #0x2
    movne r0, #0x1
    moveq r0, #0x0
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r3, r2
    mov r1, #0xa4
    str r2, [sp, #0xc]
    bl func_ov008_021ab484
    ldr r0, _LIT3
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x4
    movne r0, #0x3
    moveq r0, #0x2
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, #0x2e
    mov r1, #0xa4
    str r2, [sp, #0xc]
    bl func_ov008_021ab484
    ldr r0, _LIT3
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x8
    movne r0, #0x5
    moveq r0, #0x4
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, #0x4a
    mov r1, #0xa4
    str r2, [sp, #0xc]
    bl func_ov008_021ab484
    mov r0, #0x1e
    str r0, [sp]
    mov r0, #0x2
    mov r2, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r3, r2
    mov r0, #0xd
    mov r1, #0x7
    str r2, [sp, #0xc]
    bl func_ov008_021ab484
    mov r2, #0x0
    str r2, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, #0x6c
    mov r1, #0xac
    mov r3, #0x1
    str r2, [sp, #0xc]
    bl func_ov008_021ab484
    ldr r0, _LIT3
    ldr r1, [r0, #0x638]
    cmp r1, #0x0
    ble .L_328
    ldr r4, [r0, #0x5c0]
    mov r1, #0x1000
    mov r0, r4
    bl func_0207fd28
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_2f4
    ldr r0, _LIT3
    ldr r1, [r0, #0x638]
    add r1, r1, #0x1
    str r1, [r0, #0x638]
    b .L_328
.L_2f4:
    mov r0, r4
    bl func_0207e840
    mov r0, r4
    mov r1, #0x0
    bl func_0207e910
    mov r0, r4
    mov r1, #0x0
    bl func_0207fd08
    mov r1, #0x1
    ldr r0, _LIT3
    str r1, [r4, #0x8]
    mov r1, #0x0
    str r1, [r0, #0x638]
.L_328:
    mov r0, #0x1d
    str r0, [sp]
    mov r0, #0x2
    mov r2, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r3, r2
    mov r0, #0x81
    mov r1, #0x3
    str r2, [sp, #0xc]
    bl func_ov008_021ab484
    ldr r1, _LIT4
    ldr r0, _LIT5
    ldrh r1, [r1, #0x4]
    ldr r2, [r0, #0xa60]
    ldr r4, _LIT6
    mov r0, r1, lsl #0x10
    mov r1, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    add lr, r0, r1, lsr #0x18
    mov ip, #0x34
    mov r0, #0xe4
    mov r1, #0x2
    mov r3, #0x0
    mla r4, lr, ip, r4
    bl func_ov008_021abbf0
    ldr r0, _LIT3
    ldrh r0, [r0]
    cmp r0, #0x6
    bcc .L_3ac
    cmp r0, #0xa
    bcc .L_3d8
.L_3ac:
    ldrh r2, [r4, #0x8]
    mov r0, #0x52
    mov r1, #0x6
    mov r3, #0x1
    bl func_ov008_021abbf0
    ldr r1, _LIT7
    mov r0, #0xd1
    ldr r2, [r1, #0x18]
    mov r1, #0xaa
    mov r3, #0x0
    bl func_ov008_021abbf0
.L_3d8:
    ldr r0, _LIT3
    ldrh r0, [r0]
    cmp r0, #0x1
    addcc sp, sp, #0x18
    ldmccia sp!, {r4, pc}
    cmp r0, #0x5
    addhi sp, sp, #0x18
    ldmhiia sp!, {r4, pc}
    bl func_ov008_021b1ee0
    cmp r0, #0x0
    beq .L_444
    ldr r0, _LIT3
    mov r1, #0x0
    ldr r0, [r0, #0x634]
    mov r2, r1
    tst r0, #0x400
    movne r0, #0x18
    moveq r0, #0x17
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r3, r1
    mov r0, #0xe3
    str r1, [sp, #0xc]
    bl func_ov008_021ab484
.L_444:
    ldr r0, _LIT3
    ldr r1, [r0, #0x634]
    bic r1, r1, #0x400
    str r1, [r0, #0x634]
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b23b8
_LIT1: .word 0x0500060e
_LIT2: .word 0x00600100
_LIT3: .word data_ov008_021b2780
_LIT4: .word data_ov008_021b2dc0
_LIT5: .word data_02104f4c
_LIT6: .word data_ov008_021b2790
_LIT7: .word data_ov008_021b2dc8
