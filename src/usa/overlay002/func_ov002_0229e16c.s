; func_ov002_0229e16c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov002_022ca280
        .extern data_ov002_022cd65c
        .extern data_ov002_022d0eb8
        .extern func_0207ef74
        .extern func_ov002_0229d4b0
        .global func_ov002_0229e16c
        .arm
func_ov002_0229e16c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r6, r4
    mov r5, #0x0
.L_14:
    mov r0, r6
    bl func_ov002_0229d4b0
    add r5, r5, #0x1
    cmp r5, #0x8
    add r6, r6, #0x14
    blt .L_14
    ldr r1, _LIT0
    mov r0, #0x1800
    str r1, [sp]
    strh r0, [sp, #0x4]
    ldr r0, [r4, #0xa8]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    beq .L_13c
    ldr r0, _LIT1
    ldr r2, [r4, #0xa0]
    ldr r0, [r0, #0x4]
    eor r1, r0, #0x1
    cmp r2, r1
    moveq r3, #0x1
    movne r3, #0x0
    ldr r0, _LIT2
    cmp r2, r1
    ldr r0, [r0, r3, lsl #0x2]
    ldr r2, _LIT3
    sub r1, r0, #0x10
    bne .L_9c
    ldr r3, [sp]
    mov r0, #0xe6
    and r2, r3, r2
    str r2, [sp]
    b .L_b0
.L_9c:
    ldr r3, [sp]
    mov r0, #0x22
    and r2, r3, r2
    orr r2, r2, #0x10000000
    str r2, [sp]
.L_b0:
    ldr r2, _LIT4
    ldr r3, [sp]
    ldr r2, [r2, #0x4]
    mov r2, r2, lsl #0x1b
    mov r2, r2, lsr #0x1e
    tst r2, #0x1
    subne r0, r0, #0x18
    tst r2, #0x2
    ldr r2, _LIT5
    subne r1, r1, #0x10
    and r2, r3, r2
    and r1, r1, #0xff
    mov r3, r0, lsl #0x17
    orr r0, r2, r1
    orr r0, r0, r3, lsr #0x7
    str r0, [sp]
    ldr r1, [r4, #0xb8]
    mvn r0, #0x0
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x9
    add r2, r0, #0x400
    mov r0, #0x400
    mov r1, r2, asr #0x6
    add r1, r2, r1, lsr #0x19
    ldrh r3, [sp, #0x4]
    rsb r0, r0, #0x0
    mov r2, #0x1
    and r0, r3, r0
    orr r3, r0, r1, asr #0x7
    ldr r0, _LIT6
    add r1, sp, #0x0
    strh r3, [sp, #0x4]
    bl func_0207ef74
.L_13c:
    ldr r0, [r4, #0xa4]
    ldr r1, [r4, #0xa8]
    sub r0, r0, #0x8
    cmp r1, r0
    movlt r0, #0x1
    movge r0, #0x0
    cmp r0, #0x0
    beq .L_240
    ldr r0, _LIT1
    ldr r2, [r4, #0xa0]
    ldr r0, [r0, #0x4]
    eor r1, r0, #0x1
    cmp r2, r1
    moveq r3, #0x1
    movne r3, #0x0
    ldr r0, _LIT2
    cmp r2, r1
    ldr r0, [r0, r3, lsl #0x2]
    ldr r2, _LIT3
    sub r1, r0, #0x10
    bne .L_1a8
    ldr r3, [sp]
    mov r0, #0x22
    and r2, r3, r2
    orr r2, r2, #0x10000000
    str r2, [sp]
    b .L_1b8
.L_1a8:
    ldr r3, [sp]
    mov r0, #0xe6
    and r2, r3, r2
    str r2, [sp]
.L_1b8:
    ldr r2, _LIT4
    ldr r3, [sp]
    ldr r2, [r2, #0x4]
    mov r2, r2, lsl #0x1b
    mov r2, r2, lsr #0x1e
    tst r2, #0x1
    subne r0, r0, #0x18
    tst r2, #0x2
    ldr r2, _LIT5
    subne r1, r1, #0x10
    and r2, r3, r2
    and r1, r1, #0xff
    mov r3, r0, lsl #0x17
    orr r0, r2, r1
    orr r0, r0, r3, lsr #0x7
    str r0, [sp]
    ldr r0, [r4, #0xb8]
    ldrh r3, [sp, #0x4]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x9
    add r2, r0, #0x400
    mov r0, #0x400
    mov r1, r2, asr #0x6
    rsb r0, r0, #0x0
    add r1, r2, r1, lsr #0x19
    and r0, r3, r0
    orr r3, r0, r1, asr #0x7
    ldr r0, _LIT6
    add r1, sp, #0x0
    mov r2, #0x1
    strh r3, [sp, #0x4]
    bl func_0207ef74
.L_240:
    mov r0, #0x0
    str r0, [r4, #0xb8]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x8000a000
_LIT1: .word data_ov002_022cd65c
_LIT2: .word data_ov002_022ca280
_LIT3: .word 0xc1fffcff
_LIT4: .word data_02104e6c
_LIT5: .word 0xfe00ff00
_LIT6: .word data_ov002_022d0eb8
