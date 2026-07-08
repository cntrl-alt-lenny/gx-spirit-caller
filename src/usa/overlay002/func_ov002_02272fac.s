; func_ov002_02272fac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021c3a80
        .extern func_ov002_021d7b2c
        .extern func_ov002_021deb3c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_02270bb8
        .extern func_ov002_022903f0
        .global func_ov002_02272fac
        .arm
func_ov002_02272fac:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    movs r1, r1, lsr #0x18
    beq .L_244
    cmp r1, #0x1
    beq .L_2b0
    cmp r1, #0x2
    beq .L_364
    b .L_36c
.L_244:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_274
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_022903f0
    b .L_284
.L_274:
    mov r1, #0x3a
    bl func_ov002_021ae320
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_284:
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
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2b0:
    bl func_ov002_0225930c
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    ldr r2, _LIT4
    ldr r0, [r0]
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r7, [r2, #0xd70]
    ldr r6, [r2, #0xd74]
    ldr r5, [r2, #0xd78]
    bl func_ov002_021c3a80
    mov r4, r0
    bl func_ov002_021e2a4c
    mov r2, #0x0
    mov r0, r7
    mov r3, r2
    add r1, r6, r5
    bl func_ov002_021deb3c
    ldr r0, _LIT0
    ldr r3, _LIT6
    ldr r0, [r0]
    ldr r1, _LIT7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x120
    add r1, r1, r4, lsl #0x2
    mov r2, #0x0
    bl func_ov002_021d7b2c
    bl func_ov002_021e2b6c
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r1, [r3]
    bic r2, r1, #0xff
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_364:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_36c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_02270bb8
_LIT3: .word data_ov002_022cd238
_LIT4: .word data_ov002_022d008c
_LIT5: .word 0x000015a3
_LIT6: .word data_ov002_022cf08c
_LIT7: .word 0x00000868
