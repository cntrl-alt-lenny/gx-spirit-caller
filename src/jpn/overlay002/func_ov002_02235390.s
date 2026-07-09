; func_ov002_02235390 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202b854
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021c37e4
        .extern func_ov002_021d8038
        .extern func_ov002_021e267c
        .extern func_ov002_021e269c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_022106c4
        .extern func_ov002_02257a60
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_022903f0
        .global func_ov002_02235390
        .arm
func_ov002_02235390:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    sub r2, r2, #0x7a
    cmp r2, #0x6
    addls pc, pc, r2, lsl #0x2
    b .L_1f0
    b .L_1c8
    b .L_178
    b .L_150
    b .L_130
    b .L_a4
    b .L_68
    b .L_3c
.L_3c:
    bl func_ov002_02257a60
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x49
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_68:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_94
    ldrh r1, [r4]
    ldr r2, _LIT2
    bl func_ov002_022903f0
    b .L_9c
.L_94:
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_9c:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_a4:
    bl func_ov002_0225930c
    cmp r0, #0x0
    moveq r0, #0x80
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r3, _LIT3
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r2, r0, lsr #0x1f
    ldr r0, _LIT5
    and r2, r2, #0x1
    mla r3, r2, r0, r3
    ldr r0, [r1, #0xd78]
    add r1, r3, #0x120
    ldr r1, [r1, r0, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    strh r0, [r4, #0x8]
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c37e4
    mov r0, r0, lsl #0x1
    strh r0, [r4, #0xa]
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e269c
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_130:
    ldrh r0, [r4, #0x2]
    mov r1, #0x56
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    bl func_ov002_021e2a4c
    mov r0, #0x7c
    ldmia sp!, {r4, pc}
.L_150:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0xa]
    ldrh r2, [r4]
    mov r0, r0, lsl #0x1f
    mov r3, r1, lsl #0x10
    mov r0, r0, lsr #0x1f
    mov r1, #0x6
    bl func_ov002_021af8f0
    mov r0, #0x7b
    ldmia sp!, {r4, pc}
.L_178:
    bl func_ov002_021afa94
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8038
    bl func_ov002_021afa94
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    ldrh r1, [r4, #0xa]
    sub r0, r1, r0
    strh r0, [r4, #0xa]
    ldrh r0, [r4, #0xa]
    cmp r0, #0x0
    movne r0, #0x7c
    moveq r0, #0x7a
    ldmia sp!, {r4, pc}
.L_1c8:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldrh r3, [r4, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x1
    bl func_ov002_021e267c
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1f0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_022106c4
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022d008c
_LIT5: .word 0x00000868
