; func_ov002_02236348 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_0202b95c
        .extern func_0202e274
        .extern func_0202e2a4
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021bbcc8
        .extern func_ov002_021d8198
        .extern func_ov002_021e277c
        .extern func_ov002_0220e428
        .extern func_ov002_0223dda4
        .extern func_ov002_0223f5dc
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .global func_ov002_02236348
        .arm
func_ov002_02236348:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x64
    bgt .L_230
    beq .L_3cc
    b .L_3e4
.L_230:
    sub r1, r1, #0x78
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b .L_3e4
    b .L_388
    b .L_3e4
    b .L_3e4
    b .L_3e4
    b .L_3e4
    b .L_368
    b .L_340
    b .L_2e8
    b .L_264
.L_264:
    bl func_ov002_0220e428
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r3, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    ldr r0, _LIT1
    ldr r2, _LIT2
    and r3, r3, #0x1
    mla r2, r3, r0, r2
    and r1, r1, #0xff
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    strh r0, [r4, #0xa]
    ldrh r0, [r4, #0xa]
    bl func_0202e274
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0xa]
    bl func_0202e2a4
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_2e8:
    bl func_ov002_0223f5dc
    ldrh r3, [r4, #0x2]
    mov r2, r0
    ldrh r1, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    bne .L_328
    mov r0, r0, lsl #0x1f
    mov r1, #0x15
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_328:
    mov r0, r0, lsl #0x1f
    mov r1, #0x33
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_340:
    bl func_ov002_0223f5dc
    ldrh r1, [r4, #0x2]
    mov r3, r0
    ldrh r2, [r4]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x6
    bl func_ov002_021af8f0
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_368:
    bl func_ov002_021afa94
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8198
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, pc}
.L_388:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0xa]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbcc8
    mov r5, r0
    ldrh r0, [r4, #0xa]
    bl func_0202b95c
    cmp r5, r0
    bge .L_3c4
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
.L_3c4:
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, pc}
.L_3cc:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_3e4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
