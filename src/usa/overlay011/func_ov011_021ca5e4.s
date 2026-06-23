; func_ov011_021ca5e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee8c
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_ov000_021ab3dc
        .extern func_ov000_021ab40c
        .extern func_ov000_021ab4f8
        .extern func_ov000_021ab54c
        .extern func_ov000_021ab5a8
        .global func_ov011_021ca5e4
        .arm
func_ov011_021ca5e4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2bc]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1f
    beq .L_124
    ldr r0, [r4, #0x264]
    cmp r0, #0x0
    bne .L_100
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1c
    beq .L_100
    ldr r2, [r4, #0x26c]
    mov r0, #0x10000
    mov r1, r2, lsl #0x10
    mov r1, r1, asr #0x10
    rsb r0, r0, #0x0
    add r1, r1, #0x2a
    and r2, r2, r0
    mov r1, r1, lsl #0x10
    orr r2, r2, r1, lsr #0x10
    mov r1, r2, lsl #0x10
    mov r1, r1, asr #0x10
    str r2, [r4, #0x26c]
    cmp r1, #0x0
    ble .L_10c
    cmp r1, #0xff
    blt .L_90
    ldr r1, [r4, #0x280]
    and r0, r2, r0
    orr r2, r0, #0xff
    bic r0, r1, #0x100
    str r2, [r4, #0x26c]
    str r0, [r4, #0x280]
.L_90:
    ldr r0, [r4, #0x26c]
    mov r1, #0x3f
    mov r0, r0, lsl #0x10
    mov r5, r0, asr #0x10
    mov r2, r5, lsl #0xe
    ldr r3, _LIT2
    mov r0, r2, lsr #0x1f
    smull r2, ip, r3, r2
    add ip, ip, r5, lsl #0xe
    add ip, r0, ip, asr #0x7
    mov r2, ip, asr #0x4
    ldr r0, _LIT3
    mov r2, r2, lsl #0x2
    ldrsh r3, [r0, r2]
    mov r2, r1
    mov r0, #0x0
    mov r3, r3, lsl #0x4
    mov r5, r3, asr #0xc
    bl func_ov000_021ab54c
    mov r0, #0x0
    mov r1, #0x8
    mov r2, #0x2
    bl func_ov000_021ab4f8
    mov r1, r5
    rsb r2, r5, #0x10
    mov r0, #0x0
    bl func_ov000_021ab5a8
    b .L_10c
.L_100:
    ldr r0, [r4, #0x280]
    bic r0, r0, #0x100
    str r0, [r4, #0x280]
.L_10c:
    ldr r0, [r4, #0x264]
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x8
    mov r0, #0x0
    bl func_ov000_021ab3dc
.L_124:
    ldr r0, [r4, #0x264]
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x268]
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1c
    beq .L_2d0
    ldr r1, [r4, #0x280]
    mov r0, r1, lsl #0xa
    mov r0, r0, lsr #0x1c
    cmp r0, #0x1
    beq .L_168
    cmp r0, #0x2
    beq .L_1b4
    cmp r0, #0x3
    beq .L_244
    ldmia sp!, {r3, r4, r5, pc}
.L_168:
    mov r1, #0x3f
    mov r2, r1
    mov r0, #0x0
    bl func_ov000_021ab54c
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    bl func_ov000_021ab4f8
    mov r0, #0x0
    mov r1, #0x1
    bl func_ov000_021ab3dc
    ldr r1, [r4, #0x280]
    mov r0, r1, lsl #0xa
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x1
    bic r1, r1, #0x3c0000
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0xa
    str r0, [r4, #0x280]
.L_1b4:
    ldr r2, [r4, #0x26c]
    mov r0, #0x10000
    mov r1, r2, lsl #0x10
    mov r1, r1, asr #0x10
    rsb r0, r0, #0x0
    add r1, r1, #0x2
    and r2, r2, r0
    mov r1, r1, lsl #0x10
    orr r2, r2, r1, lsr #0x10
    mov r1, r2, lsl #0x10
    mov r1, r1, asr #0x10
    cmp r1, #0xff
    str r2, [r4, #0x26c]
    andgt r0, r2, r0
    strgt r0, [r4, #0x26c]
    ldr r0, [r4, #0x26c]
    mov r0, r0, lsl #0x10
    movs r4, r0, asr #0x10
    ldmmiia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r2, r4, lsl #0xf
    smull r0, r3, r1, r2
    add r3, r3, r4, lsl #0xf
    mov r0, r2, lsr #0x1f
    add r3, r0, r3, asr #0x7
    mov r1, r3, asr #0x4
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r2, [r0, r1]
    mov r1, #0xa
    mov r0, #0x0
    smulbb r1, r2, r1
    mov r1, r1, asr #0xc
    rsb r2, r1, #0x10
    bl func_ov000_021ab5a8
    ldmia sp!, {r3, r4, r5, pc}
.L_244:
    ldr r0, [r4, #0x26c]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    subs r5, r0, #0x20
    bpl .L_270
    mov r5, #0x0
    bic r2, r1, #0x3c0000
    mov r0, r5
    mov r1, #0x1
    str r2, [r4, #0x280]
    bl func_ov000_021ab40c
.L_270:
    ldr r1, _LIT2
    mov r2, r5, lsl #0xf
    smull r0, r3, r1, r2
    mov r0, #0x10000
    add r3, r3, r5, lsl #0xf
    mov r1, r2, lsr #0x1f
    add r3, r1, r3, asr #0x7
    mov r2, r3, asr #0x4
    ldr r1, _LIT3
    mov r2, r2, lsl #0x2
    ldrsh r2, [r1, r2]
    mov r1, #0xa
    ldr r3, [r4, #0x26c]
    smulbb r1, r2, r1
    rsb r0, r0, #0x0
    and r2, r3, r0
    mov r0, r5, lsl #0x10
    orr r3, r2, r0, lsr #0x10
    mov r1, r1, asr #0xc
    rsb r2, r1, #0x10
    mov r0, #0x0
    str r3, [r4, #0x26c]
    bl func_ov000_021ab5a8
    ldmia sp!, {r3, r4, r5, pc}
.L_2d0:
    mov r0, #0x0
    mov r1, #0x1
    bl func_ov000_021ab40c
    ldr r1, [r4, #0x280]
    mov r0, r1, lsl #0xa
    mov r0, r0, lsr #0x1c
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x10000
    bic r1, r1, #0x3c0000
    orr r2, r1, #0x40000
    ldr r1, [r4, #0x26c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    str r2, [r4, #0x280]
    str r0, [r4, #0x26c]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word 0x80808081
_LIT3: .word data_020bee8c
