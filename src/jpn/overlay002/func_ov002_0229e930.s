; func_ov002_0229e930 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov002_022ca298
        .extern data_ov002_022ca2a0
        .extern data_ov002_022ca2a8
        .extern data_ov002_022ca2b0
        .extern data_ov002_022cd65c
        .global func_ov002_0229e930
        .arm
func_ov002_0229e930:
    sub sp, sp, #0x8
    sub r2, r2, #0xa
    cmp r2, #0x5
    addls pc, pc, r2, lsl #0x2
    b .L_348
    b .L_210
    b .L_348
    b .L_260
    b .L_2a4
    b .L_2d8
    b .L_318
.L_210:
    ldr r2, _LIT0
    ldr r2, [r2, #0x4]
    eor ip, r2, #0x1
    cmp r1, ip
    moveq r3, #0x1
    movne r3, #0x0
    ldr r2, _LIT1
    eor r3, r3, #0x1
    ldr r2, [r2, r3, lsl #0x2]
    cmp r1, ip
    str r2, [sp]
    moveq r3, #0x1
    ldr r2, _LIT2
    movne r3, #0x0
    ldr r1, _LIT3
    ldr r2, [r2, r3, lsl #0x2]
    ldr r1, [r1, r3, lsl #0x2]
    add r1, r2, r1
    str r1, [sp, #0x4]
    b .L_348
.L_260:
    ldr r2, _LIT0
    ldr r2, [r2, #0x4]
    eor ip, r2, #0x1
    cmp r1, ip
    moveq r3, #0x1
    movne r3, #0x0
    ldr r2, _LIT1
    eor r3, r3, #0x1
    ldr r2, [r2, r3, lsl #0x2]
    cmp r1, ip
    str r2, [sp]
    moveq r2, #0x1
    ldr r1, _LIT2
    movne r2, #0x0
    ldr r1, [r1, r2, lsl #0x2]
    str r1, [sp, #0x4]
    b .L_348
.L_2a4:
    ldr r2, _LIT0
    ldr r2, [r2, #0x4]
    eor r2, r2, #0x1
    cmp r1, r2
    moveq r3, #0x1
    ldr r2, _LIT1
    movne r3, #0x0
    ldr r1, _LIT2
    ldr r2, [r2, r3, lsl #0x2]
    ldr r1, [r1, r3, lsl #0x2]
    str r2, [sp]
    str r1, [sp, #0x4]
    b .L_348
.L_2d8:
    ldr r2, _LIT0
    ldr r3, _LIT1
    ldr r2, [r2, #0x4]
    eor r2, r2, #0x1
    cmp r1, r2
    moveq ip, #0x1
    movne ip, #0x0
    ldr r2, _LIT2
    ldr r1, _LIT3
    ldr r3, [r3, ip, lsl #0x2]
    ldr r2, [r2, ip, lsl #0x2]
    ldr r1, [r1, ip, lsl #0x2]
    str r3, [sp]
    add r1, r2, r1
    str r1, [sp, #0x4]
    b .L_348
.L_318:
    ldr r2, _LIT0
    ldr r2, [r2, #0x4]
    eor r2, r2, #0x1
    cmp r1, r2
    moveq r2, #0x1
    ldr r1, _LIT4
    movne r2, #0x0
    add r3, r1, r2, lsl #0x3
    ldr r2, [r1, r2, lsl #0x3]
    ldr r1, [r3, #0x4]
    str r2, [sp]
    str r1, [sp, #0x4]
.L_348:
    ldr r1, _LIT5
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1b
    mov r2, r1, lsr #0x1e
    tst r2, #0x1
    ldrne r1, [sp]
    subne r1, r1, #0x18
    strne r1, [sp]
    tst r2, #0x2
    ldrne r1, [sp, #0x4]
    ldr r2, [sp]
    subne r1, r1, #0x10
    strne r1, [sp, #0x4]
    ldr r1, [sp, #0x4]
    str r2, [r0]
    str r1, [r0, #0x4]
    add sp, sp, #0x8
    bx lr
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_ov002_022ca2a8
_LIT2: .word data_ov002_022ca2a0
_LIT3: .word data_ov002_022ca298
_LIT4: .word data_ov002_022ca2b0
_LIT5: .word data_02104e6c
