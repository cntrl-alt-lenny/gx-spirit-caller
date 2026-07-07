; func_ov002_0226cb1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_02280594
        .global func_ov002_0226cb1c
        .arm
func_ov002_0226cb1c:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    ldr r4, [r3, #0xd9c]
    mov r3, r2
    cmp r4, #0x0
    beq .L_2a8
    cmp r4, #0x1
    beq .L_36c
    b .L_390
.L_2a8:
    ldr r3, _LIT1
    ldr r3, [r3, r0, lsl #0x2]
    cmp r3, #0x1
    bne .L_2f4
    bl func_ov002_02280594
    bl func_ov002_021afa94
    mov r4, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    ldr r0, _LIT2
    add r1, r1, r2, lsr #0x1f
    strh r1, [r0, #0xb0]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_2f4:
    ldr r2, _LIT3
    cmp r1, r2
    bgt .L_314
    bge .L_340
    sub r2, r2, #0x2a
    cmp r1, r2
    beq .L_334
    b .L_34c
.L_314:
    ldr r2, _LIT4
    cmp r1, r2
    bgt .L_328
    beq .L_334
    b .L_34c
.L_328:
    ldr r2, _LIT5
    cmp r1, r2
    bne .L_34c
.L_334:
    mov r1, #0xf0
    bl func_ov002_021ae320
    b .L_354
.L_340:
    mov r1, #0xef
    bl func_ov002_021ae320
    b .L_354
.L_34c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_354:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, pc}
.L_36c:
    mov r2, r1
    mov r1, #0x6
    bl func_ov002_021af8f0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, pc}
.L_390:
    bl func_ov002_021afa94
    mov r4, r0
    bl func_ov002_021afa94
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    ldr r0, _LIT2
    add r1, r1, r2, lsr #0x1f
    strh r1, [r0, #0xb0]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d0d8c
_LIT3: .word 0x00001365
_LIT4: .word 0x00001488
_LIT5: .word 0x00001990
