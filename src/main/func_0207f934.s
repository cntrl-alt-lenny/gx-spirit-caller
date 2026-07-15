; func_0207f934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee6c
        .global func_0207f934
        .arm
func_0207f934:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    ldrh r5, [r2]
    ldr r4, [sp, #0x60]
    ldr sl, [sp, #0x58]
    str r4, [sp, #0x60]
    cmp r1, r5
    movcs r1, r5
    mov r4, #0x0
    cmp r1, #0x0
    str r4, [sp]
    bls .L_384
    ldrh r4, [sp, #0x5c]
    mov r4, r4, lsl #0x19
    str r4, [sp, #0x4]
    ldr r4, [sp]
    str r4, [sp, #0x14]
    mov r4, #0x100
    str r4, [sp, #0xc]
    mov r4, #0x300
    str r4, [sp, #0x8]
    mov r4, #0x1
    str r4, [sp, #0x10]
.L_5c:
    ldr r5, [sp]
    mov r6, #0x6
    mul r6, r5, r6
    ldr r8, [r2, #0x4]
    ldr r4, [sp]
    add r7, r0, r5, lsl #0x3
    ldrh r5, [r8, r6]
    mov r4, r4, lsl #0x3
    add r9, r8, r6
    strh r5, [r0, r4]
    ldrh r4, [r9, #0x2]
    cmp r3, #0x0
    strh r4, [r7, #0x2]
    ldrh r4, [r9, #0x4]
    strh r4, [r7, #0x4]
    bne .L_a4
    cmp sl, #0x0
    beq .L_368
.L_a4:
    ldr r5, [r7]
    ldr r4, _LIT0
    and r4, r5, r4
    mov r4, r4, lsr #0x10
    mov r4, r4, lsl #0x10
    mov r4, r4, asr #0x10
    cmp r4, #0xff
    orrgt r4, r4, #0xff00
    movgt r4, r4, lsl #0x10
    movgt r4, r4, asr #0x10
    mov r4, r4, lsl #0xc
    str r4, [sp, #0x20]
    ldr r4, [r7]
    and r4, r4, #0xff
    mov r4, r4, lsl #0x10
    mov r4, r4, asr #0x10
    cmp r4, #0x7f
    orrgt r4, r4, #0xff00
    movgt r4, r4, lsl #0x10
    movgt r4, r4, asr #0x10
    mov r4, r4, lsl #0xc
    str r4, [sp, #0x24]
    cmp r3, #0x0
    beq .L_308
    ldr r5, [r7]
    and r6, r5, #0x300
    cmp r6, #0x100
    beq .L_124
    cmp r6, #0x300
    beq .L_124
    and r4, r5, #0x30000000
    orr r6, r6, r4
.L_124:
    cmp r6, #0x300
    bne .L_178
    ldr r4, _LIT1
    ldr r8, _LIT2
    and r5, r5, r4
    and r4, r5, #0xc000
    mov r6, r4, asr #0xe
    and r4, r5, #-1073741824
    mov r4, r4, lsr #0x1e
    mov r4, r4, lsl #0x1
    add r8, r8, r6, lsl #0x3
    ldrh r9, [r4, r8]
    ldr r8, _LIT3
    ldr r5, [sp, #0x20]
    add r6, r8, r6, lsl #0x3
    add r5, r5, r9, lsl #0xb
    str r5, [sp, #0x20]
    ldrh r4, [r4, r6]
    ldr r5, [sp, #0x24]
    add r4, r5, r4, lsl #0xb
    str r4, [sp, #0x24]
.L_178:
    ldr r4, [sp, #0x60]
    ldr r5, [r3, #0x8]
    cmp r4, #0x0
    ldrne r8, [sp, #0x8]
    add r4, sp, #0x20
    ldreq r8, [sp, #0xc]
    mov r6, r4
    cmp r8, #0x300
    ldreq r9, [sp, #0x10]
    mov ip, #0x1000
    ldrne r9, [sp, #0x14]
    cmp r4, r4
    ldr r4, [sp, #0x24]
    addeq r6, sp, #0x28
    smull fp, r4, r5, r4
    adds r5, fp, ip
    adc fp, r4, #0x0
    ldr r4, [r3]
    ldr lr, [sp, #0x20]
    smlal r5, fp, r4, lr
    mov r4, r5, lsr #0xc
    orr r4, r4, fp, lsl #0x14
    str r4, [r6]
    ldr r4, [r3, #0xc]
    ldr r5, [sp, #0x24]
    ldr lr, [r3, #0x4]
    smull fp, r5, r4, r5
    adds fp, fp, ip
    adc r4, r5, #0x0
    add r5, sp, #0x28
    cmp r6, r5
    ldr r5, [sp, #0x20]
    smlal fp, r4, lr, r5
    mov r5, fp, lsr #0xc
    orr r5, r5, r4, lsl #0x14
    str r5, [r6, #0x4]
    ldreq r5, [sp, #0x28]
    ldreq r4, [sp, #0x2c]
    streq r5, [sp, #0x20]
    streq r4, [sp, #0x24]
    cmp r8, #0x100
    beq .L_240
    cmp r8, #0x300
    beq .L_240
    ldr r5, [r7]
    ldr r4, _LIT4
    and r4, r5, r4
    orr r4, r4, r8
    str r4, [r7]
    b .L_25c
.L_240:
    ldr r5, [r7]
    ldr r4, _LIT4
    and r4, r5, r4
    orr r5, r4, r8
    ldr r4, [sp, #0x4]
    orr r4, r4, r5
    str r4, [r7]
.L_25c:
    ldr r6, [r7]
    ldr r5, _LIT1
    cmp r9, #0x0
    and r8, r6, r5
    and r5, r8, #0xc000
    mov r6, r5, asr #0xe
    and r5, r8, #-1073741824
    ldr r8, _LIT2
    mov r5, r5, lsr #0x1e
    mov r5, r5, lsl #0x1
    add r8, r8, r6, lsl #0x3
    ldrh r9, [r5, r8]
    ldr r8, _LIT3
    ldr r4, [sp, #0x20]
    add r6, r8, r6, lsl #0x3
    mov fp, r9, asr #0x1
    ldrh r5, [r5, r6]
    mov r8, fp, lsl #0xc
    ldr r6, [r3]
    rsb ip, r8, #0x0
    mov r9, r5, asr #0x1
    mla ip, r6, fp, ip
    ldr r5, [r3, #0x8]
    mla r6, r5, r9, ip
    add r6, r4, r6
    str r6, [sp, #0x20]
    ldr ip, [r3, #0x4]
    mov r5, r9, lsl #0xc
    str ip, [sp, #0x1c]
    ldr ip, [r3, #0xc]
    rsb lr, r5, #0x0
    str ip, [sp, #0x18]
    ldr ip, [sp, #0x1c]
    ldr r4, [sp, #0x24]
    mla fp, ip, fp, lr
    ldr ip, [sp, #0x18]
    subne r6, r6, r8
    mla r9, ip, r9, fp
    add r4, r4, r9
    str r4, [sp, #0x24]
    subne r4, r4, r5
    strne r6, [sp, #0x20]
    strne r4, [sp, #0x24]
.L_308:
    cmp sl, #0x0
    beq .L_330
    ldr r6, [sp, #0x20]
    ldr r4, [sl]
    ldr r5, [sp, #0x24]
    add r4, r6, r4
    str r4, [sp, #0x20]
    ldr r4, [sl, #0x4]
    add r4, r5, r4
    str r4, [sp, #0x24]
.L_330:
    ldr r4, [sp, #0x20]
    ldr r6, [r7]
    add r5, r4, #0x800
    ldr r4, _LIT5
    and r4, r4, r5, asr #0xc
    ldr r5, _LIT6
    and r6, r6, r5
    ldr r5, [sp, #0x24]
    add r5, r5, #0x800
    mov r5, r5, asr #0xc
    and r5, r5, #0xff
    orr r5, r6, r5
    orr r4, r5, r4, lsl #0x10
    str r4, [r7]
.L_368:
    ldr r4, [sp]
    add r4, r4, #0x1
    mov r4, r4, lsl #0x10
    mov r4, r4, lsr #0x10
    str r4, [sp]
    cmp r4, r1
    bcc .L_5c
.L_384:
    mov r0, r1
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x01ff0000
_LIT1: .word 0xc000c000
_LIT2: .word data_020bee6c+0x58
_LIT3: .word data_020bee6c+0x40
_LIT4: .word 0xc1fffcff
_LIT5: .word 0x000001ff
_LIT6: .word 0xfe00ff00
