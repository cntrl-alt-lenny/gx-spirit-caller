; func_ov012_021ca370 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov012_021cc010
        .extern data_ov012_021cc108
        .extern data_ov012_021cc5fc
        .extern func_020060f4
        .extern func_02006178
        .extern func_02006bf0
        .extern func_02013980
        .extern func_0202c06c
        .extern func_ov000_021ab40c
        .extern func_ov000_021adc64
        .extern func_ov000_021af474
        .extern func_ov012_021ca28c
        .extern func_ov012_021ca31c
        .extern func_ov012_021cae64
        .global func_ov012_021ca370
        .arm
func_ov012_021ca370:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0xc0
    ldr r4, _LIT0
    bl func_02006178
    cmp r0, #0x0
    beq .L_24
    bl func_ov012_021cae64
    cmp r0, #0x0
    beq .L_44
.L_24:
    ldr r0, _LIT1
    ldrh r0, [r0, #0x54]
    tst r0, #0xf0
    bne .L_44
    ldr r0, [r4, #0x16c]
    mov r0, r0, lsl #0xe
    movs r0, r0, lsr #0x1e
    beq .L_260
.L_44:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    ldr r3, [sp, #0x4]
    ldr r0, [r4, #0x148]
    ldr r2, [sp]
    ldr r1, [r4, #0x14c]
    add r0, r3, r0, asr #0xc
    add r1, r2, r1, asr #0xc
    ldr r2, _LIT1
    str r0, [sp, #0x4]
    str r1, [sp]
    ldrh r2, [r2, #0x54]
    tst r2, #0xf0
    bne .L_90
    ldr r2, [r4, #0x16c]
    mov r2, r2, lsl #0xe
    movs r2, r2, lsr #0x1e
    beq .L_a0
.L_90:
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r5, r0, lsr #0x1c
    b .L_ec
.L_a0:
    bl func_ov012_021ca28c
    ldr r1, [r4, #0x15c]
    mov r5, r0
    cmp r1, #0x0
    beq .L_c0
    cmp r1, #0x1
    beq .L_d8
    b .L_ec
.L_c0:
    ldr r1, [r4, #0x160]
    and r0, r5, #0xf
    bic r1, r1, #0xf
    orr r0, r1, r0
    str r0, [r4, #0x160]
    b .L_ec
.L_d8:
    ldr r1, [r4, #0x160]
    mov r0, r5, lsl #0x1c
    bic r1, r1, #0xf0
    orr r0, r1, r0, lsr #0x18
    str r0, [r4, #0x160]
.L_ec:
    ldr r0, [r4, #0x16c]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, r5
    beq .L_260
    ldr ip, _LIT2
    add r6, sp, #0x8
    ldmia ip!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia ip, {r0, r1}
    stmia r6, {r0, r1}
    ldr r6, _LIT3
    add lr, sp, #0x20
    mov ip, #0xa
.L_124:
    ldmia r6!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_124
    ldr r1, [r4, #0x16c]
    and r0, r5, #0xff
    bic r1, r1, #0xff
    orr r2, r1, r0
    mov r0, #0x0
    mov r1, #0x1
    str r2, [r4, #0x16c]
    bl func_ov000_021ab40c
    ldr r1, [r4, #0x160]
    ldr r0, _LIT4
    cmp r5, #0x0
    and r0, r1, r0
    str r0, [r4, #0x160]
    beq .L_22c
    ldr r0, [r4, #0x15c]
    cmp r0, #0x0
    beq .L_184
    cmp r0, #0x1
    beq .L_1bc
    b .L_200
.L_184:
    ldr ip, _LIT5
    add r0, sp, #0x8
    ldrh r3, [ip]
    sub r2, r5, #0x1
    mov r1, #0x4
    and r3, r3, #0x43
    orr r3, r3, #0x384
    orr r3, r3, #0x3c00
    strh r3, [ip]
    ldr r0, [r0, r2, lsl #0x2]
    mov r2, #0x0
    bl func_02006bf0
    str r0, [r4, #0x184]
    b .L_200
.L_1bc:
    ldr ip, _LIT5
    add r0, sp, #0x0
    ldrh r2, [ip]
    sub r3, r5, #0x1
    mov r1, #0x4
    and r2, r2, #0x43
    orr r2, r2, #0x4
    orr r2, r2, #0xe000
    strh r2, [ip]
    ldr ip, [r4, #0x160]
    mov r2, #0x0
    mov ip, ip, lsl #0x1c
    mov ip, ip, lsr #0x1c
    add r0, r0, ip, lsl #0x5
    ldr r0, [r0, r3, lsl #0x2]
    bl func_02006bf0
    str r0, [r4, #0x184]
.L_200:
    .word 0xebff9b72
    cmp r0, #0x0
    beq .L_22c
    ldr r0, [r4, #0x160]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x16
    add r0, r0, #0x500
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
.L_22c:
    ldr r0, [r4, #0x16c]
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_258
    bl func_02013980
    mov r2, r0
    mov r0, r5
    mov r1, #0x10
    bl func_ov000_021af474
    b .L_260
.L_258:
    mov r0, #0x0
    bl func_ov012_021ca31c
.L_260:
    ldr r0, [r4, #0x16c]
    bic r0, r0, #0x30000
    str r0, [r4, #0x16c]
    add sp, sp, #0xc0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov012_021cc5fc
_LIT1: .word data_02104acc
_LIT2: .word data_ov012_021cc010
_LIT3: .word data_ov012_021cc108
_LIT4: .word 0xff0000ff
_LIT5: .word 0x04000008
