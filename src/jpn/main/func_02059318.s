; func_02059318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100284
        .extern data_02100328
        .extern data_0210033c
        .extern data_02100378
        .extern data_02100398
        .extern data_021003b0
        .extern data_021003b8
        .extern data_021003c8
        .extern data_02100460
        .extern data_0210046c
        .extern data_02100478
        .extern data_02100494
        .extern data_0210049c
        .extern data_021004a4
        .extern data_021004b0
        .extern data_021004b8
        .extern data_021004bc
        .extern data_021004c8
        .extern data_021004d4
        .extern data_0219e354
        .extern func_020547f4
        .extern func_02057fc4
        .extern func_02057ffc
        .extern func_02059ca8
        .extern func_0205d554
        .extern func_020a9698
        .extern func_020aace8
        .global func_02059318
        .arm
func_02059318:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x28c
    mov r5, r1
    mov r6, r0
    add r0, r5, #0x80
    mov r1, #0x20
    ldr r4, [r6]
    bl func_02059ca8
    add r0, r5, #0x100
    ldrsb r0, [r0, #0xc2]
    cmp r0, #0x0
    ldrne r0, _LIT0
    addne r7, r5, r0
    ldreq r0, _LIT1
    addeq r7, r4, r0
    mov r0, r7
    bl func_020aace8
    mov r1, r0
    mov r0, r7
    add r2, r5, #0xa1
    bl func_020547f4
    ldrsb r0, [r5, #0xc2]
    cmp r0, #0x0
    addne r0, r5, #0xc2
    bne .L_9c
    add r0, r4, #0x100
    ldrsb r0, [r0, #0x2f]
    cmp r0, #0x0
    ldrne r0, _LIT2
    addne r0, r4, r0
    bne .L_9c
    add r0, sp, #0x200
    ldr r1, _LIT3
    add r0, r0, #0x35
    add r2, r4, #0x110
    add r3, r4, #0x144
    bl func_020a9698
    add r0, sp, #0x200
    add r0, r0, #0x35
.L_9c:
    str r0, [sp]
    add r0, r5, #0x80
    str r0, [sp, #0x4]
    ldr r1, _LIT4
    ldr r3, _LIT5
    add r0, sp, #0x35
    str r5, [sp, #0x8]
    add r2, r5, #0xa1
    str r2, [sp, #0xc]
    bl func_020a9698
    add r0, sp, #0x35
    bl func_020aace8
    mov r1, r0
    add r0, sp, #0x35
    add r2, sp, #0x14
    bl func_020547f4
    ldr r0, [r4, #0x100]
    cmp r0, #0x0
    beq .L_118
    add r3, sp, #0x10
    mov r0, r6
    add r1, r4, #0x110
    add r2, r4, #0x144
    bl func_0205d554
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    ldrne r0, [r0, #0x4]
    strne r0, [r4, #0x19c]
    ldrne r0, [sp, #0x10]
    ldrne r0, [r0]
    strne r0, [r4, #0x1a0]
.L_118:
    ldr r2, _LIT6
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, _LIT7
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    add r2, r5, #0x80
    bl func_02057ffc
    ldrsb r0, [r5, #0xc2]
    cmp r0, #0x0
    beq .L_178
    ldr r2, _LIT8
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    add r2, r5, #0xc2
    bl func_02057ffc
    b .L_1f0
.L_178:
    add r0, r4, #0x100
    ldrsb r0, [r0, #0x2f]
    cmp r0, #0x0
    beq .L_1b0
    ldr r2, _LIT9
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, _LIT2
    mov r0, r6
    add r1, r4, #0x1f4
    add r2, r4, r2
    bl func_02057ffc
    b .L_1f0
.L_1b0:
    ldr r2, _LIT10
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    add r2, r4, #0x110
    bl func_02057ffc
    ldr r2, _LIT11
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    add r2, r4, #0x144
    bl func_02057ffc
.L_1f0:
    ldr r0, [r4, #0x19c]
    cmp r0, #0x0
    beq .L_21c
    ldr r2, _LIT12
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x19c]
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057fc4
.L_21c:
    ldr r0, [r4, #0x1a0]
    cmp r0, #0x0
    beq .L_248
    ldr r2, _LIT13
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x1a0]
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057fc4
.L_248:
    ldr r2, _LIT14
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    add r2, sp, #0x14
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r0, [r4, #0x10c]
    cmp r0, #0x1
    bne .L_284
    ldr r2, _LIT15
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
.L_284:
    ldr r2, _LIT16
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r1, [r4, #0x208]
    mov r0, r6
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r1, asr #0x8
    mov r1, r1, lsl #0x8
    and r2, r2, #0xff
    and r1, r1, #0xff00
    orr r1, r2, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r1, lsl #0x10
    add r1, r4, #0x1f4
    mov r2, r2, asr #0x10
    bl func_02057fc4
    ldr r2, _LIT17
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x46c]
    mov r0, r6
    add r1, r4, #0x1f4
    bl func_02057fc4
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, _LIT18
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, _LIT19
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, _LIT20
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, [r4, #0x470]
    bl func_02057fc4
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, _LIT21
    bl func_02057ffc
    mov r0, r6
    add r1, r4, #0x1f4
    ldr r2, _LIT22
    bl func_02057ffc
    mov r0, #0x0
    add sp, sp, #0x28c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x000001c2
_LIT1: .word 0x00000177
_LIT2: .word 0x0000012f
_LIT3: .word data_021003b0
_LIT4: .word data_021003b8
_LIT5: .word data_021003c8
_LIT6: .word data_0210049c
_LIT7: .word data_02100328
_LIT8: .word data_021004a4
_LIT9: .word data_02100398
_LIT10: .word data_021004b0
_LIT11: .word data_021004b8
_LIT12: .word data_0210033c
_LIT13: .word data_02100378
_LIT14: .word data_021004bc
_LIT15: .word data_021004c8
_LIT16: .word data_021004d4
_LIT17: .word data_02100460
_LIT18: .word data_0210046c
_LIT19: .word data_0219e354
_LIT20: .word data_02100478
_LIT21: .word data_02100494
_LIT22: .word data_02100284
