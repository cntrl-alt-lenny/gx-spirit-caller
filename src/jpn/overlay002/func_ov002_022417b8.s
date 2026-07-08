; func_ov002_022417b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021b98d4
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_0223dd14
        .extern func_ov002_02253600
        .extern func_ov002_0226b084
        .global func_ov002_022417b8
        .arm
func_ov002_022417b8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r3, [r1, #0x5b8]
    ldr r4, [r2, #0xcec]
    ldr r2, [r1, #0x5bc]
    mov r5, r0
    cmp r3, #0x3
    eor r4, r4, r2
    addls pc, pc, r3, lsl #0x2
    b .L_50c
    b .L_3f0
    b .L_404
    b .L_488
    b .L_4ec
.L_3f0:
    mov r0, #0x0
    str r0, [r1, #0x5bc]
    add r2, r3, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_404:
    mov r0, r4
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_470
    mov r0, r4
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    beq .L_470
    ldrh r2, [r5, #0x4]
    ldrh r1, [r5]
    mov r0, r4
    mov r2, r2, lsl #0x11
    mov r2, r2, lsr #0x17
    bl func_ov002_02253600
    cmp r0, #0x0
    beq .L_470
    ldrh r2, [r5, #0x4]
    ldrh r1, [r5]
    mov r0, r4
    mov r2, r2, lsl #0x11
    mov r2, r2, lsr #0x17
    bl func_ov002_0226b084
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b8]
    add r1, r1, #0x1
    str r1, [r0, #0x5b8]
    b .L_480
.L_470:
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b8]
    add r1, r1, #0x2
    str r1, [r0, #0x5b8]
.L_480:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_488:
    ldr r1, _LIT2
    mov r0, r4
    ldrh r1, [r1, #0xb0]
    bl func_ov002_021b98d4
    ldr r3, _LIT3
    ldr r1, _LIT4
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    ldr r1, [r1, r0, lsl #0x2]
    mov r0, r5
    mov r2, r1, lsl #0x2
    mov r3, r1, lsl #0x12
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x18
    add r3, r1, r2, lsl #0x1
    mov r2, #0xe
    bl func_ov002_0223dd14
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_4ec:
    add r0, r2, #0x1
    str r0, [r1, #0x5bc]
    cmp r0, #0x2
    addge r0, r3, #0x1
    movlt r0, #0x1
    str r0, [r1, #0x5b8]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_50c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022d0d8c
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
