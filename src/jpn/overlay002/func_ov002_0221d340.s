; func_ov002_0221d340 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0cc
        .extern data_ov002_022cf814
        .extern data_ov002_022d0170
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_ov002_021b939c
        .extern func_ov002_021c1008
        .extern func_ov002_021d8384
        .extern func_ov002_021de390
        .extern func_ov002_021de588
        .extern func_ov002_021e267c
        .extern func_ov002_021e2ca4
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_0221d340
        .arm
func_ov002_0221d340:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r9, r0
    ldrh r1, [r9, #0x2]
    mov r1, r1, lsl #0x12
    movs r1, r1, lsr #0x1e
    bne .L_11c
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_110
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r6, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r7, r0, #0xff
    mov r0, r9
    mov r1, r6
    mov r2, r7
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_110
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r6, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r4, r7, r0
    add r5, r2, #0x30
    ldr r8, [r5, r4]
    mov r0, r9
    mov r1, r8, lsl #0x2
    mov r3, r1, lsr #0x18
    mov ip, r8, lsl #0x12
    mov r8, r3, lsl #0x1
    mov r1, r6
    mov r2, r7
    mov r3, #0x40
    add r8, r8, ip, lsr #0x1f
    bl func_ov002_021de588
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r5, r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_110
    mov r0, r6
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021c1008
    ldrh r1, [r9, #0x2]
    mov r0, r0, lsl #0x2
    add r0, r0, r8, lsl #0x3
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x10
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x10
    ldrh r1, [r9]
    mov r2, #0x21
    bl func_ov002_021e267c
.L_110:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_11c:
    ldr r0, [r9, #0x14]
    mov r4, r0, lsr #0x3
    mov r1, r0, lsr #0x2
    mov r0, r4
    and r5, r1, #0x1
    bl func_ov002_021b939c
    ldr r2, _LIT2
    mov r1, r0, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, r0, lsr #0x10
    ldr r2, [r2, #0x5a8]
    mov r3, r3, asr #0x8
    mov r1, r1, lsl #0x10
    cmp r2, #0x7f
    and r6, r0, #0xff
    and r7, r3, #0xff
    mov r3, r1, lsr #0x10
    beq .L_1f8
    cmp r2, #0x80
    bne .L_298
    cmp r7, #0xf
    bne .L_1ec
    ldr r0, _LIT1
    ldr r1, _LIT3
    and r2, r6, #0x1
    mla r0, r2, r0, r1
    mov r1, r3, lsl #0x1
    ldrh r1, [r1, r0]
    and r0, r1, #0xff
    cmp r0, #0x40
    bne .L_1ec
    mov r0, r1, asr #0x8
    and r3, r0, #0xff
    and r0, r3, #0xf0
    mov r0, r0, asr #0x4
    and r2, r0, #0xff
    mov r0, r3, asr #0x1
    and r1, r3, #0xf
    str r2, [sp]
    and r5, r0, #0x1
    mov r3, r3, asr #0x2
    mov r2, r4
    and r4, r3, #0x1
    str r5, [sp, #0x4]
    and r3, r1, #0x1
    mov r0, r6
    mov r1, #0xf
    str r4, [sp, #0x8]
    bl func_ov002_021d8384
    add sp, sp, #0xc
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1ec:
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1f8:
    ldr r0, _LIT4
    mov r1, r4, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_238
    mov r2, #0x0
    mov r0, r6
    mov r1, r7
    mov r3, r2
    bl func_ov002_021de390
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_238:
    cmp r6, r5
    beq .L_278
    ldr r0, _LIT1
    mov r1, #0x14
    ldr r2, _LIT5
    and r3, r6, #0x1
    mla r0, r3, r0, r2
    mul r1, r7, r1
    ldr r0, [r1, r0]
    mov r1, r7
    tst r0, #0x1
    moveq r3, #0x1
    movne r3, #0x0
    mov r0, r6
    mov r2, #0x0
    bl func_ov002_021e2ca4
.L_278:
    mov r0, r6
    mov r1, r7
    mov r2, #0x15
    mov r3, #0x0
    bl func_ov002_021e2ca4
    add sp, sp, #0xc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_298:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022ce1a8
_LIT3: .word data_ov002_022cf814
_LIT4: .word data_ov002_022d0170
_LIT5: .word data_ov002_022cf0cc
