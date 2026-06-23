; func_ov011_021cace0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d37c8
        .extern data_ov011_021d3810
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_020060f4
        .extern func_02006bf0
        .extern func_02013980
        .extern func_020371b8
        .extern func_ov000_021ab40c
        .extern func_ov000_021ab4f8
        .extern func_ov000_021ab54c
        .extern func_ov000_021ab5a8
        .extern func_ov000_021ab818
        .extern func_ov000_021adabc
        .extern func_ov000_021af3ec
        .extern func_ov011_021c9db8
        .extern func_ov011_021ca320
        .extern func_ov011_021ca908
        .extern func_ov011_021cac28
        .extern func_ov011_021cac3c
        .extern func_ov011_021cd690
        .extern func_ov011_021cef84
        .extern func_ov011_021cf218
        .extern func_ov011_021d1c28
        .global func_ov011_021cace0
        .arm
func_ov011_021cace0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    add r0, sp, #0x4
    add r1, sp, #0x0
    ldr r4, _LIT0
    mov r5, #0x0
    bl func_020060f4
    ldr r0, _LIT1
    ldr r3, [sp, #0x4]
    ldr r2, [r0, #0x238]
    ldr r1, [r0, #0x2bc]
    add r3, r3, r2, asr #0xc
    ldr r2, [sp]
    ldr r0, [r0, #0x23c]
    mov r1, r1, lsl #0x16
    add r0, r2, r0, asr #0xc
    str r0, [sp]
    str r3, [sp, #0x4]
    movs r0, r1, lsr #0x1f
    beq .L_8c
    ldr r0, [r4, #0x264]
    cmp r0, #0x0
    beq .L_6c
    cmp r0, #0x1
    beq .L_7c
    b .L_17c
.L_6c:
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x17
    mov r5, r0, lsr #0x1c
    b .L_17c
.L_7c:
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0xf
    mov r5, r0, lsr #0x1c
    b .L_17c
.L_8c:
    cmp r6, #0x0
    beq .L_fc
    ldr r0, [r4, #0x230]
    ldr r1, [r4, #0x234]
    mov r0, r0, asr #0xc
    mov r1, r1, asr #0xc
    str r0, [sp, #0x4]
    str r1, [sp]
    bl func_ov011_021ca320
    ldr r1, [r4, #0x264]
    and r5, r0, #0xf
    cmp r1, #0x0
    beq .L_cc
    cmp r1, #0x1
    beq .L_e4
    b .L_17c
.L_cc:
    ldr r1, [r4, #0x268]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0x1e0
    orr r0, r1, r0, lsr #0x17
    str r0, [r4, #0x268]
    b .L_17c
.L_e4:
    ldr r1, [r4, #0x268]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0x1e000
    orr r0, r1, r0, lsr #0xf
    str r0, [r4, #0x268]
    b .L_17c
.L_fc:
    bl func_ov011_021d1c28
    cmp r0, #0x0
    bne .L_17c
    bl func_ov011_021cf218
    cmp r0, #0x0
    beq .L_17c
    ldr r0, [r4, #0x278]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    bne .L_17c
    ldr r0, [sp, #0x4]
    ldr r1, [sp]
    bl func_ov011_021ca320
    ands r5, r0, #0xf
    beq .L_17c
    ldr r0, [r4, #0x264]
    cmp r0, #0x0
    beq .L_150
    cmp r0, #0x1
    beq .L_168
    b .L_17c
.L_150:
    ldr r1, [r4, #0x268]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0x1e0
    orr r0, r1, r0, lsr #0x17
    str r0, [r4, #0x268]
    b .L_17c
.L_168:
    ldr r1, [r4, #0x268]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0x1e000
    orr r0, r1, r0, lsr #0xf
    str r0, [r4, #0x268]
.L_17c:
    ldr r0, [r4, #0x280]
    cmp r5, #0x0
    bic r1, r0, #0x200
    addeq sp, sp, #0x8
    str r1, [r4, #0x280]
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r1, lsl #0x17
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r1, lsl #0x18
    cmp r5, r0, lsr #0x18
    mov r0, r0, lsr #0x18
    bne .L_200
    ldr r1, [r4, #0x270]
    mov r2, r1, lsl #0x10
    mov r2, r2, lsr #0x18
    mov r1, r1, lsl #0x18
    cmp r2, r1, lsr #0x18
    bne .L_200
    ldr r1, [r4, #0x240]
    mov r2, r1, lsl #0x1d
    mov r2, r2, lsr #0x1d
    mov r1, r1, lsl #0x1a
    cmp r2, r1, lsr #0x1d
    bne .L_200
    ldr r1, [r4, #0x258]
    mov r2, r1, lsl #0x6
    mov r2, r2, lsr #0x18
    mov r1, r1, lsl #0xe
    cmp r2, r1, lsr #0x18
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
.L_200:
    cmp r0, r5
    beq .L_2b4
    ldr r0, [r4, #0x280]
    mov r1, #0x3f
    bic r2, r0, #0xff
    and r0, r5, #0xff
    orr r0, r2, r0
    orr r3, r0, #0x100
    mov r2, r1
    mov r0, #0x0
    str r3, [r4, #0x280]
    bl func_ov000_021ab54c
    mov r0, #0x0
    mov r1, #0x9
    mov r2, #0x2
    bl func_ov000_021ab4f8
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x10
    bl func_ov000_021ab5a8
    bl func_ov000_021ab818
    mov r0, #0x0
    mov r1, #0x9
    bl func_ov000_021ab40c
    mov r0, #0x10000
    ldr r1, [r4, #0x26c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    cmp r6, #0x0
    str r0, [r4, #0x26c]
    ldreq r0, [r4, #0x264]
    cmpeq r0, #0x0
    bne .L_2b4
    .word 0xebff98f5
    cmp r0, #0x0
    beq .L_2b4
    ldr r0, [r4, #0x284]
    mov r0, r0, lsl #0x3
    movs r0, r0, lsr #0x1f
    bne .L_2b4
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_2b4:
    cmp r5, #0x0
    beq .L_440
    ldr r0, [r4, #0x264]
    cmp r0, #0x0
    beq .L_2d4
    cmp r0, #0x1
    beq .L_320
    b .L_368
.L_2d4:
    ldr r6, _LIT2
    ldr r0, _LIT3
    ldrh r3, [r6]
    sub r2, r5, #0x1
    mov r1, #0x4
    and r3, r3, #0x43
    orr r3, r3, #0x4
    orr r3, r3, #0x5800
    strh r3, [r6]
    ldr r0, [r0, r2, lsl #0x2]
    mov r2, #0x0
    bl func_02006bf0
    mov r1, r6
    str r0, [r4, #0x298]
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1]
    b .L_368
.L_320:
    ldr r6, _LIT4
    ldr r3, _LIT5
    ldrh r1, [r6]
    mov r0, #0x28
    sub r2, r5, #0x1
    and r1, r1, #0x43
    orr r1, r1, #0x4
    orr r1, r1, #0xf800
    strh r1, [r6]
    ldr r5, [r4, #0x268]
    mov r1, #0x4
    mov r5, r5, lsl #0x17
    mov r5, r5, lsr #0x1c
    mla r0, r5, r0, r3
    ldr r0, [r0, r2, lsl #0x2]
    mov r2, #0x0
    bl func_02006bf0
    str r0, [r4, #0x298]
.L_368:
    ldr r0, [r4, #0x270]
    mov r1, r0, lsl #0xf
    movs r1, r1, lsr #0x1f
    beq .L_384
    bic r0, r0, #0x10000
    str r0, [r4, #0x270]
    bl func_ov000_021adabc
.L_384:
    ldr r0, [r4, #0x264]
    cmp r0, #0x0
    beq .L_3bc
    cmp r0, #0x1
    bne .L_3ec
    mov r0, #0x0
    bl func_ov011_021cac28
    mov r0, #0x1
    bl func_ov011_021c9db8
    ldr r0, [r4, #0x258]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x18
    bl func_ov011_021cac3c
    b .L_3ec
.L_3bc:
    bl func_02013980
    mov r2, r0
    mov r0, #0x0
    mov r1, #0x42
    bl func_ov000_021af3ec
    bl func_ov011_021cef84
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    bl func_ov011_021cd690
    mov r0, #0x0
    bl func_ov011_021c9db8
.L_3ec:
    ldr r6, [r4, #0x270]
    ldr r3, [r4, #0x240]
    ldr r1, [r4, #0x258]
    mov r5, r6, lsl #0x18
    mov r2, r3, lsl #0x1d
    mov r0, r1, lsl #0xe
    mov r5, r5, lsr #0x18
    mov r2, r2, lsr #0x1d
    mov r0, r0, lsr #0x18
    bic r6, r6, #0xff00
    mov r5, r5, lsl #0x18
    orr r5, r6, r5, lsr #0x10
    bic r3, r3, #0x38
    mov r2, r2, lsl #0x1d
    orr r2, r3, r2, lsr #0x1a
    bic r1, r1, #0x3fc0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x6
    str r5, [r4, #0x270]
    str r2, [r4, #0x240]
    str r0, [r4, #0x258]
.L_440:
    bl func_ov011_021cf218
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov011_021ca908
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov011_021d3f5c
_LIT1: .word data_ov011_021d3f20
_LIT2: .word 0x0400000e
_LIT3: .word data_ov011_021d37c8
_LIT4: .word 0x04000008
_LIT5: .word data_ov011_021d3810
