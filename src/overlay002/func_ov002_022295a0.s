; func_ov002_022295a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae4bc
        .extern func_ov002_021b97d4
        .extern func_ov002_021c3b60
        .extern func_ov002_021d479c
        .extern func_ov002_021df73c
        .extern func_ov002_021e278c
        .extern func_ov002_0226b094
        .global func_ov002_022295a0
        .arm
func_ov002_022295a0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_218
    b .L_19c
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_12c
    b .L_b0
    b .L_64
    b .L_44
.L_44:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b094
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_64:
    ldr r0, _LIT1
    ldrh r0, [r0, #0xb0]
    cmp r0, #0x0
    movne r0, #0x78
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r2, r1
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x5e
    mov r0, r0, lsl #0x10
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_b0:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3b60
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    blt .L_114
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT3
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_f8
    ldr r0, _LIT4
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_10c
.L_f8:
    ldr r1, _LIT2
    bl func_ov002_021b97d4
    mov r1, r0
    ldr r0, _LIT5
    bl func_ov002_021ae4bc
.L_10c:
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_114:
    mov r0, r0, lsl #0x1f
    mov r1, #0x12c
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_12c:
    ldr r0, _LIT4
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3b60
    ldrh r1, [r4, #0x2]
    mov r4, r0
    ldr r3, _LIT6
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT7
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x120
    ldr r2, [r1, r4, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021e278c
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_19c:
    ldrh r0, [r4, #0x2]
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x5e
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0x1
    bl func_ov002_021d479c
    ldr r0, _LIT6
    ldrh r1, [r4, #0x2]
    ldr r3, [r0]
    ldr r2, [r0, #0x868]
    mov r0, r1, lsl #0x1f
    add r1, r3, r2
    add r1, r1, #0x1
    mov r5, r1, asr #0x1
    mov r0, r0, lsr #0x1f
    mov r1, r5
    rsb r0, r0, #0x1
    bl func_ov002_021df73c
    ldrh r0, [r4, #0x2]
    mov r1, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df73c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_218:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
_LIT2: .word 0x0000167b
_LIT3: .word data_ov002_022cd744
_LIT4: .word data_ov002_022d016c
_LIT5: .word 0x0000012b
_LIT6: .word data_ov002_022cf16c
_LIT7: .word 0x00000868
