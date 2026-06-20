; func_ov002_0226b73c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021b00d0
        .extern func_ov002_021d479c
        .extern func_ov002_021d7970
        .extern func_ov002_021d7c1c
        .extern func_ov002_021d87a4
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .global func_ov002_0226b73c
        .arm
func_ov002_0226b73c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    mov r8, r0
    ldr r0, [r4, #0xd9c]
    mov r7, r1
    mov r6, r3
    cmp r0, #0x0
    beq .L_370
    cmp r0, #0x1
    beq .L_3c0
    cmp r0, #0x2
    beq .L_4d0
    b .L_4dc
.L_370:
    ldr r0, _LIT1
    cmp r2, #0x0
    strh r2, [r0, #0xb2]
    beq .L_39c
    ldr r0, _LIT2
    and r1, r8, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r2]
    cmp r0, #0x0
    bne .L_3a4
.L_39c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_3a4:
    bl func_ov002_021e2b3c
    mov r1, r4
    ldr r2, [r1, #0xd9c]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_3c0:
    ldr r0, _LIT1
    ldrh r0, [r0, #0xb2]
    cmp r0, #0x0
    beq .L_4b8
    ldr r0, _LIT2
    and r1, r8, #0x1
    mul r5, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r5]
    cmp r0, #0x0
    beq .L_4b8
    bl func_ov002_021b00d0
    mov r1, #0x0
    mov r4, r0
    cmp r8, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x53
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    ldr r1, _LIT4
    mov r0, r8
    add r1, r1, r5
    add r5, r1, #0x120
    ldr r3, [r5, r4, lsl #0x2]
    mov r1, #0xb
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    add r5, r5, r4, lsl #0x2
    bl func_ov002_021d87a4
    cmp r6, #0x0
    beq .L_46c
    mov r0, r8
    mov r1, r4
    mov r2, r7
    bl func_ov002_021d7970
    b .L_484
.L_46c:
    cmp r7, #0x0
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r8
    mov r1, r5
    bl func_ov002_021d7c1c
.L_484:
    ldr r2, [r5]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    strh r0, [r1, #0xb0]
    ldrh r2, [r1, #0xb2]
    mov r0, #0x0
    sub r2, r2, #0x1
    strh r2, [r1, #0xb2]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4b8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4d0:
    bl func_ov002_021e2c5c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4dc:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022d0e6c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf178
_LIT4: .word data_ov002_022cf16c
