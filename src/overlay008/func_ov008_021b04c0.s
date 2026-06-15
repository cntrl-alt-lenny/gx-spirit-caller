; func_ov008_021b04c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2780
        .extern data_ov008_021b27bc
        .extern data_ov008_021b2c80
        .extern data_ov008_021b2de4
        .extern func_02006110
        .extern func_02006164
        .extern func_ov008_021aa578
        .extern func_ov008_021aedfc
        .extern func_ov008_021aee54
        .extern func_ov008_021af154
        .extern func_ov008_021b03b8
        .extern func_ov008_021b23ac
        .global func_ov008_021b04c0
        .arm
func_ov008_021b04c0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r0, _LIT0
    ldrh r0, [r0, #0xa8]
    cmp r0, #0x3
    bls .L_530
    mov r0, #0xdc
    mov r1, #0x19
    mov r2, #0xf4
    mov r3, #0x2e
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_224
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldr r2, [r1, #0x634]
    orr r2, r2, #0x40
    str r2, [r1, #0x634]
    ldrh r1, [r0, #0x58]
    cmp r1, #0x0
    bne .L_21c
    ldr r2, _LIT0
    ldrh r0, [r2]
    cmp r0, #0x0
    beq .L_224
    sub r3, r0, #0x1
    mov r0, #0x1
    mov r1, #0x0
    strh r3, [r2]
    bl func_ov008_021af154
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    mov r1, #0x1
    tst r2, r1, lsl r0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streqh r1, [r0, #0x4]
    ldr r0, _LIT2
    mov r1, #0x8
    strh r1, [r0, #0x58]
    b .L_224
.L_21c:
    sub r1, r1, #0x1
    strh r1, [r0, #0x58]
.L_224:
    mov r0, #0xc
    mov r1, r0
    mov r2, #0xd4
    mov r3, #0x14
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_30c
    ldr r0, _LIT2
    ldrh r1, [r0, #0x58]
    cmp r1, #0x0
    bne .L_304
    ldr r2, _LIT0
    ldrh r0, [r2]
    cmp r0, #0x0
    beq .L_30c
    sub r3, r0, #0x1
    mov r0, #0x1
    mov r1, #0x0
    strh r3, [r2]
    bl func_ov008_021af154
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    mov r1, #0x1
    tst r2, r1, lsl r0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streqh r1, [r0, #0x4]
    ldr r0, _LIT2
    mov r1, #0x8
    strh r1, [r0, #0x58]
    b .L_30c
.L_304:
    sub r1, r1, #0x1
    strh r1, [r0, #0x58]
.L_30c:
    mov r0, #0xdc
    mov r1, #0x85
    mov r2, #0xf4
    mov r3, #0x9a
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_40c
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldr r2, [r1, #0x634]
    orr r2, r2, #0x80
    str r2, [r1, #0x634]
    ldrh r1, [r0, #0x58]
    cmp r1, #0x0
    bne .L_404
    ldr r2, _LIT0
    ldrh r0, [r2, #0xa8]
    ldrh r1, [r2]
    sub r0, r0, #0x3
    cmp r1, r0
    bge .L_40c
    mov r0, #0x1
    add r3, r1, #0x1
    mov r1, r0
    strh r3, [r2]
    bl func_ov008_021af154
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    mov r1, #0x1
    tst r2, r1, lsl r0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streqh r1, [r0, #0x4]
    ldr r0, _LIT2
    mov r1, #0x8
    strh r1, [r0, #0x58]
    b .L_40c
.L_404:
    sub r1, r1, #0x1
    strh r1, [r0, #0x58]
.L_40c:
    mov r0, #0xc
    mov r1, #0x9c
    mov r2, #0xd4
    mov r3, #0xa4
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_4fc
    ldr r0, _LIT2
    ldrh r1, [r0, #0x58]
    cmp r1, #0x0
    bne .L_4f4
    ldr r2, _LIT0
    ldrh r0, [r2, #0xa8]
    ldrh r1, [r2]
    sub r0, r0, #0x3
    cmp r1, r0
    bge .L_4fc
    mov r0, #0x1
    add r3, r1, #0x1
    mov r1, r0
    strh r3, [r2]
    bl func_ov008_021af154
    ldr r0, _LIT0
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r1, _LIT0
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aedfc
    ldr r1, _LIT0
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aee54
    mov r1, r0, asr #0x4
    add r3, r0, r1, lsr #0x1b
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    ldr r5, _LIT3
    mov r2, #0x34
    mla r2, r4, r2, r5
    mov r3, r3, asr #0x5
    ldr r2, [r2, r3, lsl #0x2]
    mov r1, #0x1
    tst r2, r1, lsl r0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streqh r1, [r0, #0x4]
    ldr r0, _LIT2
    mov r1, #0x8
    strh r1, [r0, #0x58]
    b .L_4fc
.L_4f4:
    sub r1, r1, #0x1
    strh r1, [r0, #0x58]
.L_4fc:
    mov r0, #0xdc
    mov r1, #0x2e
    mov r2, #0xf4
    mov r3, #0x85
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_530
    ldr r0, [sp]
    bl func_ov008_021b03b8
    ldr r0, _LIT1
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x100
    str r1, [r0, #0x634]
.L_530:
    ldr r0, _LIT0
    ldr r1, [r0, #0xb4]
    cmp r1, #0x0
    beq .L_594
    mov r0, #0xe3
    mov r1, #0xa4
    mov r2, #0xfd
    mov r3, #0xbe
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_584
    bl func_02006164
    cmp r0, #0x0
    ldrne r0, _LIT1
    movne r1, #0x1
    strne r1, [r0, #0x55c]
    ldr r0, _LIT1
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x1
    str r1, [r0, #0x634]
    b .L_5f0
.L_584:
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0x55c]
    b .L_5f0
.L_594:
    ldr r0, [r0, #0xac]
    cmp r0, #0x0
    bne .L_5f0
    mov r0, #0x56
    mov r1, #0xa4
    mov r2, #0xaa
    mov r3, #0xbf
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_5e4
    bl func_02006164
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0xb8]
    ldr r0, _LIT1
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x200
    str r1, [r0, #0x634]
    b .L_5f0
.L_5e4:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xb8]
.L_5f0:
    bl func_ov008_021b23ac
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0xe3
    mov r1, #0x0
    mov r2, #0x100
    mov r3, #0x14
    bl func_ov008_021aa578
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02006164
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0xbc]
    ldr r0, _LIT1
    ldr r1, [r0, #0x634]
    orr r1, r1, #0x400
    str r1, [r0, #0x634]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov008_021b2de4
_LIT1: .word data_ov008_021b2780
_LIT2: .word data_ov008_021b2c80
_LIT3: .word data_ov008_021b27bc
