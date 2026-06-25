; func_02010aec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218cae8
        .extern data_0218fbe8
        .extern func_0200fafc
        .extern func_0200fd00
        .extern func_0200fde0
        .extern func_02010198
        .extern func_02010338
        .extern func_02010e98
        .extern func_0208ff60
        .extern func_0208ffb8
        .extern func_0209002c
        .extern func_02090074
        .extern func_020900e4
        .extern func_02090248
        .extern func_0209281c
        .global func_02010aec
        .arm
func_02010aec:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldrh r0, [r0, #0x44]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    add r0, r4, #0x3100
    ldrh r2, [r0, #0x40]
    ldrh r0, [r0, #0x42]
    cmp r0, r2
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    add r1, r4, #0x1940
    mov r0, #0x18
    mla r5, r2, r0, r1
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_320
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq .L_70
    cmp r0, #0x1
    beq .L_1e4
    b .L_314
.L_70:
    ldr r0, [r5, #0xc]
    ldr r6, [r5]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_164
    mov r0, r6
    bl func_0200fafc
    movs r1, r0
    beq .L_c8
    ldr r0, [r5, #0xc]
    movs r0, r0, lsr #0x1f
    beq .L_320
    mov r2, #0x0
    mov r0, r6
    mov r3, r2
    str r2, [sp]
    bl func_0200fde0
    cmp r0, #0x0
    bne .L_320
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_c8:
    ldr r2, [r5, #0x8]
    ldr r1, [r2, #0x7c]
    mov r0, r1, lsl #0x5
    movs r0, r0, lsr #0x1f
    beq .L_114
    ldr r0, [r2, #0x18]
    ldr ip, [r2, #0x260]
    sub r3, r6, r0
    mov r0, r3, asr #0x4
    add r0, r3, r0, lsr #0x1b
    cmp ip, r0, asr #0x5
    bne .L_114
    ldr r3, [r5, #0xc]
    ldr r0, [r2, #0x25c]
    mov r3, r3, lsl #0x2
    movs r3, r3, lsr #0x1f
    bicne r1, r1, #0x4000000
    strne r1, [r2, #0x7c]
    b .L_11c
.L_114:
    mov r0, r6
    bl func_02010198
.L_11c:
    cmp r0, #0x80000
    bne .L_12c
    bl func_02010e98
.L_128:
    b .L_128
.L_12c:
    str r0, [r6, #0x18]
    ldr r0, [r5, #0xc]
    movs r0, r0, lsr #0x1f
    beq .L_164
    mov r1, #0x0
    mov r0, r6
    mov r2, r1
    mov r3, r1
    str r1, [sp]
    bl func_0200fde0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
.L_164:
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x14]
    bl func_0209281c
    bl func_02090248
    ldr r0, [r5, #0xc]
    mov r1, r0, lsl #0x1
    movs r1, r1, lsr #0x1f
    beq .L_1c4
    ldr r0, [r6, #0x18]
    cmp r0, #0x20000
    bcs .L_1a8
    mov r1, r0, lsr #0x1
    ldr r0, [r5, #0x10]
    ldr r2, [r5, #0x14]
    add r1, r1, #0x20000
    bl func_020900e4
    b .L_1dc
.L_1a8:
    sub r0, r0, #0x40000
    mov r1, r0, lsr #0x1
    ldr r0, [r5, #0x10]
    ldr r2, [r5, #0x14]
    add r1, r1, #0x30000
    bl func_020900e4
    b .L_1dc
.L_1c4:
    ldr r3, [r6, #0x18]
    mov r1, r0, lsl #0x9
    ldr r0, [r5, #0x10]
    ldr r2, [r5, #0x14]
    add r1, r3, r1, lsr #0xa
    bl func_020900e4
.L_1dc:
    bl func_02090074
    b .L_320
.L_1e4:
    ldr r0, [r5, #0xc]
    ldr r6, [r5]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_2e0
    mov r0, r6
    bl func_0200fd00
    movs r1, r0
    beq .L_23c
    ldr r0, [r5, #0xc]
    movs r0, r0, lsr #0x1f
    beq .L_320
    mov r3, #0x0
    mov r0, r6
    mov r2, #0x1
    str r3, [sp]
    bl func_0200fde0
    cmp r0, #0x0
    bne .L_320
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_23c:
    ldr r2, [r5, #0x8]
    ldr r1, [r2, #0x7c]
    mov r0, r1, lsl #0x4
    movs r0, r0, lsr #0x1f
    beq .L_290
    ldr r0, [r2, #0x1c]
    ldr r3, _LIT2
    sub ip, r6, r0
    smull r0, lr, r3, ip
    mov r0, ip, lsr #0x1f
    ldr r3, [r2, #0x268]
    add lr, r0, lr, asr #0x1
    cmp r3, lr
    bne .L_290
    ldr r3, [r5, #0xc]
    ldr r0, [r2, #0x264]
    mov r3, r3, lsl #0x2
    movs r3, r3, lsr #0x1f
    bicne r1, r1, #0x8000000
    strne r1, [r2, #0x7c]
    b .L_298
.L_290:
    mov r0, r6
    bl func_02010338
.L_298:
    cmp r0, #0x80000
    bne .L_2a8
    bl func_02010e98
.L_2a4:
    b .L_2a4
.L_2a8:
    str r0, [r6, #0x8]
    ldr r0, [r5, #0xc]
    movs r0, r0, lsr #0x1f
    beq .L_2e0
    mov r1, #0x0
    mov r0, r6
    mov r3, r1
    mov r2, #0x1
    str r1, [sp]
    bl func_0200fde0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
.L_2e0:
    ldr r0, [r5, #0x10]
    ldr r1, [r5, #0x14]
    bl func_0209281c
    bl func_0209002c
    ldr r0, [r5, #0xc]
    ldr r3, [r6, #0x8]
    mov r1, r0, lsl #0x9
    ldr r0, [r5, #0x10]
    ldr r2, [r5, #0x14]
    add r1, r3, r1, lsr #0xa
    bl func_0208ffb8
    bl func_0208ff60
    b .L_320
.L_314:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_320:
    add r0, r4, #0x3100
    ldrh r1, [r0, #0x44]
    sub r1, r1, #0x1
    strh r1, [r0, #0x44]
    ldr r2, [r5, #0x8]
    cmp r2, #0x0
    beq .L_374
    ldr r1, [r2, #0x60]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x1b
    sub r0, r0, #0x1
    bic r1, r1, #0x3e000000
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x2
    str r0, [r2, #0x60]
    ldr r2, [r5, #0x8]
    ldr r0, [r2, #0x60]
    mov r1, r0, lsl #0x2
    movs r1, r1, lsr #0x1b
    biceq r0, r0, #0x2
    streq r0, [r2, #0x60]
.L_374:
    add r0, r4, #0x3100
    ldrh r1, [r0, #0x40]
    add r1, r1, #0x1
    strh r1, [r0, #0x40]
    ldrh r1, [r0, #0x40]
    cmp r1, #0x100
    movcs r1, #0x0
    strcsh r1, [r0, #0x40]
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_0218fbe8
_LIT1: .word data_0218cae8
_LIT2: .word 0x2aaaaaab
