; func_ov002_0222f080 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae484
        .extern func_ov002_021af9d0
        .extern func_ov002_021b004c
        .extern func_ov002_021b4618
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_021de408
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0225368c
        .extern func_ov002_02257704
        .extern func_ov002_0227adb8
        .global func_ov002_0222f080
        .arm
func_ov002_0222f080:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7b
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_214
    b .L_1b8
    b .L_19c
    b .L_16c
    b .L_13c
    b .L_84
    b .L_38
.L_38:
    bl func_ov002_02257704
    mov r5, r0
    mov r0, r4
    mov r1, r5
    bl func_ov002_021de408
    and r0, r5, r0
    bl func_ov002_021b4618
    movs r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    strneh r5, [r4, #0xa]
    movne r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_84:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    ldrh r1, [r4, #0x2]
    mov r5, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r5, r0
    blt .L_cc
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    mov r5, r0
.L_cc:
    cmp r5, #0x0
    beq .L_120
    ldrh r0, [r4, #0xa]
    cmp r0, r5
    movge r0, r5
    strh r0, [r4, #0xa]
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_110
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_118
.L_110:
    mov r0, #0x2f
    bl func_ov002_021ae484
.L_118:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_120:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_13c:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_16c:
    ldrh r1, [r4, #0xa]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    cmp r1, #0x20
    movcs r1, #0x20
    mov r0, r0, lsl #0x1f
    add r1, r1, #0x27
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, pc}
.L_19c:
    bl func_ov002_021e2b3c
    ldr r1, _LIT2
    ldr r0, _LIT0
    ldr r2, [r1, #0xd44]
    mov r1, #0x0
    str r2, [r0, #0x5ac]
    strh r1, [r4, #0x8]
.L_1b8:
    ldr r0, _LIT0
    ldrh r1, [r4, #0x8]
    ldr r0, [r0, #0x5ac]
    cmp r1, r0
    bge .L_208
    add r0, r1, #0x1
    bl func_ov002_021b004c
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldrh r2, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
    ldrh r1, [r4, #0x8]
    mov r0, #0x7b
    add r1, r1, #0x1
    strh r1, [r4, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_208:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_214:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x00000122
_LIT4: .word 0x0000011d
