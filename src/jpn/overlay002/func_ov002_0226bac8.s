; func_ov002_0226bac8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae320
        .extern func_ov002_021afff0
        .extern func_ov002_021d46ac
        .extern func_ov002_021d86b4
        .extern func_ov002_021e26d0
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_0226b9e0
        .extern func_ov002_0226ba08
        .extern func_ov002_0226ba68
        .extern func_ov002_022903f0
        .global func_ov002_0226bac8
        .arm
func_ov002_0226bac8:
    stmdb sp!, {r4, lr}
    ldr lr, _LIT0
    ldr r3, _LIT1
    cmp r1, lr
    bgt .L_28
    bge .L_4c
    sub ip, lr, #0x5e
    cmp r1, ip
    beq .L_54
    b .L_58
.L_28:
    add ip, lr, #0x3d
    cmp r1, ip
    bgt .L_3c
    beq .L_54
    b .L_58
.L_3c:
    ldr ip, _LIT2
    cmp r1, ip
    beq .L_54
    b .L_58
.L_4c:
    ldr r3, _LIT3
    b .L_58
.L_54:
    ldr r3, _LIT4
.L_58:
    ldr ip, _LIT5
    ldr ip, [ip, #0xd9c]
    cmp ip, #0x5
    addls pc, pc, ip, lsl #0x2
    b .L_254
    b .L_84
    b .L_cc
    b .L_f8
    b .L_198
    b .L_1d0
    b .L_228
.L_84:
    rsb r2, r0, #0x1
    ldr r1, _LIT6
    and r2, r2, #0x1
    mul r3, r2, r1
    ldr r1, _LIT7
    ldr r1, [r1, r3]
    cmp r1, #0x0
    ldreq r2, _LIT8
    ldreq r1, _LIT9
    streqh r2, [r1, #0xb0]
    mov r1, #0xf4
    bl func_ov002_021ae320
    ldr r1, _LIT5
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, pc}
.L_cc:
    cmp r2, #0x0
    beq .L_e0
    rsb r0, r0, #0x1
    mov r1, #0x1
    bl func_ov002_021e26d0
.L_e0:
    ldr r1, _LIT5
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, pc}
.L_f8:
    ldr ip, _LIT10
    ldr ip, [ip, r0, lsl #0x2]
    cmp ip, #0x1
    bne .L_178
    cmp r2, #0x0
    beq .L_11c
    mov r2, r3
    bl func_ov002_022903f0
    b .L_180
.L_11c:
    rsbs r4, r0, #0x1
    movne r0, #0x8000
    moveq r0, #0x0
    mov r1, #0x0
    orr r0, r0, #0x53
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
    ldr r0, _LIT6
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT7
    ldr r0, [r0, r2]
    bl func_ov002_021afff0
    ldr r2, _LIT9
    ldr r1, _LIT5
    strh r0, [r2, #0xb0]
    mov r0, #0x4
    str r0, [r1, #0xd9c]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_178:
    mov r0, r3
    bl func_ov002_02259204
.L_180:
    ldr r1, _LIT5
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, pc}
.L_198:
    bl func_ov002_0225930c
    cmp r0, #0x0
    ldreq r1, _LIT5
    mov r0, #0x0
    streq r0, [r1, #0xd9c]
    ldmeqia sp!, {r4, pc}
    ldr r2, _LIT5
    ldr r1, _LIT9
    ldr r3, [r2, #0xd78]
    strh r3, [r1, #0xb0]
    ldr r1, [r2, #0xd9c]
    add r1, r1, #0x1
    str r1, [r2, #0xd9c]
    ldmia sp!, {r4, pc}
.L_1d0:
    rsb r0, r0, #0x1
    ldr r3, _LIT11
    ldr r1, _LIT6
    and r2, r0, #0x1
    mla r3, r2, r1, r3
    ldr r1, _LIT9
    add r3, r3, #0x120
    ldrh r2, [r1, #0xb0]
    mov r1, #0xb
    ldr r3, [r3, r2, lsl #0x2]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021d86b4
    ldr r1, _LIT5
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, pc}
.L_228:
    cmp r2, #0x0
    beq .L_23c
    rsb r0, r0, #0x1
    mov r1, #0x0
    bl func_ov002_021e26d0
.L_23c:
    ldr r1, _LIT5
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r4, pc}
.L_254:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001509
_LIT1: .word func_ov002_0226b9e0
_LIT2: .word 0x00001a70
_LIT3: .word func_ov002_0226ba08
_LIT4: .word func_ov002_0226ba68
_LIT5: .word data_ov002_022d008c
_LIT6: .word 0x00000868
_LIT7: .word data_ov002_022cf098
_LIT8: .word 0x0000ffff
_LIT9: .word data_ov002_022d0d8c
_LIT10: .word data_ov002_022cd664
_LIT11: .word data_ov002_022cf08c
