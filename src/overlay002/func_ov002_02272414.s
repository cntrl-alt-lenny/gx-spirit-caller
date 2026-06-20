; func_ov002_02272414 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern data_ov002_022d016c
        .extern func_ov002_021ae4bc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021df62c
        .extern func_ov002_021e276c
        .extern func_ov002_0226eb5c
        .extern func_ov002_02271ab4
        .global func_ov002_02272414
        .arm
func_ov002_02272414:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r5, _LIT0
    ldr r1, [r5, #0x18]
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_24
    cmp r0, #0x1
    beq .L_128
    b .L_278
.L_24:
    ldr r0, [r5]
    mov r2, #0x2
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1e
    ldr r0, _LIT0
    movne r4, #0x40
    ldrh r1, [r0, #0x16]
    ldr r5, [r0]
    moveq r4, #0x10
    mov r3, r1, lsl #0x1a
    mov r0, r5, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r5, lsr #0x17
    mov r3, r3, lsr #0x1e
    bl func_ov002_0226eb5c
    and r0, r4, r0
    cmp r0, #0x0
    ble .L_f0
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r1, [r0, #0x16]
    ldr r5, [r0]
    mov r0, r5, lsl #0x1f
    mov r3, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r5, lsr #0x17
    mov r3, r3, lsr #0x1e
    bl func_ov002_0226eb5c
    and r0, r4, r0
    cmp r0, #0x0
    ble .L_e0
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_d0
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_fc
.L_d0:
    mov r1, r2, lsr #0x17
    mov r0, #0x72
    bl func_ov002_021ae4bc
    b .L_fc
.L_e0:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_fc
.L_f0:
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd44]
.L_fc:
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_128:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    beq .L_270
    mov fp, #0x0
    ldr r8, _LIT4
    strb fp, [r5, #0x8]
    strh r8, [r5, #0x6]
    ldr r0, [r5]
    ldr r4, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mul r1, r0, r4
    ldr r0, _LIT6
    ldr r0, [r0, r1]
    subs r9, r0, #0x1
    bmi .L_228
    ldr r7, _LIT7
    mov sl, r9, lsl #0x2
    mov r6, #0xb
.L_17c:
    ldr r0, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r2, r1, r4, r7
    add r1, r2, sl
    ldr r1, [r1, #0x418]
    mov r1, r1, lsl #0x13
    cmp r8, r1, lsr #0x13
    bne .L_21c
    add r1, r2, #0x18
    add r1, r1, #0x400
    ldr r3, [r1, sl]
    mov r1, r6
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov ip, r2, lsl #0x1
    mov r2, r8
    add r3, ip, r3, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_21c
    ldr r0, _LIT0
    ldr r2, _LIT7
    ldr r1, [r0]
    ldr r0, _LIT5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r1, r1, #0x1
    mla r0, r1, r0, r2
    add r0, r0, #0x18
    add r0, r0, #0x400
    ldr r1, [r0, r9, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add fp, r0, r1, lsr #0x1f
    b .L_228
.L_21c:
    sub sl, sl, #0x4
    subs r9, r9, #0x1
    bpl .L_17c
.L_228:
    ldr r0, _LIT0
    mov r2, fp
    ldr r0, [r0]
    mov r1, #0xe
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df62c
    ldr r0, _LIT0
    mov r2, fp, lsl #0x10
    ldr r0, [r0]
    mov r3, r2, lsr #0x10
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT4
    mov r0, r0, lsr #0x1f
    mov r2, #0x5
    bl func_ov002_021e276c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_270:
    bic r0, r1, #0xff
    str r0, [r5, #0x18]
.L_278:
    bl func_ov002_02271ab4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cd318
_LIT4: .word 0x0000197f
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf180
_LIT7: .word data_ov002_022cf16c
