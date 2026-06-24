; func_ov002_02232004 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae400
        .extern func_ov002_021d5a6c
        .extern func_ov002_021d5ca4
        .extern func_ov002_021d7c1c
        .extern func_ov002_021e278c
        .extern func_ov002_022107b4
        .extern func_ov002_02257594
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_0226b258
        .extern func_ov002_02290500
        .global func_ov002_02232004
        .arm
func_ov002_02232004:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r3, [r2, #0x5a8]
    sub r3, r3, #0x7d
    cmp r3, #0x3
    addls pc, pc, r3, lsl #0x2
    b .L_1b8
    b .L_108
    b .L_e8
    b .L_84
    b .L_30
.L_30:
    bl func_ov002_02257594
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_6c
    ldrh r1, [r5]
    ldr r2, _LIT2
    bl func_ov002_02290500
    b .L_7c
.L_6c:
    mov r1, #0x49
    bl func_ov002_021ae400
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_7c:
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_84:
    bl func_ov002_022593f4
    cmp r0, #0x0
    moveq r0, #0x80
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT3
    ldr r0, _LIT0
    ldr r4, [r1, #0xd78]
    ldr r3, _LIT4
    str r4, [r0, #0x5ac]
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
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
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_e8:
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b258
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_108:
    ldr r0, _LIT6
    ldrh r4, [r0, #0xb0]
    cmp r4, #0x1
    bne .L_14c
    ldrh r0, [r5, #0x2]
    ldr r4, _LIT4
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mla r4, r3, r1, r4
    ldr r1, [r2, #0x5ac]
    add r2, r4, #0x120
    add r1, r2, r1, lsl #0x2
    mov r2, #0x0
    bl func_ov002_021d7c1c
    b .L_1b0
.L_14c:
    ldrh r1, [r5, #0x2]
    ldr r3, _LIT4
    ldr r0, _LIT5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r1, r1, #0x1
    mla r3, r1, r0, r3
    ldr r0, [r2, #0x5ac]
    add r1, r3, #0x120
    ldr r2, [r1, r0, lsl #0x2]
    ldrh r1, [r5]
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r6, r0, r2, lsr #0x1f
    mov r0, r6
    mov r2, #0x1
    bl func_ov002_021d5ca4
    mov r2, r4, lsl #0x10
    ldrh r1, [r5]
    mov r0, r6
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021d5a6c
.L_1b0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1b8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_022107b4
_LIT3: .word data_ov002_022d016c
_LIT4: .word data_ov002_022cf16c
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022d0e6c
