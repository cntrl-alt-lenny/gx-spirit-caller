; func_ov002_0226a414 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021afff0
        .extern func_ov002_021b0a2c
        .extern func_ov002_021b0a74
        .extern func_ov002_021b0afc
        .extern func_ov002_021b0b24
        .extern func_ov002_021b3dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021d46ac
        .extern func_ov002_021df590
        .extern func_ov002_021e267c
        .global func_ov002_0226a414
        .arm
func_ov002_0226a414:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r4, _LIT0
    ldr r1, _LIT1
    ldrh r3, [r4, #0xa2]
    ldr r2, [r1, #0xd9c]
    ldr r7, [r1, #0xd94]
    mov r0, r3, asr #0x8
    and r9, r0, #0xff
    ldrh r0, [r4, #0xa0]
    cmp r2, #0x0
    and r8, r3, #0xff
    str r0, [sp]
    beq .L_48
    cmp r2, #0x1
    beq .L_fc
    cmp r2, #0x2
    beq .L_180
    b .L_1bc
.L_48:
    mov sl, #0x0
    strh sl, [r4, #0xb0]
    strh sl, [r4, #0xb2]
    cmp r8, #0x0
    ble .L_a0
    mov fp, sl
    mov r5, #0x1
    mov r6, #0x2
.L_68:
    mov r0, r6
    bl func_ov002_021afff0
    ldrh r1, [r4, #0xb0]
    cmp r0, r9
    add sl, sl, #0x1
    add r0, r0, r1, lsl #0x1
    strh r0, [r4, #0xb0]
    moveq r1, r5
    movne r1, fp
    ldrh r0, [r4, #0xb2]
    cmp sl, r8
    add r0, r0, r1
    strh r0, [r4, #0xb2]
    blt .L_68
.L_a0:
    cmp r7, #0x0
    movne r2, #0x8000
    ldr r3, _LIT0
    moveq r2, #0x0
    and r1, r8, #0xff
    and r0, r9, #0xff
    orr r4, r1, r0, lsl #0x8
    orr r2, r2, #0x5c
    ldr r0, [sp]
    mov r1, r2, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r0, r1, lsr #0x10
    ldrh r3, [r3, #0xb0]
    mov r4, r4, lsl #0x10
    mov r1, r2, lsr #0x10
    mov r2, r4, lsr #0x10
    bl func_ov002_021d46ac
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fc:
    ldr r1, _LIT2
    mov r0, r7
    mvn r2, #0x0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_1bc
    ldr r2, _LIT2
    mov r0, r7
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    bne .L_1bc
    ldr r0, _LIT3
    ldr r0, [r0, r7, lsl #0x2]
    cmp r0, #0x1
    bne .L_160
    mov r1, r4
    ldrh r1, [r1, #0xb2]
    add r0, r8, r8, lsr #0x1f
    cmp r1, r0, asr #0x1
    movle r1, #0x1
    ldr r0, _LIT1
    movgt r1, #0x0
    str r1, [r0, #0xd44]
    b .L_168
.L_160:
    ldr r0, _LIT4
    bl func_ov002_021ae3a4
.L_168:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_180:
    ldr r0, [r1, #0xd44]
    cmp r0, #0x0
    beq .L_1bc
    ldr r1, _LIT2
    mov r0, r7
    bl func_ov002_021df590
    ldr r1, _LIT2
    mov r0, r7
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e267c
    ldr r1, _LIT1
    mov r0, #0x0
    str r0, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1bc:
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    cmp r7, r0
    bne .L_20c
    ldr r1, _LIT0
    add r0, r8, r8, lsr #0x1f
    ldrh r1, [r1, #0xb2]
    cmp r1, r0, asr #0x1
    mov r0, #0x33
    ble .L_204
    mov r1, #0x1
    bl func_ov002_021b0b24
    mov r0, #0x33
    bl func_ov002_021b0a2c
    mov r1, r0
    mov r0, #0x34
    bl func_ov002_021b0afc
    b .L_20c
.L_204:
    mov r1, #0x0
    bl func_ov002_021b0a74
.L_20c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0d8c
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x0000150f
_LIT3: .word data_ov002_022cd664
_LIT4: .word 0x0000011f
_LIT5: .word data_ov002_022cd65c
