; func_02023548 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005910
        .extern func_02021c84
        .extern func_0202246c
        .extern func_020225f0
        .extern func_020228b8
        .extern func_02023e64
        .extern func_02023ed4
        .extern func_02023ef8
        .extern func_0208c7c8
        .extern func_0208c7e4
        .extern func_0208cba8
        .extern func_0208cebc
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d314
        .extern func_0208d408
        .extern func_0208d944
        .extern func_02094410
        .global func_02023548
        .arm
func_02023548:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r9, r0
    ldr r0, [r9]
    mov r6, #0x0
    str r0, [sp]
    add r4, r9, #0xa8
    add r8, r9, #0x74
    add r5, r9, #0x98
    add r7, r9, #0x68
    b .L_428
.L_2c:
    ldr r0, [r9]
    ldr r2, [r0]
    mov r1, r2, lsr #0x18
    sub r1, r1, #0x20
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_414
    b .L_70
    b .L_f0
    b .L_138
    b .L_1d8
    b .L_1f4
    b .L_294
    b .L_2b0
    b .L_2d4
    b .L_320
    b .L_354
.L_70:
    bl func_02005910
    ldr r0, _LIT0
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    mov r0, #0x60
    bl func_0208d944
    mov r0, #0x3
    bl func_0208d408
    mov r0, #0x10
    bl func_0208d314
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x80
    bl func_0208cf48
    mov r0, #0x100
    bl func_0208cebc
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl func_0208c7e4
    mov r0, #0x0
    bl func_0208c7c8
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_414
.L_f0:
    mov r0, #0x0
    str r0, [r9, #0x68]
    mov r0, #0x1000
    str r0, [r9, #0x6c]
    str r0, [r9, #0x70]
    mov r0, #0x0
    str r0, [r9, #0x74]
    str r0, [r9, #0x78]
    str r0, [r9, #0x7c]
    str r0, [r9, #0x80]
    mov r0, #0x1000
    str r0, [r9, #0x84]
    mov r0, #0x0
    str r0, [r9, #0x88]
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_414
.L_138:
    mov r1, r2, lsr #0x10
    ldr r2, [r0, #0x4]
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r7]
    ldr r2, [r9]
    mov r0, r9
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r7, #0x4]
    ldr r2, [r9]
    mov r0, r9
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r7, #0x8]
    ldmia r7, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_414
.L_1d8:
    mov r0, r9
    mov r1, r5
    mov r2, r7
    bl func_020225f0
    cmp r0, #0x0
    movne r6, #0x1
    b .L_414
.L_1f4:
    mov r1, r2, lsr #0x10
    ldr r2, [r0, #0x4]
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r8]
    ldr r2, [r9]
    mov r0, r9
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r8, #0x4]
    ldr r2, [r9]
    mov r0, r9
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [r8, #0x8]
    ldmia r8, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
    b .L_414
.L_294:
    mov r0, r9
    mov r1, r4
    mov r2, r8
    bl func_020225f0
    cmp r0, #0x0
    movne r6, #0x1
    b .L_414
.L_2b0:
    mov r0, #0x1
    strb r0, [r9, #0xc6]
    mov r0, r9
    add r1, r9, #0xb8
    add r2, r9, #0x8c
    bl func_020225f0
    cmp r0, #0x0
    movne r6, #0x1
    b .L_414
.L_2d4:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldrh r1, [r9, #0xce]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x2
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1e
    strh r0, [r9, #0xce]
    mov r0, r9
    bl func_02023e64
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_414
.L_320:
    mov r0, r9
    mov r1, r2, lsr #0x10
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    strh r0, [r9, #0xc8]
    mov r0, r9
    bl func_02023ed4
    ldr r0, [r9]
    add r0, r0, #0x4
    str r0, [r9]
    b .L_414
.L_354:
    mov r1, r2, lsr #0x10
    ldr r2, [r0, #0x4]
    and r1, r1, #0xff
    mov r2, r2, lsl #0x10
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r2, [r9]
    mov sl, r0
    ldmia r2, {r1, r2}
    mov r2, r2, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r2, [r9]
    mov fp, r0
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r2, [r9]
    str r0, [sp, #0x4]
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r0, r9
    and r1, r1, #0xff
    mov r2, r2, lsr #0x10
    bl func_0202246c
    ldr r1, [sp, #0x4]
    strh sl, [r9, #0xca]
    orr r1, fp, r1, lsl #0x5
    orr r0, r1, r0, lsl #0xa
    strh r0, [r9, #0xcc]
    mov r0, r9
    bl func_02023ef8
    ldr r0, [r9]
    add r0, r0, #0xc
    str r0, [r9]
.L_414:
    ldr r1, [r9]
    ldr r0, [sp]
    cmp r1, r0
    movne r0, #0x0
    strne r0, [r9, #0x4]
.L_428:
    cmp r6, #0x0
    bne .L_440
    mov r0, r9
    bl func_02021c84
    cmp r0, #0x0
    beq .L_2c
.L_440:
    ldrh r0, [r9, #0xce]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_4b0
    ldrb r0, [r9, #0xa7]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_470
    mov r0, r9
    add r1, r9, #0x98
    add r2, r9, #0x68
    bl func_020228b8
.L_470:
    ldrb r0, [r9, #0xb7]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_490
    mov r0, r9
    add r1, r9, #0xa8
    add r2, r9, #0x74
    bl func_020228b8
.L_490:
    ldrb r0, [r9, #0xc7]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_4b0
    mov r0, r9
    add r1, r9, #0xb8
    add r2, r9, #0x8c
    bl func_020228b8
.L_4b0:
    ldr r1, [r9, #0x4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r9, #0x4]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000001ff
