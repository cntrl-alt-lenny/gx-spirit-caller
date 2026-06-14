; func_ov011_021ccb6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_ov011_021d403c
        .extern func_02006110
        .extern func_ov011_021c9dd8
        .extern func_ov011_021c9e2c
        .extern func_ov011_021cc374
        .extern func_ov011_021cca04
        .extern func_ov011_021ccf3c
        .extern func_ov011_021cf0a4
        .extern func_ov011_021d1080
        .global func_ov011_021ccb6c
        .arm
func_ov011_021ccb6c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r4, _LIT0
    bl func_ov011_021c9dd8
    cmp r0, #0x0
    beq .L_c4
    bl func_ov011_021cc374
    cmp r0, #0x0
    bne .L_c4
    ldr r0, [r4, #0x274]
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x18
    bne .L_c4
    ldr r0, [r4, #0x264]
    cmp r0, #0x1
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r4, #0x240]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x3
    bne .L_80
    ldr r0, [r4, #0x258]
    add r1, sp, #0x4
    mov r0, r0, lsl #0xe
    add r2, sp, #0x0
    mov r0, r0, lsr #0x18
    bl func_ov011_021d1080
    ldr r1, [sp, #0x4]
    ldr r0, [sp]
    str r1, [r4, #0x230]
    b .L_a8
.L_80:
    add r0, sp, #0xc
    add r1, sp, #0x8
    bl func_02006110
    ldr r3, [sp, #0xc]
    ldr r2, [r4, #0x1fc]
    ldr r1, [sp, #0x8]
    ldr r0, [r4, #0x200]
    add r2, r2, r3, lsl #0xc
    add r0, r0, r1, lsl #0xc
    str r2, [r4, #0x230]
.L_a8:
    str r0, [r4, #0x234]
    bl func_ov011_021ccf3c
    ldr r0, [r4, #0x270]
    add sp, sp, #0x10
    bic r0, r0, #0x10000000
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
.L_c4:
    bl func_ov011_021c9e2c
    cmp r0, #0x0
    beq .L_20c
    bl func_ov011_021cc374
    cmp r0, #0x0
    bne .L_20c
    ldr r0, [r4, #0x274]
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x18
    bne .L_20c
    add r0, sp, #0xc
    add r1, sp, #0x8
    bl func_02006110
    ldr r0, [sp, #0xc]
    cmp r0, #0xe0
    blt .L_134
    cmp r0, #0x100
    bge .L_134
    rsb r0, r0, #0x100
    mov r1, r0, lsl #0xe
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    ldr r1, [r4, #0x1fc]
    rsb r0, r0, #0x4000
    add r0, r1, r0
    str r0, [r4, #0x1fc]
    b .L_164
.L_134:
    cmp r0, #0x0
    blt .L_164
    cmp r0, #0x20
    bge .L_164
    mov r1, r0, lsl #0xe
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    ldr r1, [r4, #0x1fc]
    rsb r0, r0, #0x4000
    sub r0, r1, r0
    str r0, [r4, #0x1fc]
.L_164:
    ldr r0, [sp, #0x8]
    cmp r0, #0xa0
    blt .L_1a0
    cmp r0, #0xc0
    bge .L_1a0
    rsb r0, r0, #0xc0
    mov r1, r0, lsl #0xe
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    ldr r1, [r4, #0x200]
    rsb r0, r0, #0x4000
    add r0, r1, r0
    str r0, [r4, #0x200]
    b .L_1d0
.L_1a0:
    cmp r0, #0x0
    blt .L_1d0
    cmp r0, #0x20
    bge .L_1d0
    mov r1, r0, lsl #0xe
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    ldr r1, [r4, #0x200]
    rsb r0, r0, #0x4000
    sub r0, r1, r0
    str r0, [r4, #0x200]
.L_1d0:
    bl func_ov011_021cca04
    ldr r0, [r4, #0x264]
    cmp r0, #0x1
    addne sp, sp, #0x10
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r3, [sp, #0xc]
    ldr r2, [r4, #0x1fc]
    ldr r1, [sp, #0x8]
    ldr r0, [r4, #0x200]
    add r2, r2, r3, lsl #0xc
    add r0, r0, r1, lsl #0xc
    add sp, sp, #0x10
    str r2, [r4, #0x230]
    str r0, [r4, #0x234]
    ldmia sp!, {r4, r5, r6, pc}
.L_20c:
    ldr r0, [r4, #0x270]
    mov r0, r0, lsl #0x4
    movs r0, r0, lsr #0x18
    bne .L_228
    bl func_ov011_021cf0a4
    cmp r0, #0x0
    bne .L_2d4
.L_228:
    ldr r0, [r4, #0x270]
    ldr r3, _LIT1
    mov r0, r0, lsl #0x4
    mov r0, r0, lsr #0x18
    subs r0, r0, #0x4
    movmi r0, #0x0
    rsb r5, r0, #0xff
    mov r2, r5, lsl #0xe
    mov r1, r2, lsr #0x1f
    smull r2, r6, r3, r2
    add r6, r6, r5, lsl #0xe
    add r6, r1, r6, asr #0x7
    mov r2, r6, asr #0x4
    ldr r1, _LIT2
    mov r2, r2, lsl #0x2
    ldrsh r2, [r1, r2]
    ldr r3, [r4, #0x224]
    ldr r1, [r4, #0x270]
    rsb lr, r2, #0x1000
    smull r5, r6, r3, lr
    adds ip, r5, #0x800
    ldr r2, [r4, #0x228]
    adc r6, r6, #0x0
    smull r5, r3, r2, lr
    adds r5, r5, #0x800
    mov ip, ip, lsr #0xc
    adc r2, r3, #0x0
    mov r3, r5, lsr #0xc
    ldr r5, [r4, #0x21c]
    orr ip, ip, r6, lsl #0x14
    add r5, r5, ip
    sub r6, r5, #0x80000
    ldr r5, [r4, #0x220]
    orr r3, r3, r2, lsl #0x14
    add r2, r5, r3
    sub r2, r2, #0x60000
    bic r1, r1, #0xff00000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x4
    str r6, [r4, #0x1fc]
    str r2, [r4, #0x200]
    str r0, [r4, #0x270]
    b .L_3b8
.L_2d4:
    ldr r0, [r4, #0x274]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_384
    subs r0, r0, #0x4
    movmi r0, #0x0
    rsb r5, r0, #0xff
    mov r2, r5, lsl #0xe
    ldr r3, _LIT1
    mov r1, r2, lsr #0x1f
    smull r2, r6, r3, r2
    add r6, r6, r5, lsl #0xe
    add r6, r1, r6, asr #0x7
    mov r2, r6, asr #0x4
    ldr r1, _LIT2
    mov r2, r2, lsl #0x2
    ldrsh r2, [r1, r2]
    ldr r3, [r4, #0x224]
    ldr r1, [r4, #0x274]
    rsb r6, r2, #0x1000
    smull ip, lr, r3, r6
    adds r5, ip, #0x800
    ldr r2, [r4, #0x228]
    adc lr, lr, #0x0
    smull ip, r3, r2, r6
    adds ip, ip, #0x800
    mov r5, r5, lsr #0xc
    adc r2, r3, #0x0
    mov r3, ip, lsr #0xc
    ldr ip, [r4, #0x230]
    orr r5, r5, lr, lsl #0x14
    add r5, ip, r5
    sub r5, r5, #0x80000
    ldr ip, [r4, #0x234]
    orr r3, r3, r2, lsl #0x14
    add r2, ip, r3
    sub r2, r2, #0x60000
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    str r5, [r4, #0x1fc]
    str r2, [r4, #0x200]
    str r0, [r4, #0x274]
    b .L_3b8
.L_384:
    ldr r0, [r4, #0x270]
    mov r0, r0, lsl #0x3
    movs r0, r0, lsr #0x1f
    bne .L_3b8
    ldr r0, [r4, #0x264]
    cmp r0, #0x1
    bne .L_3b8
    ldr r1, [r4, #0x230]
    ldr r0, [r4, #0x234]
    sub r1, r1, #0x80000
    sub r0, r0, #0x60000
    str r1, [r4, #0x1fc]
    str r0, [r4, #0x200]
.L_3b8:
    bl func_ov011_021cca04
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov011_021d403c
_LIT1: .word 0x80808081
_LIT2: .word data_020bef80
