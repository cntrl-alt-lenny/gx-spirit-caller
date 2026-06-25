; func_ov002_021bc288 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf282
        .extern data_ov002_022d0650
        .extern func_ov002_021b4120
        .extern func_ov002_021b8fcc
        .extern func_ov002_021b9ecc
        .global func_ov002_021bc288
        .arm
func_ov002_021bc288:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r1
    mov sl, r0
    cmp r9, #0x4
    bgt .L_178
    mov r0, #0x0
    add fp, r9, sl, lsl #0x4
    str r0, [sp]
.L_20:
    ldr r0, [sp]
    ldr r1, _LIT0
    and r2, r0, #0x1
    ldr r0, _LIT1
    mla r8, r2, r1, r0
    add r0, r8, #0x100
    ldrh r5, [r0, #0x16]
    cmp r5, #0x0
    beq .L_fc
    ldr r0, _LIT2
    sub r4, r0, #0x3bc
.L_4c:
    ldr r0, _LIT3
    add r1, r0, r5, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r5, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bne .L_f4
    ldrh r0, [r1]
    and r6, r0, #0xff
    mov r0, r0, asr #0x8
    and r7, r0, #0xff
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9ecc
    cmp r0, r4
    ldrne r1, _LIT2
    cmpne r0, r1
    bne .L_f4
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r6, #0x1
    mla r1, r2, r1, r0
    mov r0, #0x14
    mla r3, r7, r0, r1
    ldr r1, [r3, #0x3c]
    mov r0, #0x1
    tst r1, r0, lsl fp
    beq .L_f4
    ldr r2, [r3, #0x40]
    ldrh r1, [r3, #0x38]
    mov r0, r2, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r1, r1, r0
    mov r0, r2, lsr #0x2
    orr r0, r0, r2, lsr #0x1
    and r0, r0, #0x1
    mvn r0, r0
    tst r1, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f4:
    cmp r5, #0x0
    bne .L_4c
.L_fc:
    ldr r0, [r8, #0x1c]
    mov r1, #0x0
    cmp r0, #0x0
    bls .L_160
.L_10c:
    add r2, r8, r1, lsl #0x1
    add r2, r2, #0x700
    ldrh r3, [r2, #0x88]
    and r2, r3, #0xff
    cmp r2, #0x40
    bne .L_154
    mov r2, r3, asr #0x8
    and r3, r2, #0xff
    and r2, r3, #0xf
    and r2, r2, #0x1
    cmp sl, r2
    bne .L_154
    and r2, r3, #0xf0
    mov r2, r2, asr #0x4
    and r2, r2, #0xff
    cmp r9, r2
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_154:
    add r1, r1, #0x1
    cmp r1, r0
    bcc .L_10c
.L_160:
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_20
    b .L_2b0
.L_178:
    rsb r0, sl, #0x1
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r2, r0, r1
    ldr r0, _LIT4
    ldrh ip, [r0, r2]
    cmp ip, #0x0
    beq .L_244
    ldr r6, _LIT1
    ldr r7, _LIT3
    ldr r0, _LIT5
    add r8, r9, #0x10
    mov fp, #0x1
    mov lr, #0x14
.L_1b0:
    add r2, r7, ip, lsl #0x3
    ldrh r3, [r2, #0x2]
    ldrh ip, [r2, #0x6]
    mov r3, r3, lsl #0x1c
    mov r3, r3, lsr #0x1c
    cmp r3, #0x6
    bne .L_23c
    ldrh r2, [r2]
    and r3, r2, #0xff
    and r4, r3, #0x1
    mla r3, r4, r1, r6
    mov r2, r2, asr #0x8
    and r4, r2, #0xff
    mla r2, r4, lr, r3
    ldr r3, [r2, #0x30]
    mov r3, r3, lsl #0x13
    mov r3, r3, lsr #0x13
    cmp r3, r0
    bne .L_23c
    ldr r3, [r2, #0x3c]
    tst r3, fp, lsl r8
    beq .L_23c
    ldr r5, [r2, #0x40]
    ldrh r4, [r2, #0x38]
    mov r3, r5, lsr #0x6
    mov r2, r5, lsr #0x2
    orr r2, r2, r5, lsr #0x1
    and r3, r3, #0x1
    mvn r3, r3
    and r2, r2, #0x1
    and r3, r4, r3
    mvn r2, r2
    tst r3, r2
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_23c:
    cmp ip, #0x0
    bne .L_1b0
.L_244:
    and r1, sl, #0xff
    and r0, r9, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r8, #0x0
    ldr r4, _LIT6
    mov r7, r0, lsr #0x10
    mov r5, r8
.L_264:
    mov r6, r5
.L_268:
    mov r0, r8
    mov r1, r6
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    beq .L_298
    mov r0, r8
    mov r1, r6
    mov r2, r4
    bl func_ov002_021b4120
    cmp r7, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_298:
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_268
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_264
.L_2b0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x000017ee
_LIT3: .word data_ov002_022d0650
_LIT4: .word data_ov002_022cf282
_LIT5: .word 0x00001aa9
_LIT6: .word 0x00001472
