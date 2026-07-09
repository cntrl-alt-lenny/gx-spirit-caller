; func_ov002_021ca760 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd34c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022cf1a2
        .extern func_0202f994
        .extern func_ov002_021b1e40
        .extern func_ov002_021b204c
        .extern func_ov002_021b2f34
        .extern func_ov002_021b9dec
        .extern func_ov002_021c9a10
        .extern func_ov002_021c9a4c
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021ca760
        .arm
func_ov002_021ca760:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne sl, #0x1
    ldr r1, [r0, #0x810]
    moveq sl, #0x0
    ldrh r6, [r0, #0x2]
    cmp r1, #0x0
    ldrh r7, [r0, #0x4]
    ldrh r8, [r0, #0x6]
    bne .L_2a0
    ldr r0, _LIT1
    and r1, sl, #0x1
    mul r5, r1, r0
    mov r2, #0x14
    and r1, r8, #0x1
    mul r0, r1, r0
    ldr r3, _LIT2
    mul fp, r6, r2
    add r9, r3, r5
    add r1, r9, #0x30
    mul r4, r7, r2
    add r3, r3, r0
    add r2, r3, #0x30
    ldr r1, [r1, fp]
    str r2, [sp, #0x8]
    mov r3, r1, lsl #0x2
    mov r3, r3, lsr #0x18
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    ldr r2, [r2, r4]
    mov r1, r1, lsl #0x12
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r3, r2, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r3, r3, lsl #0x1
    add r2, r3, r2, lsr #0x1f
    ldr r3, _LIT4
    mov ip, #0x0
    str ip, [r3, #0x8]
    str sl, [r3]
    str r8, [r3, #0x4]
    str r6, [r3, #0x1c]
    str r7, [r3, #0x20]
    str r1, [r3, #0x28]
    str ip, [r3, #0x24]
    rsb ip, sl, #0x1
    mov r1, #0x38
    mul r3, ip, r1
    ldr ip, _LIT5
    ldrh r0, [r0, r5]
    str r2, [ip, r3]
    ldr r1, _LIT6
    mov r2, #0x1
    bl func_ov002_021b204c
    ldr r1, _LIT7
    ldr r0, [sp, #0x4]
    add r0, r1, r0
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    bne .L_228
    ldr r1, _LIT8
    ldr r0, [sp, #0x4]
    add r0, r1, r0
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    beq .L_228
    ldr r2, _LIT6
    mov r0, sl
    mov r1, r6
    bl func_ov002_021b2f34
    cmp r0, #0x0
    beq .L_154
    ldr r3, _LIT6
    mov ip, #0x0
    mov r0, sl
    mov r1, #0xb
    mov r2, #0x4
    str ip, [sp]
    bl func_ov002_021b1e40
.L_154:
    mov r0, sl
    mov r1, r6
    bl func_ov002_021b9dec
    ldr r2, _LIT9
    cmp r0, r2
    beq .L_188
    add r1, r2, #0xfa
    cmp r0, r1
    beq .L_204
    rsb r1, r2, #0x2bc0
    cmp r0, r1
    beq .L_20c
    b .L_228
.L_188:
    ldr r1, _LIT10
    ldr r0, _LIT7
    add r1, r1, r5
    ldr r1, [fp, r1]
    add r0, r0, r5
    mov r3, r1, lsr #0x6
    mov r2, r1, lsr #0x2
    and r3, r3, #0x1
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    ldrh r5, [fp, r0]
    mvn r2, r3
    mvn r0, r1
    and r1, r5, r2
    tst r1, r0
    beq .L_228
    ldr r0, [sp, #0x8]
    ldr r0, [r0, r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202f994
    cmp r0, #0x1
    bne .L_228
    ldr r3, _LIT9
    mov r4, #0x0
    mov r0, r8
    mov r1, r7
    mov r2, #0x3
    str r4, [sp]
    bl func_ov002_021b1e40
    b .L_228
.L_204:
    cmp sl, r8
    beq .L_228
.L_20c:
    ldr r3, _LIT6
    mov r4, #0x0
    mov r0, sl
    mov r1, #0xb
    mov r2, #0x4
    str r4, [sp]
    bl func_ov002_021b1e40
.L_228:
    mov r5, #0x0
    ldr fp, _LIT11
    mov r4, r5
.L_234:
    cmp r5, r6
    beq .L_250
    mov r0, sl
    mov r1, r5
    bl func_ov002_021b9dec
    cmp r0, fp
    streq r4, [r9, #0x3c]
.L_250:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r9, r9, #0x14
    ble .L_234
    mov r0, sl
    mov r1, #0x12
    mov r2, #0x1
    bl func_ov002_021c9a4c
    mov r0, #0x1
    mov r1, r0
    bl func_ov002_021c9a10
    mov r1, r6
    mov r2, r8
    mov r3, r7
    mov r0, #0xb
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
.L_2a0:
    mov r0, #0xb
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf1a2
_LIT4: .word data_ov002_022cd314
_LIT5: .word data_ov002_022cd34c
_LIT6: .word 0x00001846
_LIT7: .word data_ov002_022cf0c4
_LIT8: .word data_ov002_022cf0c2
_LIT9: .word 0x00001433
_LIT10: .word data_ov002_022cf0cc
_LIT11: .word 0x00001a79
