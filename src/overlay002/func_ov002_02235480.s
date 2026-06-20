; func_ov002_02235480 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b8a8
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021c38c4
        .extern func_ov002_021d8128
        .extern func_ov002_021e276c
        .extern func_ov002_021e278c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_022107b4
        .extern func_ov002_02257b48
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02290500
        .global func_ov002_02235480
        .arm
func_ov002_02235480:
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
    bl func_ov002_02257b48
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x49
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
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
    bl func_ov002_02290500
    b .L_9c
.L_94:
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_9c:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_a4:
    bl func_ov002_022593f4
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
    bl func_ov002_021c38c4
    mov r0, r0, lsl #0x1
    strh r0, [r4, #0xa]
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e278c
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_130:
    ldrh r0, [r4, #0x2]
    mov r1, #0x56
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    bl func_ov002_021e2b3c
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
    bl func_ov002_021af9d0
    mov r0, #0x7b
    ldmia sp!, {r4, pc}
.L_178:
    bl func_ov002_021afb74
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8128
    bl func_ov002_021afb74
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
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
    bl func_ov002_021e276c
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1f0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_022107b4
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022d016c
_LIT5: .word 0x00000868
