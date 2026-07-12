; func_ov002_022b3b18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022d0e9c
        .extern func_0207ef74
        .global func_ov002_022b3b18
        .arm
func_ov002_022b3b18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    ldr r2, _LIT0
    mov sl, r1
    ldr r1, [r2, #0x4]
    str r0, [sp]
    eor r0, r1, #0x1
    cmp sl, r0
    ldr r0, [sp]
    moveq r9, #0xa8
    ldr r2, [r0, #0x8]
    add r1, r0, sl, lsl #0x2
    rsb r2, r2, #0x4
    mvn r0, #0x2
    mul fp, r2, r0
    ldr r2, [r1, #0x24]
    ldr r0, _LIT1
    movne r9, #0x33
    cmp r2, r0
    movge r2, r0
    ldr r0, _LIT2
    mov r7, #0x0
    add r1, sp, #0x1c
    mov r5, #0xa
.L_60:
    smull r4, r6, r0, r2
    mov r3, r2, lsr #0x1f
    add r6, r3, r6, asr #0x2
    smull r3, r4, r5, r6
    sub r6, r2, r3
    mov r4, r2
    smull r3, r2, r0, r4
    mov r3, r4, lsr #0x1f
    str r6, [r1, r7, lsl #0x2]
    add r7, r7, #0x1
    adds r2, r3, r2, asr #0x2
    bne .L_60
    rsb r0, r7, r7, lsl #0x3
    mov r1, #0x2000
    mov r5, #0x0
    add r2, r9, #0x13
    add r0, r0, r0, lsr #0x1f
    str r1, [sp, #0x14]
    strh r5, [sp, #0x18]
    cmp r7, #0x0
    add r6, r2, r0, asr #0x1
    ble .L_12c
    add r0, fp, #0x1
    mov r4, #0x400
    and r8, r0, #0xff
    rsb r4, r4, #0x0
.L_c8:
    ldr r3, [sp, #0x14]
    ldr r1, _LIT3
    sub r6, r6, #0x7
    and r1, r3, r1
    mov r0, r6, lsl #0x17
    orr r1, r1, r8
    orr r0, r1, r0, lsr #0x7
    ldrh r2, [sp, #0x18]
    str r0, [sp, #0x14]
    add r0, sp, #0x1c
    and r1, r2, r4
    ldr r2, [r0, r5, lsl #0x2]
    ldr r0, _LIT4
    mov r2, r2, lsl #0x6
    add r3, r2, #0x2400
    mov r2, r3, asr #0x4
    add r2, r3, r2, lsr #0x1b
    orr r1, r1, r2, asr #0x5
    strh r1, [sp, #0x18]
    add r1, sp, #0x14
    mov r2, #0x1
    bl func_0207ef74
    add r5, r5, #0x1
    cmp r5, r7
    blt .L_c8
.L_12c:
    ldr r0, _LIT0
    and r4, fp, #0xff
    orr r1, r4, #0x2000
    ldr r0, [r0, #0x4]
    mov r2, r9, lsl #0x17
    orr r1, r1, #0x40000000
    orr r1, r1, r2, lsr #0x7
    eor r0, r0, #0x1
    cmp sl, r0
    str r1, [sp, #0xc]
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, #0x180
    mul r0, r1, r0
    add r1, r0, #0x2700
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r3, r0, asr #0x5
    ldr r0, _LIT4
    add r1, sp, #0xc
    mov r2, #0x1
    strh r3, [sp, #0x10]
    bl func_0207ef74
    add r2, r9, #0xf
    ldr r1, [sp, #0xc]
    ldr r0, _LIT3
    mov r2, r2, lsl #0x17
    and r0, r1, r0
    orr r0, r0, r4
    orr r2, r0, r2, lsr #0x7
    str r2, [sp, #0xc]
    ldr r0, _LIT4
    add r1, sp, #0xc
    mov r2, #0x1
    bl func_0207ef74
    add r2, r9, #0x15
    ldr r1, [sp, #0xc]
    ldr r0, _LIT3
    mov r2, r2, lsl #0x17
    and r0, r1, r0
    orr r1, r0, r4
    orr r1, r1, r2, lsr #0x7
    ldr r0, _LIT5
    mov r2, #0x1
    and r0, r1, r0
    orr r3, r0, #0x10000000
    ldr r0, _LIT4
    add r1, sp, #0xc
    str r3, [sp, #0xc]
    bl func_0207ef74
    ldr r0, [sp]
    ldr r1, _LIT6
    add r0, r0, sl, lsl #0x2
    ldr r0, [r0, #0x24]
    ldr r2, _LIT0
    cmp r0, #0x1f40
    movge r0, #0x1f40
    add r3, r0, #0x63
    smull r0, r5, r1, r3
    ldr r1, [r2, #0x4]
    mov r0, r3, lsr #0x1f
    eor r2, r1, #0x1
    cmp sl, r2
    moveq r3, #0x1
    add r5, r0, r5, asr #0x5
    movne r3, #0x0
    mov r0, #0x180
    mul r0, r3, r0
    add r1, r0, #0x2680
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    mov r1, #0x6000
    strh r0, [sp, #0x8]
    mov r6, #0x58
    str r1, [sp, #0x4]
    cmp sl, r2
    add r0, fp, r3, lsl #0x2
    bne .L_2d8
    cmp r5, #0x0
    add r6, r6, #0x50
    addle sp, sp, #0x30
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr sl, _LIT4
    ldr r7, _LIT3
    and r4, r0, #0xff
    add r9, sp, #0x4
    mov r8, #0x1
.L_28c:
    cmp r5, #0x10
    sub r6, r6, #0x10
    rsblt r0, r5, #0x10
    addlt r6, r6, r0
    ldr r0, [sp, #0x4]
    mov r1, r6, lsl #0x17
    and r0, r0, r7
    orr r0, r0, r4
    orr r3, r0, r1, lsr #0x7
    mov r0, sl
    mov r1, r9
    mov r2, r8
    str r3, [sp, #0x4]
    bl func_0207ef74
    sub r5, r5, #0x10
    cmp r5, #0x0
    bgt .L_28c
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2d8:
    cmp r5, #0x0
    addle sp, sp, #0x30
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr sl, _LIT4
    ldr r7, _LIT3
    and r4, r0, #0xff
    add r9, sp, #0x4
    mov r8, #0x1
.L_2f8:
    cmp r5, #0x10
    rsblt r0, r5, #0x10
    sublt r6, r6, r0
    ldr r0, [sp, #0x4]
    mov r1, r6, lsl #0x17
    and r0, r0, r7
    orr r0, r0, r4
    orr r3, r0, r1, lsr #0x7
    mov r0, sl
    mov r1, r9
    mov r2, r8
    str r3, [sp, #0x4]
    bl func_0207ef74
    sub r5, r5, #0x10
    cmp r5, #0x0
    add r6, r6, #0x10
    bgt .L_2f8
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word 0x0001869f
_LIT2: .word 0x66666667
_LIT3: .word 0xfe00ff00
_LIT4: .word data_ov002_022d0e9c
_LIT5: .word 0xc1fffcff
_LIT6: .word 0x51eb851f
