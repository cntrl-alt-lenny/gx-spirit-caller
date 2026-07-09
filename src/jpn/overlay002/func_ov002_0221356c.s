; func_ov002_0221356c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_0202b89c
        .extern func_0202b8fc
        .extern func_0202e1e0
        .extern func_ov002_021d6624
        .extern func_ov002_021de318
        .extern func_ov002_021e2460
        .extern func_ov002_021e267c
        .extern func_ov002_021e26d0
        .extern func_ov002_021e2a2c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021e8a44
        .extern func_ov002_021f1da4
        .extern func_ov002_02213564
        .extern func_ov002_02257668
        .extern func_ov002_02257790
        .extern func_ov002_02259204
        .global func_ov002_0221356c
        .arm
func_ov002_0221356c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    ldr r7, _LIT0
    ldr r1, [r7, #0x5a8]
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    sub r1, r1, #0x7b
    cmp r1, #0x5
    rsb r8, r2, #0x1
    addls pc, pc, r1, lsl #0x2
    b .L_2e4
    b .L_288
    b .L_220
    b .L_1cc
    b .L_c8
    b .L_98
    b .L_48
.L_48:
    mov r0, r8
    mov r1, #0x1
    bl func_ov002_021e26d0
    mov r6, #0x0
    mov r5, #0x1
.L_5c:
    mov r0, r4
    mov r1, r8
    mov r2, r6
    bl func_ov002_021e8a44
    cmp r0, #0x0
    beq .L_84
    mov r0, r8
    mov r1, r6
    mov r2, r5
    bl func_ov002_021d6624
.L_84:
    add r6, r6, #0x1
    cmp r6, #0xa
    ble .L_5c
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_98:
    bl func_ov002_021e2a4c
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_02257668
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de318
    mov r0, r7
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c8:
    ldr r2, _LIT2
    and r1, r8, #0x1
    mul r0, r1, r2
    str r0, [sp]
    ldr r3, _LIT3
    ldr r1, [sp]
    ldr r0, [r7, #0x5ac]
    ldr r1, [r3, r1]
    cmp r0, r1
    bcs .L_1c4
    ldr r3, _LIT4
    ldr r1, [sp]
    sub r6, r2, #0x28c
    ldr fp, _LIT5
    add sl, r3, r1
    mov r5, r6
.L_108:
    add r0, sl, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_1ac
    ldrh r1, [r4]
    mov r2, #0x0
    cmp r1, fp
    beq .L_148
    ldr r0, _LIT6
    cmp r1, r0
    beq .L_160
    b .L_174
.L_148:
    mov r0, r9
    bl func_0202b89c
    cmp r0, r6
    movge r2, #0x1
    movlt r2, #0x0
    b .L_174
.L_160:
    mov r0, r9
    bl func_0202b8fc
    cmp r0, r5
    movle r2, #0x1
    movgt r2, #0x0
.L_174:
    cmp r2, #0x0
    beq .L_1ac
    ldr r0, _LIT0
    ldr r2, _LIT4
    ldr r1, [r0, #0x5ac]
    ldr r0, [sp]
    mov r3, #0x1
    add r0, r2, r0
    add r2, r0, #0x120
    mov r0, r8
    add r2, r2, r1, lsl #0x2
    bl func_ov002_021e2460
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ac:
    ldr r0, [r7, #0x5ac]
    add r0, r0, #0x1
    str r0, [r7, #0x5ac]
    ldr r1, [sl, #0xc]
    cmp r0, r1
    bcc .L_108
.L_1c4:
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1cc:
    bl func_ov002_021e2b6c
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT7
    mov r1, r1, lsl #0x1f
    ldr r0, [r0, #0xcec]
    mov r3, r1, lsr #0x1f
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    add r0, r0, #0x4
    and r0, r0, #0xff
    mov r0, r0, lsl #0x4
    orr r0, r0, #0x1
    mov r2, r0, lsl #0x10
    rsb r0, r3, #0x1
    ldrh r1, [r4]
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021e267c
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_220:
    ldr r1, _LIT2
    and r2, r8, #0x1
    mul r3, r2, r1
    ldr r1, _LIT3
    ldr r1, [r1, r3]
    cmp r1, #0x0
    bne .L_250
    ldr r1, _LIT8
    bl func_ov002_02257790
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_250:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT9
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_278
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    b .L_280
.L_278:
    ldr r0, _LIT10
    bl func_ov002_02259204
.L_280:
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_288:
    mov r6, #0x0
    mov r5, r6
.L_290:
    mov r0, r4
    mov r1, r8
    mov r2, r6
    bl func_ov002_021e8a44
    cmp r0, #0x0
    beq .L_2b8
    mov r0, r8
    mov r1, r6
    mov r2, r5
    bl func_ov002_021d6624
.L_2b8:
    add r6, r6, #0x1
    cmp r6, #0xa
    ble .L_290
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_021f1da4
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf098
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x0000123b
_LIT6: .word 0x0000188c
_LIT7: .word data_ov002_022d008c
_LIT8: .word func_ov002_021e8a44
_LIT9: .word data_ov002_022cd664
_LIT10: .word func_ov002_02213564
