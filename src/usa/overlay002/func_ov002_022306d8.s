; func_ov002_022306d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae434
        .extern func_ov002_021bad9c
        .extern func_ov002_021de318
        .extern func_ov002_021e0f5c
        .extern func_ov002_021e95b0
        .extern func_ov002_021eb7d8
        .extern func_ov002_021f4170
        .extern func_ov002_02257668
        .extern func_ov002_02257790
        .extern func_ov002_0226ae48
        .extern func_ov002_0226afe0
        .global func_ov002_022306d8
        .arm
func_ov002_022306d8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r5, r0
    ldr r2, [r1, #0x5a8]
    cmp r2, #0x7e
    beq .L_1a4
    cmp r2, #0x7f
    beq .L_174
    cmp r2, #0x80
    bne .L_234
    ldr r1, _LIT1
    mov r4, #0x0
    bl func_ov002_02257790
    cmp r0, #0x0
    ldr r1, _LIT2
    mov r0, r5
    orrne r4, r4, #0x1
    bl func_ov002_02257790
    cmp r0, #0x0
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT3
    ldr r2, _LIT4
    mov r0, r0, lsl #0x1f
    mov r6, r0, lsr #0x1f
    rsb r0, r6, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    orrne r4, r4, #0x2
    cmp r1, #0x0
    ldr r1, _LIT3
    and r2, r6, #0x1
    mul r3, r2, r1
    ldr r1, _LIT5
    orrne r4, r4, #0x4
    ldr r1, [r1, r3]
    cmp r1, #0x2
    bcc .L_c4
    ldr r1, _LIT6
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x0
    beq .L_c0
    ldr r1, _LIT7
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    bne .L_c4
.L_c0:
    orr r4, r4, #0x8
.L_c4:
    cmp r4, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT8
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    mov r1, #0x0
    cmp r0, #0x1
    bne .L_118
    mov r0, #0x1
.L_f8:
    tst r4, r0, lsl r1
    bne .L_10c
    add r1, r1, #0x1
    cmp r1, #0x4
    blt .L_f8
.L_10c:
    ldr r0, _LIT6
    str r1, [r0, #0xd44]
    b .L_168
.L_118:
    ldrh r0, [r5]
    bl func_ov002_021f4170
    mov r8, r0
    ldrh r0, [r5]
    mov r1, #0x1
    bl func_ov002_021f4170
    mov r7, r0
    ldrh r0, [r5]
    mov r1, #0x2
    bl func_ov002_021f4170
    mov r6, r0
    ldrh r0, [r5]
    mov r1, #0x3
    bl func_ov002_021f4170
    stmia sp, {r0, r4}
    ldr r0, _LIT9
    mov r1, r8
    mov r2, r7
    mov r3, r6
    bl func_ov002_021ae434
.L_168:
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_174:
    ldr r0, _LIT6
    ldr r2, [r0, #0xd44]
    str r2, [r1, #0x5ac]
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afe0
    add sp, sp, #0x8
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a4:
    ldr r1, [r1, #0x5ac]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_228
    b .L_1c4
    b .L_1dc
    b .L_1f4
    b .L_214
.L_1c4:
    ldr r1, _LIT1
    bl func_ov002_02257668
    mov r1, r0
    mov r0, r5
    bl func_ov002_021de318
    b .L_228
.L_1dc:
    ldr r1, _LIT2
    bl func_ov002_02257668
    mov r1, r0
    mov r0, r5
    bl func_ov002_021de318
    b .L_228
.L_1f4:
    ldrh r0, [r5, #0x2]
    mov r1, #0x1
    mov r2, #0x2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226ae48
    b .L_228
.L_214:
    ldrh r0, [r5, #0x2]
    mov r1, #0x2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e0f5c
.L_228:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_234:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_021e95b0
_LIT2: .word func_ov002_021eb7d8
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf098
_LIT5: .word data_ov002_022cf09c
_LIT6: .word data_ov002_022d008c
_LIT7: .word 0x0000178b
_LIT8: .word data_ov002_022cd664
_LIT9: .word 0x00000103
