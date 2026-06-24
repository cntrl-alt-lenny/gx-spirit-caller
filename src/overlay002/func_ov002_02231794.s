; func_ov002_02231794 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern func_0202b8a8
        .extern func_ov002_021ae400
        .extern func_ov002_021b9aa8
        .extern func_ov002_021de910
        .extern func_ov002_021ff46c
        .extern func_ov002_022107b4
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_0227adb8
        .extern func_ov002_02290500
        .global func_ov002_02231794
        .arm
func_ov002_02231794:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r4, r1
    ldr r3, [r2, #0x5a8]
    mov r6, r0
    sub r1, r3, #0x7c
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_1d8
    b .L_184
    b .L_140
    b .L_1d8
    b .L_e0
    b .L_38
.L_38:
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_d8
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_d8
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r4, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    add r1, r2, #0x30
    mul r0, r5, r0
    ldr r1, [r1, r0]
    ldr r3, _LIT0
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add ip, r0, r1, lsr #0x1f
    mov r0, r6
    mov r1, r4
    mov r2, r5
    str ip, [r3, #0x5ac]
    bl func_ov002_021de910
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_d8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_e0:
    ldrh r0, [r6, #0x2]
    ldr r1, [r2, #0x5ac]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b9aa8
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0, #0x5ac]
    mov r0, r0, lsl #0x2
    ldrh r0, [r1, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    strh r0, [r6, #0xc]
    mov r0, r6
    mov r1, r4
    bl func_ov002_021ff46c
    cmp r0, #0x0
    movne r0, #0x7d
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_140:
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_16c
    ldrh r1, [r6]
    ldr r2, _LIT5
    bl func_ov002_02290500
    b .L_17c
.L_16c:
    ldr r1, _LIT6
    bl func_ov002_021ae400
    ldr r0, _LIT5
    bl func_ov002_022592ec
.L_17c:
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, pc}
.L_184:
    bl func_ov002_022593f4
    cmp r0, #0x0
    moveq r0, #0x7d
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    ldrh r3, [r6]
    ldr r5, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT2
    and r4, r0, #0x1
    mla r5, r4, r1, r5
    ldr r2, _LIT7
    mov r3, r3, lsl #0x10
    ldr r1, [r2, #0xd78]
    add r2, r5, #0x120
    add r1, r2, r1, lsl #0x2
    mov r2, #0x1
    bl func_ov002_0227adb8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1d8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d0250
_LIT4: .word data_ov002_022cd744
_LIT5: .word func_ov002_022107b4
_LIT6: .word 0x0000011e
_LIT7: .word data_ov002_022d016c
