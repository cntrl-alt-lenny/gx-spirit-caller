; func_ov011_021cf57c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_02018b14
        .extern func_02018b60
        .extern func_0201be58
        .extern func_0201bec4
        .extern func_0201bf0c
        .extern func_0201c144
        .extern func_0201c64c
        .extern func_ov000_021acd6c
        .extern func_ov000_021acd8c
        .extern func_ov000_021acda4
        .extern func_ov000_021ace18
        .extern func_ov000_021ad3a4
        .extern func_ov000_021adb50
        .extern func_ov000_021aec2c
        .extern func_ov000_021af28c
        .extern func_ov011_021c9c80
        .extern func_ov011_021c9ca0
        .extern func_ov011_021c9db8
        .extern func_ov011_021ca520
        .extern func_ov011_021ca550
        .extern func_ov011_021ca584
        .extern func_ov011_021ca908
        .extern func_ov011_021cb154
        .extern func_ov011_021cdba4
        .extern func_ov011_021cf318
        .global func_ov011_021cf57c
        .arm
func_ov011_021cf57c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2b0]
    mov r0, r0, lsl #0x3
    mov r0, r0, lsr #0x18
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_2a4
    b .L_2e8
    b .L_444
    b .L_4c8
    b .L_5a8
    b .L_61c
.L_2a4:
    bl func_ov000_021acd8c
    cmp r0, #0x0
    beq .L_2c0
    bl func_ov000_021ad3a4
    cmp r0, #0x0
    beq .L_2c0
    bl func_ov011_021c9ca0
.L_2c0:
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0x3
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0x3
    str r0, [r4, #0x274]
    ldmia sp!, {r3, r4, r5, pc}
.L_2e8:
    bl func_ov000_021af28c
    cmp r0, #0x0
    bne .L_43c
    ldr r0, [r4, #0x278]
    mov r1, #0x0
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    str r1, [r4, #0x1e4]
    str r1, [r4, #0x1ec]
    cmp r0, #0x1
    bne .L_344
    add r0, r4, #0x1dc
    bl func_0201bec4
    bl func_0201c64c
    bl func_02018b60
    ldr r0, [r0]
    .word 0xebff86dc
    ldr r1, [r4, #0x278]
    mov r0, #0x0
    bic r1, r1, #0x10
    str r1, [r4, #0x278]
    bl func_ov011_021c9db8
    b .L_348
.L_344:
    bl func_ov011_021cf318
.L_348:
    mov r0, #0x1
    .word 0xebff8727
    mov r0, #0x1
    bl func_ov000_021acda4
    mov r0, #0x0
    bl func_ov000_021acd6c
    ldr r0, _LIT0
    ldr r5, _LIT1
    ldr r0, [r0, #0x220]
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_3cc
    bl GetSystemWork
    ldr r0, [r0, #0x8e8]
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    bne .L_3cc
    bl GetSystemWork
    ldr r0, [r0, #0x8e8]
    mov r0, r0, lsl #0xc
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    bne .L_3cc
    ldr r0, [r5, #0x274]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    bne .L_3cc
    ldr r0, [r5, #0x1ec]
    tst r0, #0x3e000
    movne r0, #0x0
    moveq r0, #0x1
.L_3cc:
    cmp r0, #0x0
    beq .L_3f4
    bl func_ov000_021ad3a4
    cmp r0, #0x0
    bne .L_3f4
    bl GetSystemWork
    ldr r1, [r0, #0x8e8]
    bic r1, r1, #0x80000
    str r1, [r0, #0x8e8]
    bl func_ov011_021c9c80
.L_3f4:
    bl GetSystemWork
    ldr r1, [r0, #0x8e8]
    bic r1, r1, #0x100000
    str r1, [r0, #0x8e8]
    mov r0, #0x0
    bl func_ov000_021ace18
    mov r0, #0x9
    bl func_ov000_021adb50
    bl func_ov011_021ca550
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0x3
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0x3
    str r0, [r4, #0x274]
.L_43c:
    bl func_ov011_021cb154
    ldmia sp!, {r3, r4, r5, pc}
.L_444:
    bl func_ov000_021af28c
    cmp r0, #0x0
    bne .L_4c0
    bl func_ov011_021ca584
    cmp r0, #0x0
    bne .L_4c0
    ldr r0, [r4, #0x264]
    cmp r0, #0x1
    bne .L_48c
    ldr r1, _LIT3
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x2]
.L_48c:
    mov r0, #0x0
    bl func_ov000_021aec2c
    mov r0, #0x0
    .word 0xebff86d4
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0x3
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0x3
    str r0, [r4, #0x274]
.L_4c0:
    bl func_ov011_021cb154
    ldmia sp!, {r3, r4, r5, pc}
.L_4c8:
    .word 0xebff86d6
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT4
    mov r0, #0x1
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x2
    strh r1, [r2]
    bl func_ov000_021aec2c
    bl func_02018b14
    cmp r0, #0x0
    bne .L_580
    mov r0, #0x5
    bl func_0201c144
    bl func_0201bf0c
    mov r5, r0
    bl func_0201be58
    ldr r1, [r4, #0x278]
    orr r0, r0, r5
    bic r1, r1, #0x10
    mov r0, r0, lsl #0x1f
    orr r1, r1, r0, lsr #0x1b
    mov r0, r1, lsl #0x1b
    str r1, [r4, #0x278]
    movs r0, r0, lsr #0x1f
    bne .L_538
    bl func_ov011_021cdba4
.L_538:
    ldr r0, [r4, #0x264]
    cmp r0, #0x0
    beq .L_568
    ldr r0, [r4, #0x278]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    bne .L_568
    ldr r0, [r4, #0x274]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1f
    bne .L_568
    bl func_ov011_021c9ca0
.L_568:
    ldr r1, [r4, #0x274]
    ldr r0, [r4, #0x260]
    bic r1, r1, #0x100
    bic r0, r0, #0x100000
    str r1, [r4, #0x274]
    str r0, [r4, #0x260]
.L_580:
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0x3
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0x3
    str r0, [r4, #0x274]
    ldmia sp!, {r3, r4, r5, pc}
.L_5a8:
    bl func_ov000_021af28c
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_ov000_021ad3a4
    cmp r0, #0x0
    bne .L_5f4
    ldr r0, [r4, #0x264]
    cmp r0, #0x0
    bne .L_5d8
    mov r0, #0x0
    bl func_ov000_021acd6c
    b .L_5e0
.L_5d8:
    mov r0, #0x1
    bl func_ov000_021acd6c
.L_5e0:
    mov r0, #0x0
    bl func_ov000_021acda4
    mov r0, #0x0
    bl func_ov000_021ace18
    bl func_ov011_021c9c80
.L_5f4:
    ldr r2, [r4, #0x274]
    ldr r0, _LIT2
    mov r1, r2, lsl #0x3
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0x3
    str r0, [r4, #0x274]
    ldmia sp!, {r3, r4, r5, pc}
.L_61c:
    bl func_ov000_021af28c
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_ov011_021ca520
    bl func_02018b14
    cmp r0, #0x0
    bne .L_64c
    ldr r0, [r4, #0x278]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    bne .L_64c
    bl func_ov011_021ca908
.L_64c:
    ldr r1, [r4, #0x274]
    ldr r0, _LIT2
    and r0, r1, r0
    str r0, [r4, #0x274]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word 0xe01fffff
_LIT3: .word 0x0400000c
_LIT4: .word 0x0400000e
